<?php
namespace Model;

class Articles extends Base {

	public static function regist($data)
	{
		try {
			throw new \MarcoPandaException('CategoryNotExist');

			if($data.spot_id) {
				
			} else {
				
			}
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
