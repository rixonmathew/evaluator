<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 8:59 PM
 */

class takeTestController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $testDataModel = new TestDataModel(1,$this->registry->db);
        $sectionRenderer = new SectionRenderer($testDataModel);
        $this->registry->template->testDataModel = $testDataModel;
        $this->registry->template->sectionRenderer = $sectionRenderer;
        $this->registry->template->sectionNumber = 1;
        $this->registry->template->show('takeTest');
    }
}