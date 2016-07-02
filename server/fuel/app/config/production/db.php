<?php
/**
 * The development database settings. These get merged with the global settings.
 */

return array(
	'default' => array(
		'connection'  => array(
			'dsn'        => 'mysql:host=rm-j6c2il7681qgjcw7o.mysql.rds.aliyuncs.com;dbname=marcopanda',
			'username'   => 'marcopandaecs',
			'password'   => 'qZMkCUhQU8kf7Adp',
		),
	),
	'read' => array(
		'connection'  => array(
			'dsn'        => 'mysql:host=rm-j6c2il7681qgjcw7o.mysql.rds.aliyuncs.com;dbname=marcopanda',
			'username'   => 'marcopandaread',
			'password'   => 'drqRgb1uiOBy3xs6',
		),
	),
);
