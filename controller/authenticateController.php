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
        $username = $_POST['username'];
        $authenticateQuery = "select first_name,last_name from user where username='$username'";
        foreach($this->registry->db->query($authenticateQuery) as $row) {
            echo "first_name is ".$row['first_name']." last_name is ".$row['last_name']."<br>";
        }
    }
}