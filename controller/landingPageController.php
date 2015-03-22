<?php

class landingPageController extends BaseController {

    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->firstName =$_SESSION['first_name'];
        $this->registry->template->isAdmin = $_SESSION['admin'];
        $this->registry->template->userId = $_SESSION['userId'];
        $this->registry->template->show('landingPage');
    }

}