<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 23/10/14
 * Time: 12:41 PM
 */

class db {

    private static $instance = NULL;
    private static $dbname="evaluator";
    private static $username="lfw_evaluator";
    private static $host="127.0.0.1";
    private static $password="Evaluator#1";  //TODO How to move this to a secure file?

    private function __construct() {

    }

    public static function getInstance() {
        if (!self::$instance){
            //self::$instance = new PDO("mysql:host=".self::$host.";dbname=".self::$dbname,self::$username,self::$password);
            try {
                self::$instance = new PDO("mysql:host=127.0.01;dbname=evaluator",self::$username,self::$password,NULL);
                self::$instance->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
        }
        return self::$instance;
    }

    private function __clone() {

    }
}