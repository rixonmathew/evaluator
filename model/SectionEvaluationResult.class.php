<?php

class SectionEvaluationResult {

    private $sectionId;
    private $totalQuestions;
    private $questionsAttempted;
    private $questionsCorrect;
    private $score;
    private $comprehensionGrade;
    private $communicationGrade;
    private $showResult = false;
    private $topicScores;
    private $testAttemptAnswers;

    function __construct() {
        $this->testAttemptAnswers = array();
    }

    /**
     * @param mixed $questionsAttempted
     */
    public function setQuestionsAttempted($questionsAttempted)
    {
        $this->questionsAttempted = $questionsAttempted;
    }

    /**
     * @return mixed
     */
    public function getQuestionsAttempted()
    {
        return $this->questionsAttempted;
    }

    /**
     * @param mixed $questionsCorrect
     */
    public function setQuestionsCorrect($questionsCorrect)
    {
        $this->questionsCorrect = $questionsCorrect;
    }

    /**
     * @return mixed
     */
    public function getQuestionsCorrect()
    {
        return $this->questionsCorrect;
    }

    /**
     * @param mixed $score
     */
    public function setScore($score)
    {
        $this->score = $score;
    }

    /**
     * @return mixed
     */
    public function getScore()
    {
        return $this->score;
    }

    /**
     * @param mixed $sectionId
     */
    public function setSectionId($sectionId)
    {
        $this->sectionId = $sectionId;
    }

    /**
     * @return mixed
     */
    public function getSectionId()
    {
        return $this->sectionId;
    }

    /**
     * @param mixed $totalQuestions
     */
    public function setTotalQuestions($totalQuestions)
    {
        $this->totalQuestions = $totalQuestions;
    }

    /**
     * @return mixed
     */
    public function getTotalQuestions()
    {
        return $this->totalQuestions;
    }

    /**
     * @param mixed $grade
     */
    public function setComprehensionGrade($grade)
    {
        $this->comprehensionGrade = $grade;
    }

    /**
     * @return mixed
     */
    public function getComprehensionGrade()
    {
        return $this->comprehensionGrade;
    }

    /**
     * @param mixed $communicationGrade
     */
    public function setCommunicationGrade($communicationGrade)
    {
        $this->communicationGrade = $communicationGrade;
    }

    /**
     * @return mixed
     */
    public function getCommunicationGrade()
    {
        return $this->communicationGrade;
    }

    /**
     * @param boolean $showResult
     */
    public function setShowResult($showResult)
    {
        $this->showResult = $showResult;
    }

    /**
     * @return boolean
     */
    public function getShowResult()
    {
        return $this->showResult;
    }

    /**
     * @param mixed $topicScores
     */
    public function setTopicScores($topicScores)
    {
        $this->topicScores = $topicScores;
    }

    /**
     * @return mixed
     */
    public function getTopicScores()
    {
        return $this->topicScores;
    }

    /**
     * @return mixed an array of TestAttemptResult objects
     */
    public function getTestAttemptAnswers()
    {
        return $this->testAttemptAnswers;
    }

    /**
     * @param $testAttemptAnswer an instance of TestAttemptResult
     */
    public function addTestAttemptAnswer($testAttemptAnswer)
    {
        array_push($this->testAttemptAnswers,$testAttemptAnswer);
    }


}