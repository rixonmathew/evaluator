<?php
class sectionEvaluationController extends BaseController{

    function index()
    {
//        foreach ($_POST as $key => $value)
//          echo "Field ".htmlspecialchars($key)." is ".htmlspecialchars($value)."<br>";
        $this->checkAuthenticated();
        $sectionId = $_POST['sectionNumber'];
        $displaySectionNumber=$sectionId;
        if (isset($_POST['displaySectionNumber'])) {
            $displaySectionNumber = $_POST['displaySectionNumber']+1;
        }

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
            $testResult->setComprehensionScore($sectionEvaluationResult->getComprehensionGrade());
            $testResult->setCommunicationScore($sectionEvaluationResult->getCommunicationGrade());
            $_SESSION['testResult'] = $testResult;
            $this->persistTestResult($this->registry->db,$testResult);
            $this->insertTestAttemptAnswer($this->registry->db,$testResult->getId(),$sectionEvaluationResult);
//            echo "<pre>";
//            echo "Next section is {$objectForEvaluating->getNextSection()} <br/>";
//            var_dump($sectionEvaluationResult);
//            echo "</pre>";
            if ($sectionEvaluationResult->getShowResult()===true) {
                $this->registry->template->testAttemptId = $testResult->getId();
                $this->registry->template->sectionScore = $sectionEvaluationResult->getScore();
                $this->registry->template->questionsCorrect = $sectionEvaluationResult->getQuestionsCorrect();
                $this->registry->template->questionsTotal = $sectionEvaluationResult->getTotalQuestions();
                $this->registry->template->comprehensionScore = $testResult->getComprehensionScore();
                $this->registry->template->communicationScore = $testResult->getCommunicationScore();
                $this->registry->template->testDateAndTime = $testResult->getDate();
                $this->registry->template->show('testResult');
            } else {
                $sectionRenderer = new SectionRenderer($testDataModel);
                $this->registry->template->testDataModel = $testDataModel;
                $this->registry->template->sectionRenderer = $sectionRenderer;
                $this->registry->template->displaySectionNumber = $displaySectionNumber;
                $this->registry->template->sectionNumber = $objectForEvaluating->getNextSection();
                $this->registry->template->testId = $testId;
                $section = $testDataModel->getSection($objectForEvaluating->getNextSection());
                $this->registry->template->timeForTest = $section->getTimeLimit();
                $this->registry->template->show('takeTest');
            }
        }
    }

    private function persistTestResult($dbh,$testResult) {
        $updateQuery = "update test_attempt
                           set overall_grade = '{$testResult->getOverallScore()}',
                               communication_grade = '{$testResult->getCommunicationScore()}',
                               comprehension_grade = '{$testResult->getComprehensionScore()}'
                         where id = {$testResult->getId()}";

        //TODO add logic to persist section attributes in test_attempt_analytics in addition to test_attempt
        try {
            $statementInsert = $dbh->prepare($updateQuery);

            try {
                $dbh->beginTransaction();
                $statementInsert->execute();
                $dbh->commit();
                $_SESSION['testResult'] = $testResult;
            } catch(PDOExecption $e) {
                $dbh->rollback();
            }
        } catch( PDOExecption $e ) {
            print "Error!: " . $e->getMessage() . "</br>";
        }
   }

   private function computeDisplaySection($sectionId,$nextSectionId) {
     if (($nextSectionId-$sectionId)>1) {
           return $sectionId+1;
       }
     return $nextSectionId;
   }

   private function insertTestAttemptAnswer($dbh,$testAttemptId,$sectionEvaluationResult) {

       foreach ($sectionEvaluationResult->getTestAttemptAnswers() as $testAttemptAnswer) {
           $answerValue = htmlspecialchars($testAttemptAnswer->getAnswer(),ENT_QUOTES);
           $insertQuery= <<<TAE_INS_QUERY
                insert into test_attempt_answers(test_attempt_id,question_id,answer,correct) values
                ($testAttemptId,{$testAttemptAnswer->getQuestionId()},'$answerValue',{$testAttemptAnswer->getCorrect()});
TAE_INS_QUERY;
            try{
                $statementInsert = $dbh->prepare($insertQuery);
                try {
                    $dbh->beginTransaction();
                    $statementInsert->execute();
                    $dbh->commit();
                } catch(PDOExecption $e) {
                    $dbh->rollback();
                    print "Error! (test_attempt_answer): " . $e->getMessage() . "</br>";
                    echo "$insertQuery <br/>";
                }
            } catch (PDOException $e) {
                print " (Outer) Error! (test_attempt_answer): " . $e->getMessage() . "</br>";
                $dbh->rollback();
                echo "$insertQuery <br/>";
            }
       }
   }

}