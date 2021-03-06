<?php

class takeTestController extends BaseController{

    function index()
    {
        $this->checkAuthenticated();
        if (!isset($_GET['testId'])) {
            trigger_error("TestId not populated",E_USER_ERROR);
        }
        $testId =$_GET['testId'];
        $testDataModel = new TestDataModel($testId,$this->registry->db);
        $sectionRenderer = new SectionRenderer($testDataModel);
        $this->registry->template->testDataModel = $testDataModel;
        $this->registry->template->sectionRenderer = $sectionRenderer;
        $sectionNumber = 1;
        $displaySectionNumber=1;
        if (isset($_POST['sectionNumber'])) {
            $sectionNumber = $_POST['sectionNumber'];
        }
        if (isset($_POST['displaySectionNumber'])) {
            $displaySectionNumber = $_POST['displaySectionNumber']+1;
        }

        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
        $testResult = new TestResult();
        $testResult->setTestId($testId);
        $userId = $_SESSION['userId'];
        $testResult->setUserId($userId);
        date_default_timezone_set("Asia/Kolkata");
        $date = date('Y-m-d h:i:s');
        $testResult->setDate($date);
        $testResult->setOverallScore('TBD');
        $testResult->setComprehensionScore('0');
        $testResult->setCommunicationScore('RED');
        $this->insertTestResult($this->registry->db,$testResult);

        $section = $testDataModel->getSection($sectionNumber);
        $this->registry->template->testId = $testId;
        $this->registry->template->sectionNumber = $sectionNumber;
        $this->registry->template->displaySectionNumber = $displaySectionNumber;
        $this->registry->template->timeForTest = $section->getTimeLimit();
        $this->registry->template->show('takeTest');
    }

    private function insertTestResult($dbh,$testResult) {
        $insertQuery = "insert into test_attempt(date,overall_grade,user_id,test_id,communication_grade,comprehension_grade)
                                    values('{$testResult->getDate()}','{$testResult->getOverallScore()}',{$testResult->getUserId()},{$testResult->getTestId()},
                                    '{$testResult->getCommunicationScore()}','{$testResult->getComprehensionScore()}')";
        try {

            $statementInsert = $dbh->prepare($insertQuery);

            try {
                $dbh->beginTransaction();
                $statementInsert->execute();
                $testResultId = $dbh->lastInsertId();
                $dbh->commit();
                $testResult->setId($testResultId);
                $_SESSION['testResult'] = $testResult;
            } catch(PDOExecption $e) {
                $dbh->rollback();
            }
        } catch( PDOExecption $e ) {
            print "Error!: " . $e->getMessage() . "</br>";
        }

    }
}