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

use \Model\Articles;

/**
 * The Article Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Article extends Controller_Base
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
	 * The basic welcome message
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_index()
	{
		 $list = array(
            'foo' => Input::get('foo'),
            'baz' => array(
                1, 50, 219
            ),
            'empty' => null
        );
		$results = Articles::get_list( 10, 0);
        //print_r($results);
		return $this->response($results, 200);
	}

	/**
	 * upload file
	 *
	 * @access  public
	 * @return  Response
	 */
	public function post_fileupload()
	{
		try {
			$results = Articles::receive_upload();

			return $this->response($results, 200);
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}

	/**
	 * The basic welcome message
	 *
	 * @access  public
	 * @return  Response
	 */
	public function post_post()
	{
		try {
			$results = Articles::regist( self::$_JSON );
			//\Log::warning(print_r($results, true));

			return $this->response($results, 200);
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}

	/**
	 * search articles
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_search()
	{
		try {
			$results = Articles::search_3_in_1( self::$_JSON );

			return $this->response($results, 200);
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}
}
