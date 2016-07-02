<?php
namespace Model;
use \Fuel\Core\Log;

class Articles extends Base {
	
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
			//Log::warning('file uploaded: '. var_export(self::$uploaded_files, true));
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

	public static function regist($data)
	{
		try {
			if(!empty($data['spot_id'])) {
				
			} else {
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
			// self::upload_file();
			// if(count(self::$uploaded_files_error) > 0) {
			// 	throw new \MarcoPandaException(5);
			// }
			// if(count(self::$uploaded_files) == 0 && empty($data['article_text'])) {
			// 	throw new \MarcoPandaException(6);
			// }
		} catch(\Exception $e) {
			throw $e;
		}
		return $data;
		return $result_id;
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
