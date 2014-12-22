<?php

class landingPageController extends BaseController {

    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->first_name =$_SESSION['first_name'];
        $this->registry->template->show('landingPage');
    }

}