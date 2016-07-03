<?php
namespace Model;
use \Fuel\Core\Log;

class Multimedias extends Base {

	public static function get_multimedia($data)
	{
		try {
			if(empty($data['path'])) {
				throw new \MarcoPandaException(16);
			}
			$multimedia_result = \DB::select('multimedia_id', 'save_path', 'mime_type', 'media_type', 'filename')
				->from('multimedia')
				->where('save_path', '=', $data['path'])
				->execute()
				->as_array();
			if(count($multimedia_result) == 0) {
				throw new \MarcoPandaException(17);
			}
			return $multimedia_result[0];
		} catch(\Exception $e) {
			throw new \MarcoPandaException(0);
		}
	}
}
