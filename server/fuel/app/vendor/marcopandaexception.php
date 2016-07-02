<?php
class MarcoPandaException extends Exception {

	private $error_code = NULL;
	
	public function __construct($code = NULL, $additional='', Exception $previous = null) {
		
		$error_key = sprintf("errors.%04d", $code);
		$lang_array = \Lang::get($error_key);
		$this->error_code = $lang_array['code'];
		$lang_msg = $lang_array['message'];
		if($additional != "") {
			$lang_msg = sprintf($lang_msg, $additional);
		}
		parent::__construct($lang_msg, $code, $previous);
	}

	public function __toString() {
		return __CLASS__ . ": [{$this->code}]: {$this->message}\n";
	}

	public function getMPErrorCode() {
		return $this->error_code;
	}
}
