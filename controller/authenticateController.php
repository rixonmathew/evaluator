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
        $password = $_POST['password'];
        $authenticateQuery = "select first_name,last_name from user where username='$username' and password='$password'";
        $dbh = $this->registry->db;
        $stmt = $dbh->query($authenticateQuery);
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        if (!isset($userData->first_name)) {
            $this->registry->template->login_failed = true;
            $this->registry->template->show('login');
            return;
        }
        session_start();
        $_SESSION['login'] = "1";
        $_SESSION['username'] = $username;
        header ("Location: landingPage");
    }
}