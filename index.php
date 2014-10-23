<?php

/*** error reporting on ***/
error_reporting(E_ALL);

/*** define the site path constant ***/
$site_path = realpath(dirname(__FILE__));
define ('__SITE_PATH', $site_path);

/*** include the init.php file ***/
include 'includes/init.php';

$registry->router = new router($registry);

/*** set the path to the controllers directory ***/
$registry->router->setPath (__SITE_PATH . '/controller');

$registry->template = new template($registry);

//load the controller
$registry->router->loader();
?>