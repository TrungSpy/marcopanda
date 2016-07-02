<?php
namespace Model;

class Articles extends \Model {

	public static function regist($data)
	{
		try {
			
		} catch(\Exception $e) {
			
		}
		return $result_id;
	}

	/**
	 *
	 *
	 */
	public static function get_list($limit = 5, $offset = 0)
	{
		try {
			//echo "_SERVER['FUEL_ENV']". $_SERVER['FUEL_ENV'];
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
