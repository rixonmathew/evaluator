<?php

class SectionThreeEvaluator extends AbstractSectionEvaluator{

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
        if ($sectionScore>=21 && $minTopicScore>=0.75) {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Yellow");
            $sectionEvaluationResult->setShowResult(true);
        } else {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Red");
            $sectionEvaluationResult->setShowResult(true);
        }
    }

}