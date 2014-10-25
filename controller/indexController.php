<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 19/10/14
 * Time: 7:09 PM
 */
class IndexController extends BaseController {

    public function index() {
        $this->registry->template->show('login');
    }
}
