<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 6:39 PM
 */

class landingPageController extends BaseController {

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->first_name =$_SESSION['first_name'];
        $this->registry->template->show('landingPage');
    }

}