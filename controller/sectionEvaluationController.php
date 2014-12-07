<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 02/11/14
 * Time: 11:59 PM
 */

class sectionEvaluationController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
//        foreach ($_POST as $key => $value)
//          echo "Field ".htmlspecialchars($key)." is ".htmlspecialchars($value)."<br>";

        $sectionId = $_POST['sectionNumber'];
        $testId = $_POST['testId'];
        $testDataModel = new TestDataModel($testId,$this->registry->db);
        $section = $testDataModel->getSection($sectionId);
        $sectionEvaluatorClass = $section->getEvaluatingClass();
        if (!is_null($sectionEvaluatorClass)) {
            $fileToInclude = __SITE_PATH.'/controller/custom/'.$sectionEvaluatorClass.'.php';
            include_once $fileToInclude;
            $objectForEvaluating = new $sectionEvaluatorClass();
            $sectionEvaluationResult = $objectForEvaluating->doEvaluate($testDataModel,$sectionId);
            if (session_status() == PHP_SESSION_NONE) {
                session_start();
            }
            $testResult = $_SESSION['testResult'];
            $testResult->setSectionResults($sectionId,$sectionEvaluationResult);
            $_SESSION['testResult'] = $testResult;
            $_SESSION['sectionEvaluationResult'] = $sectionEvaluationResult;
            //TODO add functionality to get Test Result from session and update with Section Evaluation
            if ($sectionEvaluationResult->getShowResult()===true) {
                $testResult->setComprehensionScore($sectionEvaluationResult->getComprehensionGrade());
                $testResult->getCommunicationScore($sectionEvaluationResult->getCommunicationGrade());
                $this->registry->template->sectionScore = $sectionEvaluationResult->getScore();
                $this->registry->template->questionsCorrect = $sectionEvaluationResult->getQuestionsCorrect();
                $this->registry->template->questionsTotal = $sectionEvaluationResult->getTotalQuestions();
                $this->registry->template->comprehensionScore = $testResult->getComprehensionScore();
                $this->registry->template->communicationScore = $testResult->getCommunicationScore();
                $this->registry->template->show('testResult');
            } else {
                $sectionRenderer = new SectionRenderer($testDataModel);
                $this->registry->template->testDataModel = $testDataModel;
                $this->registry->template->sectionRenderer = $sectionRenderer;
                $this->registry->template->sectionNumber = $objectForEvaluating->getNextSection();
                $this->registry->template->testId = $testId;
                $section = $testDataModel->getSection($objectForEvaluating->getNextSection());
                $this->registry->template->timeForTest = $section->getTimeLimit();
                $this->registry->template->show('takeTest');
            }
        }
    }
}