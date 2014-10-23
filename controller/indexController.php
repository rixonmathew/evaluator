<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 19/10/14
 * Time: 7:09 PM
 */
class IndexController extends BaseController {

    public function index() {
        /*** set a template variable ***/
        $this->registry->template->welcome = 'Welcome to PHPRO MVC';

        /*** load the index template ***/
        $this->registry->template->show('index');
    }

}
?>