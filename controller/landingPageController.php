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
        $this->registry->template->show('landingPage');
    }
}