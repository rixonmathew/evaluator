<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 30/11/14
 * Time: 11:42 PM
 * To change this template use File | Settings | File Templates.
 */

class SectionEvaluationResult {

    private $sectionId;
    private $totalQuestions;
    private $questionsAttempted;
    private $questionsCorrect;
    private $score;
    private $grade;

    function __construct() {

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
    public function setGrade($grade)
    {
        $this->grade = $grade;
    }

    /**
     * @return mixed
     */
    public function getGrade()
    {
        return $this->grade;
    }
}