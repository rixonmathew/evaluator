<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 23/10/14
 * Time: 12:54 PM
 */
Class Error404Controller extends BaseController {


    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->registry->template->blog_heading = "This is 404";
        $this->registry->template->show('error404');
    }
}