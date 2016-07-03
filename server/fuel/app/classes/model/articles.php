<?php
namespace Model;
use \Fuel\Core\Log;
use \Fuel\Core\Request;

class Articles extends Base {
	
	/**
	 * 旅行誌ファイルアップロード（複数同時アップロードは可能）
	 *
	 */
	public static function receive_upload() {
		try {
			\DB::start_transaction();
			$date_jst = self::get_date_jst();
			// このアップロードのカスタム設定
			$upload_config = array('path' => DOCROOT. '../fuel/app/tmp/upload/'. $date_jst,
					'randomize' => true,
					'max_size' => 2097152
				);
			self::upload_file($upload_config);
			if(count(self::$uploaded_files_error) > 0) {
				throw new \MarcoPandaException(5);
			}
			Log::warning('file uploaded: '. var_export(self::$uploaded_files, true));
			$inserted_ids = array();
			foreach(self::$uploaded_files as $key => $file) {
				$insert_result = \DB::insert('multimedia')->set(array(
					'media_type' => 1,	// 画像
					'mime_type' => $file['mimetype'],
					'filename' => $file['name'],
					'save_path' => $date_jst. DS. $file['saved_as'],
					'created_at' => self::get_datetime_jst(),
				))->execute();
				$inserted_ids[] = $insert_result[0];
			}
			$inserted_save_path = \DB::select('multimedia_id', 'save_path')
				->from('multimedia')
				->where('multimedia_id', 'in', $inserted_ids)
				->execute()
				->as_array();
			\DB::commit_transaction();
			
			$received_files = array();
			foreach($inserted_save_path as $key => $value) {
				$received_files[] = array(
					'multimedia_id' => $value['multimedia_id'],
					'download_url' => '/multimedia/download?path='. $value['save_path'],
				);
			}
			$return_data = array('files' => $received_files);
			return $return_data;
				
		} catch(\Exception $e) {
			\DB::rollback_transaction();
			throw $e;
		}
	}

