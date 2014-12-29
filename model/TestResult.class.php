<?php

class TestResult {

    private $id;
    private $sectionResults;
    private $overallScore;
    private $communicationScore;
    private $comprehensionScore;
    private $userId;
    private $testId;
    private $date;

    function __construct()
    {
        $this->sectionResults = array();
    }


    /**
     * @param mixed $communicationScore
     */
    public function setCommunicationScore($communicationScore)
    {
        $this->communicationScore = $communicationScore;
    }

    /**
     * @return mixed
     */
    public function getCommunicationScore()
    {
        return $this->communicationScore;
    }

    /**
     * @param mixed $comprehensionScore
     */
    public function setComprehensionScore($comprehensionScore)
    {
        $this->comprehensionScore = $comprehensionScore;
    }

    /**
     * @return mixed
     */
    public function getComprehensionScore()
    {
        return $this->comprehensionScore;
    }

    /**
     * @param mixed $sectionResults
     */
    public function setSectionResults($section,$sectionEvaluationResult)
    {
        $this->sectionResults[$section] = $sectionEvaluationResult;
    }

    /**
     * @return mixed
     */
    public function getSectionResults($section)
    {
        return $this->sectionResults[$section];
    }

    /**
     * @param mixed $testId
     */
    public function setTestId($testId)
    {
        $this->testId = $testId;
    }

    /**
     * @return mixed
     */
    public function getTestId()
    {
        return $this->testId;
    }

    /**
     * @param mixed $userId
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
    }

    /**
     * @return mixed
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @param mixed $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * @return mixed
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $overallScore
     */
    public function setOverallScore($overallScore)
    {
        $this->overallScore = $overallScore;
    }

    /**
     * @return mixed
     */
    public function getOverallScore()
    {
        return $this->overallScore;
    }

}