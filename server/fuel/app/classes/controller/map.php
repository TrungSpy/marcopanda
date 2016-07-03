<?php
/**
 * Fuel is a fast, lightweight, community driven PHP5 framework.
 *
 * @package    Fuel
 * @version    1.8
 * @author     Fuel Development Team
 * @license    MIT License
 * @copyright  2010 - 2016 Fuel Development Team
 * @link       http://fuelphp.com
 */

use \Model\Maps;

/**
 * The Article Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Map extends Controller_Base
{
	public function before()
	{
		parent::before();
	}

	public function after($response)
	{
		$response = parent::after($response); 
		return $response;
	}

	/**
	 * search in map
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_search()
	{
		try {
			$results = Maps::search_3_in_1( self::$_JSON );

			return $this->response($results, 200);
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}
}
