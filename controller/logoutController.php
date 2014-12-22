<?php

class logoutController extends BaseController{

    //http://www.wikihow.com/Create-a-Secure-Login-Script-in-PHP-and-MySQL
    function index()
    {
        session_start();
        session_destroy();
        $this->registry->template->show('login');
    }
}