<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 24/10/14
 * Time: 8:22 AM
 */

class questionController extends BaseController {

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->registry->template->show('question');
    }
}