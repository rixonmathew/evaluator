<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 29/12/14
 * Time: 9:11 PM
 */

class TestAttemptAnswer {

    private $testAttemptId;
    private $questionId;
    private $answer;
    private $correct;
    private $questionText;

    function __construct()
    {

    }


    /**
     * @return mixed
     */
    public function getTestAttemptId()
    {
        return $this->testAttemptId;
    }

    /**
     * @param mixed $testAttemptId
     */
    public function setTestAttemptId($testAttemptId)
    {
        $this->testAttemptId = $testAttemptId;
    }

    /**
     * @return mixed
     */
    public function getQuestionId()
    {
        return $this->questionId;
    }

    /**
     * @param mixed $questionId
     */
    public function setQuestionId($questionId)
    {
        $this->questionId = $questionId;
    }

    /**
     * @return mixed
     */
    public function getAnswer()
    {
        return $this->answer;
    }

    /**
     * @param mixed $answer
     */
    public function setAnswer($answer)
    {
        $this->answer = $answer;
    }

    /**
     * @return mixed
     */
    public function getCorrect()
    {
        return $this->correct;
    }

    /**
     * @param mixed $correct
     */
    public function setCorrect($correct)
    {
        $this->correct = $correct;
    }

    /**
     * @return mixed
     */
    public function getQuestionText()
    {
        return $this->questionText;
    }

    /**
     * @param mixed $questionText
     */
    public function setQuestionText($questionText)
    {
        $this->questionText = $questionText;
    }



}