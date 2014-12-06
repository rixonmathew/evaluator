<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 04/12/14
 * Time: 7:52 AM
 * To change this template use File | Settings | File Templates.
 */

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
    public function setSectionResults($sectionResults)
    {
        $this->sectionResults = $sectionResults;
    }

    /**
     * @return mixed
     */
    public function getSectionResults()
    {
        return $this->sectionResults;
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