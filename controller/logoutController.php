<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 09/12/14
 * Time: 7:40 AM
 * To change this template use File | Settings | File Templates.
 */

class logoutController extends BaseController{

    //http://www.wikihow.com/Create-a-Secure-Login-Script-in-PHP-and-MySQL
    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        session_start();
        session_destroy();
        $this->registry->template->show('login');
    }
}