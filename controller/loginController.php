<?php

class loginController extends BaseController{

    //http://www.wikihow.com/Create-a-Secure-Login-Script-in-PHP-and-MySQL
    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->registry->template->show('login');
    }
}