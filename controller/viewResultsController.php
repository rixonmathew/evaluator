<?php

class viewResultsController extends BaseController {

    function index()
    {
        $this->checkAuthenticated();
        $testResults = $this->getTestResult($_GET['resultId']);
        $testResult = $testResults[0];
        $this->registry->template->sectionScore = $testResult->getOverallScore();
        $this->registry->template->comprehensionScore = $testResult->getComprehensionScore();
        $this->registry->template->communicationScore = $testResult->getCommunicationScore();
        $this->registry->template->testDateAndTime = $testResult->getDate();
        $this->registry->template->show('testResult');
    }

    function getTestResult($resultId){
        $selectQuery = <<<QUERY_QFT
    select id,
           date,
           test_id as testId,
           overall_grade as overallScore,
           communication_grade as communicationScore,
           comprehension_grade as comprehensionScore
      from test_attempt
     where id = $resultId;
QUERY_QFT;
        $dbh = $this->registry->db;
        $stmt = $dbh->query($selectQuery);
        return $stmt->fetchAll(PDO::FETCH_CLASS,"TestResult");
    }
}