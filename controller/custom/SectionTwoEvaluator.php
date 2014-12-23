<?php

class SectionTwoEvaluator extends AbstractSectionEvaluator
{
    function __construct()
    {
        $this->nextSection=3;
    }


    /**
     * @param $sectionEvaluationResult
     * @param $totalQuestions
     * @param $questionsCorrect
     * @param $sectionScore
     * @param $minTopicScore
     */
    protected function populateResults($sectionEvaluationResult, $totalQuestions, $questionsCorrect, $sectionScore,$minTopicScore)
    {
        $sectionEvaluationResult->setTotalQuestions($totalQuestions);
        $sectionEvaluationResult->setQuestionsCorrect($questionsCorrect);
        $sectionEvaluationResult->setScore($sectionScore);
        $sectionEvaluationResult->setCommunicationGrade("NOT EVALUATED");
        $sectionEvaluationResult->setComprehensionGrade("1");
        if ($sectionScore >= 33 && $minTopicScore>=0.6) {
            $this->nextSection = 4;
        } else {
            $this->nextSection = 3;
        }
    }
}