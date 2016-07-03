<?php
namespace Model;
use \Fuel\Core\Log;

class Maps extends Base {

	public static function search_3_in_1($data)
	{
		try {
			if(!empty($data['longitude'])) {
				return self::search_by_geocode($data);
			}
			
		} catch(\Exception $e) {
			throw $e;
		}
	}
	
	// 現在地から検索する
	public static function search_by_geocode($data) {
		if(empty($data['longitude']) || empty($data['latitude']) || empty($data['zoom'])) {
			throw new \MarcoPandaException(18);
		}
		$query_cnt = \DB::select(\DB::expr('count(spot_id) as cnt'))->from('spot');
		$query = \DB::select('*')
			->from('spot');
		if(isset($data['page'])) {
			$query = $query->limit($data['page'])
						->offset(($data['page'] - 1) * 20);
		}
		if(!isset($data['sort_by'])) {
			$query = $query->order_by('article_count', 'desc');
		}
		$result_cnt = $query_cnt->execute()->current();
		$result = $query->execute()->as_array();
		
		$search_results = array();
		foreach($result as $key => $value) {
			$one_result = array();
			$one_result['longitude'] = $value['longitude'];
			$one_result['latitude'] = $value['latitude'];
			$one_result['spot_id'] = $value['spot_id'];
			$one_result['location_name'] = $value['location_name'];
			$one_result['category_id'] = $value['category_id'];
			$one_result['cost_id'] = $value['cost_id'];
			if(!isset($data['sort_by'])) {
				$red = (int)(255 / 10 * $value['article_count']);
				if($red > 255) $red = 255;
			}
			$one_result['color'] = array('rgb' => '#ff0000', 
										'r' => $red,
										'g' => 0,
										'b' => 0,
										'a' => 1,
									);
			$one_result['star'] = $value['average_star'];
			$one_result['article_number'] = $value['article_count'];
			$one_result['like_number'] = $value['like_sum'];
			$one_result['score'] = $red;
			$search_results[] = $one_result;
		}

		return array('search_results' => $search_results);
	}
}
