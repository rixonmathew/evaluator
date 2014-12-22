<?php
class IndexController extends BaseController {

    public function index() {
        $this->registry->template->show('login');
    }
}
