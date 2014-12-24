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
        $sectionEvaluationResult->setComprehensionGrade("3");
        $sectionEvaluationResult->setShowResult(true);
        if ($sectionScore>=21 ) {
            $sectionEvaluationResult->setCommunicationGrade("Yellow");
        } else {
            $sectionEvaluationResult->setCommunicationGrade("Red");
        }
    }

}