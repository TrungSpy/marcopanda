<?php
class MarcoPandaException extends Exception {

	private $error_code = NULL;
	
	public function __construct($code = NULL, $additional='', Exception $previous = null) {
		$this->error_code = $code;
		$error_key = sprintf("errors.%s", $code);
		$lang_msg = \Lang::get($error_key);
		if($additional != "") {
			$lang_msg = sprintf($lang_msg, $additional);
		}
		parent::__construct($lang_msg, 400, $previous);
	}

	public function __toString() {
		return __CLASS__ . ": [{$this->code}]: {$this->message}\n";
	}

	public function getMPErrorCode() {
		return $this->error_code;
	}
}
