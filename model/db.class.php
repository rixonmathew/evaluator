<?php

include_once('includes/eval-config.php');
class db {

    private static $instance;

    private function __construct() {

    }

    public static function getInstance() {
        if (!self::$instance){
            try {
                self::$instance = new PDO("mysql:host=".HOST.";port=3306;dbname=".DATABASE,USER,PASSWORD,NULL);
                self::$instance->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                echo $e->getMessage();
                die("Could not connect to database.");
            }
        }
        return self::$instance;
    }

    private function __clone() {

    }
}