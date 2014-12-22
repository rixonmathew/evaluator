<?php

class registerController extends BaseController {

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        if (!isset($_POST['operation'])) {
            $this->registry->template->show('register');
        } else {
            $this->registerNewUser();
        }

    }

    function registerNewUser()
    {
        switch($_POST['operation']){
            case "insert":
                $this->addNewUser();
                break;
         }
    }

    function addNewUser() {
        $email = $_POST['email'];
        $user_password = $_POST['password'];
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        try {
            $dbh = $dbh = $this->registry->db;

            $statementInsert = $dbh->prepare("INSERT INTO user (username,first_name,last_name,admin,password)
                                              VALUES('$email','$firstName','$lastName',0,'$user_password')");
            try {
                $dbh->beginTransaction();
                $statementInsert->execute();
                $dbh->commit();
                $this->registry->template->show_alert = true;
                $this->registry->template->alert_type = "info";
                $this->registry->template->alert_message = "User added successfully. You can now login";
                $this->registry->template->show('login');
            } catch(PDOExecption $e) {
                $dbh->rollback();
                $this->registry->template->show_alert = true;
                $this->registry->template->alert_type = "error";
                $this->registry->template->alert_message = "Error!: " . $e->getMessage() . "</br>";
            }
        } catch( PDOExecption $e ) {
            print "Error!: " . $e->getMessage() . "</br>";
        }

    }
}