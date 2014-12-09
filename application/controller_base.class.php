<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 19/10/14
 * Time: 6:57 PM
 */

Abstract Class BaseController {

    /*
     * @registry object
     */
    protected $registry;

    function __construct($registry) {
        $this->registry = $registry;
    }

    /**
     * @all controllers must contain an index method
     */
    abstract function index();

    protected function checkAuthenticated()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        if (!isset($_SESSION['login'])) {
            header("Location: login");
        }
    }
}