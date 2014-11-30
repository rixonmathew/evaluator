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
        if (!isset($_GET['testId'])) {
            trigger_error("TestId not populated",E_USER_ERROR);
        }
        $testId =$_GET['testId'];
        $testDataModel = new TestDataModel($testId,$this->registry->db);
        $sectionRenderer = new SectionRenderer($testDataModel);
        $this->registry->template->testDataModel = $testDataModel;
        $this->registry->template->sectionRenderer = $sectionRenderer;
        $sectionNumber = 1;
        if (isset($_POST['sectionNumber'])) {
            $sectionNumber = $_POST['sectionNumber'];
        }
        $section = $testDataModel->getSection($sectionNumber);
        $this->registry->template->testId = $testId;
        $this->registry->template->sectionNumber = $sectionNumber;
        $this->registry->template->timeForTest = $section->getTimeLimit();
        $this->registry->template->show('takeTest');
    }
}