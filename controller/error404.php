<?php
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