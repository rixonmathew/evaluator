<?php
class authenticateController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $username = $_POST['email'];
        $password = $_POST['password'];
        $authenticateQuery = "select id,first_name,last_name from user where username='$username' and password='$password'";
        $dbh = $this->registry->db;
        $stmt = $dbh->query($authenticateQuery);
        $userData = $stmt->fetch(PDO::FETCH_OBJ);
        if (!isset($userData->first_name)) {
            $this->registry->template->login_failed = true;
            $this->registry->template->show('login');
            return;
        }
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        $_SESSION['login'] = "1";
        $_SESSION['username'] = $username;
        $_SESSION['first_name'] = $userData->first_name;
        $_SESSION['userId'] = $userData->id;
        header ("Location: landingPage");
    }
}