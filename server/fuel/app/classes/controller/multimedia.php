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

use \Model\Multimedias;
use \Fule\Core\Log;

/**
 * The Article Controller.
 *
 * A basic controller example.  Has examples of how to set the
 * response body and status.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Multimedia extends Controller_Base
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
	public function action_download()
	{
		try {
			$result = Multimedias::get_multimedia(\Input::get());
			//\Log::warning('input: '. var_export(\Input::get(), true). ', url: '. DOCROOT. '../fuel/app/tmp/upload/'. $result['path']);

			header("Content-Type: ". $result['mime_type']);
			echo file_get_contents(DOCROOT. '../fuel/app/tmp/upload/'. $result['save_path']);
			exit();
		} catch (\MarcoPandaException $e) {
			$this->error($e);
		}
	}
}
