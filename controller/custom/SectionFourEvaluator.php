<?php

class SectionFourEvaluator extends AbstractSectionEvaluator{

    function __construct()
    {
        $this->nextSection=5;
    }


    /**
     * @param $sectionEvaluationResult
     * @param $totalQuestions
     * @param $questionsCorrect
     * @param $sectionScore
     * @param $minTopicScore
     */
    protected function populateResults(&$sectionEvaluationResult, $totalQuestions, $questionsCorrect, $sectionScore, $minTopicScore)
    {
        $sectionEvaluationResult->setTotalQuestions($totalQuestions);
        $sectionEvaluationResult->setQuestionsCorrect($questionsCorrect);
        $sectionEvaluationResult->setScore($sectionScore);
        if ($sectionScore>=41 && $minTopicScore>=0.75) {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Orange");
        } else {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Green");
            $sectionEvaluationResult->setShowResult(true);
        }

    }

}