<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 8:59 PM
 */

class takeTestController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        //get all sections for test.
        //Populate details for Section#1 or next Section
        //show the view
        $authenticateQuery = "select first_name,last_name from user where username='$username' and password='$password'";
        $dbh = $this->registry->db;
        $stmt = $dbh->query($authenticateQuery);
        $userData = $stmt->fetch(PDO::FETCH_OBJ);

    }
}