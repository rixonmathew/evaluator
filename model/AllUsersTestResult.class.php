<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 15/03/15
 * Time: 11:03 PM
 */

class AllUsersTestResult {

    private $userName;
    private $firstName;
    private $testAttemptId;
    private $testDateAndTime;
    private $testId;
    private $overallScore;
    private $communicationScore;
    private $comprehensionScore;

    function __construct()
    {
    }

    /**
     * @return mixed
     */
    public function getUserName()
    {
        return $this->userName;
    }

    /**
     * @param mixed $userName
     */
    public function setUserName($userName)
    {
        $this->userName = $userName;
    }

    /**
     * @return mixed
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * @param mixed $firstName
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;
    }

    /**
     * @return mixed
     */
    public function getTestDateAndTime()
    {
        return $this->testDateAndTime;
    }

    /**
     * @param mixed $testDateAndTime
     */
    public function setTestDateAndTime($testDateAndTime)
    {
        $this->testDateAndTime = $testDateAndTime;
    }

    /**
     * @return mixed
     */
    public function getOverallScore()
    {
        return $this->overallScore;
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
    public function getCommunicationScore()
    {
        return $this->communicationScore;
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
    public function getComprehensionScore()
    {
        return $this->comprehensionScore;
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
    public function getTestId()
    {
        return $this->testId;
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





}