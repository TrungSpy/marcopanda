<?php
namespace Model;

require_once(APPPATH.'vendor/marcopandaexception.php');
use \Fuel\Core\Log;

class Base extends \Model {

	public static $uploaded_files = array();
	public static $uploaded_files_error = array();

	public static function upload_file($upload_config) {
		try {
			// $_FILES 内のアップロードされたファイルを処理する
			\Upload::process($upload_config);
			// 有効なファイルがある場合
			if (\Upload::is_valid())
			{
				// バリデーションされた全てのファイルを別の場所に保存する
				$arr = \Upload::get_files();
				\Upload::save();
				// $arr = Upload::get_files();
				self::$uploaded_files = \Upload::get_files();
//				Log::warning(var_export(self::$uploaded_files, true));

				self::$uploaded_files_error = \Upload::get_errors();
//				Log::warning(var_export(self::$uploaded_files_error, true));
			} else {
				// throw new \OneException(9009);
			}
		} catch(\Exception $e) {
			throw $e;
		}
	}
	
	/**
	 * システム日を日本時間で取得する
	 * @return type
	 */
	public static function get_datetime_jst() {
		$jsdatetime = gmdate('Y-m-d H:i:s', strtotime('+9 hours'));
		return $jsdatetime;
	}
	
	/**
	 * システム日を日本時間で取得する
	 * @return type
	 */
	public static function get_date_jst() {
		$jsdate = gmdate('Y-m-d', strtotime('+9 hours'));
		return $jsdate;
	}
}
