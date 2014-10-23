<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 23/10/14
 * Time: 3:10 PM
 */

class authenticateController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $username = $_POST['email'];
        $authenticateQuery = "select first_name,last_name from user where username='$username'";
        $dbh = $this->registry->db;
        $stmt = $dbh->query($authenticateQuery);
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        header('Content-Type: application/json');
        echo json_encode($userData,JSON_PRETTY_PRINT);


    }
}