<?php

class testAttemptAnswerController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->checkAuthenticated();
        $testAttemptAnswers = $this->getTestAttemptAnswers($_GET['testAttemptId']);
        $this->registry->template->testAttemptAnswers = $testAttemptAnswers;
        $this->registry->template->show('testAttemptAnswers');
    }

    private function getTestAttemptAnswers($testAttemptId) {
        $selectQuery = <<<QUERY_TAE
    select tae.test_attempt_id as testAttemptId,
           q.text as questionText,
           q.id as questionId,
           tae.answer as answer,
           if(tae.correct=1,'Yes','No') as correct
      from test_attempt_answers tae,
           question q
     where test_attempt_id = $testAttemptId
       and q.id = tae.question_id
QUERY_TAE;
        $dbh = $this->registry->db;
        $stmt = $dbh->query($selectQuery);
        return $stmt->fetchAll(PDO::FETCH_CLASS,"TestAttemptAnswer");
    }
}