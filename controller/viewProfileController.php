<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 22/03/15
 * Time: 11:52 AM
 */

class viewProfileController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->firstName =$_SESSION['first_name'];
        $this->registry->template->lastName =$_SESSION['last_name'];
        $this->registry->template->userName =$_SESSION['username'];
        $this->registry->template->userId = $_SESSION['userId'];
        $this->registry->template->show('viewProfile');
    }
}