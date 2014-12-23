<?php

class SectionFiveEvaluator extends AbstractSectionEvaluator{

    function __construct()
    {
        $this->nextSection="NA";
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
        $sectionEvaluationResult->setComprehensionGrade("3");
        if ($sectionScore>=33 && $minTopicScore>=0.75) {
            $sectionEvaluationResult->setCommunicationGrade("Purple");
        } else {
            $sectionEvaluationResult->setCommunicationGrade("Orange");
        }
        $sectionEvaluationResult->setShowResult(true);
    }


}