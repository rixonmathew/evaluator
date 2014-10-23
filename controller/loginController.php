<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 23/10/14
 * Time: 3:08 PM
 */

class loginController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->registry->template->show('login');
    }
}