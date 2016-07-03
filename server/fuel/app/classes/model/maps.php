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
			$x = 0;
			if(!isset($data['sort_by'])) {
				if($value['article_count'] >= 5) {
					$x = 0;
				} else {
					$x = 100 - (int)($value['article_count'] * 20);
				}
			}
			$one_result['color'] = array('rgb' => '#ff0000', 
										'r' => (int)((14 * 16 + 14 - 10 * 16 - 10) * (float)$x / (float)100 + 10 * 16 + 10),
										'g' => (13 * 16 + 13 - 5 * 16 - 5) * $x / 100 + 5 * 16 + 5,
										'b' => (13 * 16 + 13 - 5 * 16 - 5) * $x / 100 + 5 * 16 + 5,
										'a' => 1,
									);
			// \Log::warning((int)((14 * 16 + 14 - 10 * 16 - 10) * (float)$x / (float)100 + 10 * 16 + 10));
			// \Log::warning('article_count: '. $value['article_count']. ', x: '. $x. ', color: '. print_r($one_result['color'], true));
			$one_result['star'] = (int)mt_rand(0, 5);// $value['average_star'];
			$one_result['article_number'] = $value['article_count'];
			$one_result['like_number'] = $value['like_sum'];
			$one_result['score'] = 10 - $x;
			$search_results[] = $one_result;
		}

		return array('search_results' => $search_results);
	}
}
