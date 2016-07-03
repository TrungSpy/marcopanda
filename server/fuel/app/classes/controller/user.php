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

use \Model\Users;

/**
 * The Article Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_User extends Controller_Base
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
	 * upload file
	 *
	 * @access  public
	 * @return  Response
	 */
	public function post_uuid_regist()
	{
		try {
			$results = Users::uuid_regist( self::$_JSON );

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

			return $this->response($results, 200);
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}

	/**
	 * A typical "Hello, Bob!" type example.  This uses a Presenter to
	 * show how to use them.
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_hello()
	{
		return Response::forge(Presenter::forge('welcome/hello'));
	}

	/**
	 * The 404 action for the application.
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_404()
	{
		return Response::forge(Presenter::forge('welcome/404'), 404);
	}
}