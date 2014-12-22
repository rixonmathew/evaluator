<?php

class questionController extends BaseController {

    /**
     * @all controllers must contain an index method
     */
    private function saveOrUpdateQuestion(){
//        foreach ($_POST as $key => $value)
//            echo "Field ".htmlspecialchars($key)." is ".htmlspecialchars($value)."<br>";
        if (!isset($_POST['operation'])) {
            return;
        }
        switch($_POST['operation']){
            case "insert":
                $this->insertQuestion();
                break;
            case "update":
                $this->updateQuestion();
                break;
            case "delete":
                $this->updateQuestion();
                break;
            case "view":
                break;
        }
    }

    /*
     * Field questionAttributes is English
Field text is This is text
Field answer1 is answer1
Field answer2 is answer2
Field answer3 is answer3
Field isCorrectAnswer3 is on
Field answer4 is answer4
Field isCorrectAnswer4 is on
Field complexity is Medium
     */
    private function updateQuestion() {
        // text, answers, complexity, attributes.
    }

    private function insertQuestion() {
        $questionText = $_POST['text'];
        try {
            $dbh = $this->registry->db;

            $statementInsert = $dbh->prepare("INSERT INTO question (text) VALUES(?)");

            try {
                $dbh->beginTransaction();
                $statementInsert->execute( array($questionText));
                $questionId = $dbh->lastInsertId();
                $this->insertAnswers($questionId,$dbh);
                $this->insertAttributes($questionId,$dbh);
                $dbh->commit();
                $this->registry->template->show_alert = true;
                $this->registry->template->alert_type = "info";
                $this->registry->template->question_message = "Question added successfully";
            } catch(PDOExecption $e) {
                $dbh->rollback();
                $this->registry->template->show_alert = true;
                $this->registry->template->alert_type = "error";
                $this->registry->template->question_message = "Error!: " . $e->getMessage() . "</br>";
            }
        } catch( PDOExecption $e ) {
            print "Error!: " . $e->getMessage() . "</br>";
        }
    }

    function insertAnswers($questionId,$dbh) {
        $answerInsertQuery = "insert into answer(text,correct,question_id) values(?,?,?)";
        for($i=1;$i<=4;$i++) {
            $varAnswerName = "answer".$i;
            $varIsAnswerCorrect = "isCorrectAnswer".$i;
            if (isset($_POST[$varAnswerName])){
                $answer = $_POST[$varAnswerName];
                if (empty($answer))
                    continue;
                if (isset($_POST[$varIsAnswerCorrect])){
                    $isCorrect=1;
                } else{
                    $isCorrect=0;
                }
                $statementInsertAnswer = $dbh->prepare($answerInsertQuery);
                $statementInsertAnswer->execute(array($answer,$isCorrect,$questionId));
            }
        }
    }

    private function insertAttributes($questionId,$dbh) {

    }

    function index()
    {
        $this->checkAuthenticated();
        $this->saveOrUpdateQuestion();
        $this->registry->template->show('question');
    }

    function allQuestions() {
        $this->registry->template->show('allQuestions');
    }
}