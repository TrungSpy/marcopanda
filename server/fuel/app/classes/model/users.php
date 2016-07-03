<?php
namespace Model;
use \Fuel\Core\Log;

class Users extends Base {

	public static function uuid_regist($data)
	{
		try {
			if(empty($data['user_uuid'])) {
				throw new \MarcoPandaException(7);
			}
			$insert_result = \DB::insert('user')->set(array(
				'user_uuid' => $data['user_uuid'],
				'come_from' => 0,
				'created_at' => self::get_datetime_jst(),
			))->execute();
			if($insert_result[1] == 0) {
				throw new \MarcoPandaException(8);
			}
		} catch(\Exception $e) {
			throw new \MarcoPandaException(8);
		}
		return array('user_uuid' => $data['user_uuid']);
	}
}