	/**
	 * 旅行誌投稿
	 *
	 */
	public static function regist($data)
	{
		try {
			// 入力チェック
			if(empty($data['spot_id'])) {
				if(empty($data['longitude'])) {
					throw new \MarcoPandaException(3);
				}
				if(empty($data['latitude'])) {
					throw new \MarcoPandaException(4);
				}
				if(empty($data['category_id'])) {
					throw new \MarcoPandaException(1);
				}
				if(empty($data['cost_id'])) {
					throw new \MarcoPandaException(2);
				}
			}
			if((!isset($data['multimedia_id']) || count($data['multimedia_id']) == 0) && empty($data['article_text'])) {
				throw new \MarcoPandaException(6);
			}
			if(!empty($data['sex'])) {
				if(!in_array($data['sex'], array(1, 2))) {
					throw new \MarcoPandaException(12);
				}
			}
			if(!empty($data['generation'])) {
				if(!in_array($data['generation'], array(1, 9))) {
					throw new \MarcoPandaException(13);
				}
			}

			if(empty($data['spot_id'])) {
				// Google APIを利用して地名取得
				$GOOGLE_API_KEY = \Config::get('GOOGLE_API_KEY');
				$google_api_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={$data['latitude']},{$data['longitude']}&key={$GOOGLE_API_KEY}";
				
				// $curl = Request::forge($google_api_url, 'curl');
				// $curl->set_option(CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
				// 
				// // assume some parameters and options were set, and execute
				// $curl->execute();
				// 
				// // fetch the resulting Response object
				// $google_result = $curl->response();
				$google_result = shell_exec("curl $google_api_url");
				//\Log::warning("result: ". $google_result);
				//$google_result = file_get_contents($google_api_url);
				if($google_result != NULL && $google_result != '') {
					$google_result_json = json_decode($google_result, true);
					//\Log::warning(print_r($google_result_json, true));
					if($google_result_json['status'] !== 'OK') {
						\Log::error($google_api_url);
						throw new \MarcoPandaException(9);
					}
					$address_components = $google_result_json['results'];
					$location_name = '';

					foreach($address_components as $key => $value) {
						//\Log::warning(print_r($value, true));
						$location_name = $value['formatted_address'];
						break;

						// 取得した複数件場所情報から、経度緯度一致して、住所名は一番長い物を取得する
						// if($value['geometry']['location']['lat'] == $data['latitude'] &&
						// $value['geometry']['location']['lng'] == $data['longitude']) {
						// 	if(strlen($value['formatted_address']) > $location_name) {
						// 		$location_name = $value['formatted_address'];
						// 	}
						// }
					}
					if($location_name == '') {
						throw new \MarcoPandaException(10);
					}
				}

			} else {
				// TODO:スポット情報更新
				
			}

			// DB処理
			\DB::start_transaction();
			// スポット登録
			if(empty($data['spot_id'])) {
				$db_result = \DB::insert('spot')
					->set(array(
						'location_name' => $location_name,
						'longitude' => $data['longitude'],
						'latitude' => $data['latitude'],
						'cost_id' => $data['cost_id'],
					))->execute();
				if($db_result[1] != 0) {
					$spot_id = $db_result[0];
				} else {
					throw new \MarcoPandaException(11);
				}
			}
			// ユーザ登録・情報更新
			// TODO: move the code into user model
			if(!empty($data['user_uuid'])) {
				$user_update_result = \DB::update('user')
					->set(array(
						'come_from' => 0,
						'nickname' => isset($data['nickname'])?$data['nickname']:null,
						'sex' => isset($data['sex'])?$data['sex']:null,
						'generation' => isset($data['generation'])?$data['generation']:null,
						'country' => isset($data['text_language_code '])?$data['text_language_code ']:null,
						'created_at' => self::get_datetime_jst(),
					))->where('user_uuid', '=', $data['user_uuid'])
					->execute();
				if($user_update_result == 0) {
					// 登録するべき
					$user_insert_result = \DB::insert('user')
						->set(array(
							'user_uuid' => $data['user_uuid'],
							'come_from' => 0,
							'nickname' => isset($data['nickname'])?$data['nickname']:null,
							'sex' => isset($data['sex'])?$data['sex']:null,
							'generation' => isset($data['generation'])?$data['generation']:null,
							'country' => isset($data['text_language_code '])?$data['text_language_code ']:null,
							'created_at' => self::get_datetime_jst(),
						))->where('user_uuid', '=', $data['user_uuid'])
						->execute();
					if($user_insert_result[1] == 0) {
						throw new \MarcoPandaException(14);	// 原因不明のユーザ登録失敗
					}
				}
			}
			// 旅行誌登録
			$artice_insert_result = \DB::insert('article')
				->set(array(
					'user_uuid' => !empty($data['user_uuid'])?$data['user_uuid']:NULL,
					'spot_id' => $spot_id,
					'nick_name' => !empty($data['nick_name'])?$data['nick_name']:NULL,
					'article_text' => !empty($data['article_text'])?$data['article_text']:NULL,
					'text_language_code' => !empty($data['text_language_code'])?$data['text_language_code']:NULL,
					'created_at' => self::get_datetime_jst(),
				))->execute();
			
			if($artice_insert_result[1] == 0) {
				throw new \MarcoPandaException(15);	// 原因不明のユーザ登録失敗
			}

			// 旅行誌とファイルに紐づく
			if(isset($data['multimedia_id']) && count($data['multimedia_id']) > 0) {
				$sort = 1;
				foreach($data['multimedia_id'] as $key => $value) {
					\DB::insert('article_multimedia')->set(array(
						'multimedia_id' => $value,
						'article_id' => $artice_insert_result[0],
						'sort' => $sort++,
						'created_at' => self::get_datetime_jst(),
					))->execute();
				}
			}

			// スポットの統計情報更新
			$date1MonthAgo = date('Y-m-d H:i:s', strtotime(self::get_datetime_jst() . ' -1 month'));
			$search_articles = \DB::select(\DB::expr('count(article_id) as cnt'))
				->from('article')
				->where('spot_id', '=', $spot_id)
				->where('created_at', '>', $date1MonthAgo)
				->execute()
				->current();
			$update_spot = \DB::update('spot')
				->set(array(
					'article_count_in_last_30_days' => $search_articles['cnt']
				))->where('spot_id', '=', $spot_id)
				->execute();

			\DB::commit_transaction();
			
		} catch(\Exception $e) {
			\DB::rollback_transaction();
			throw $e;
		}
		return array('article_id' => $artice_insert_result[0]);
	}

	/**
	 *
	 *
	 */
	public static function get_list($limit = 5, $offset = 0)
	{
		try {
			//$result = array('key' => $_SERVER['FUEL_ENV']);
			//return $result;
			//
			$result = \DB::select('*')->
						from('article')->
						order_by('created_at', 'desc')->
						limit($limit)->
						offset($offset)->
						execute()->as_array();
		} catch(\Exception $e) {
			throw $e;
		}
		return $result;
	}
}
