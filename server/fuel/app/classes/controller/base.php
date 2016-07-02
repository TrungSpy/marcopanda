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

use \Fuel\Core\Log;

/**
 * The Article Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Base extends Controller_Rest
{
	public static $_JSON = NULL;
	
	public function before()
	{
		parent::before();

		// 認証処理などの共通処理を記述
		\Lang::load('errors');
		$php_input = file_get_contents('php://input');
		//Log::warning(var_export($php_input, true));
		self::$_JSON = json_decode($php_input, true);
	}

	public function after($response)
	{
		$response = parent::after($response); 

		// アクション実行後に行いたい共通処理を記述
		return $response;
	}

	/**
	 * Exceptionが発生する場合エラーメッセージを返す
	 */
	public function error($exception) {
		$response = array(
			'error' => $exception->getMPErrorCode(),
			'message' => $exception->getMessage(),
		);

		$this->response($response, 400);
	}

}
