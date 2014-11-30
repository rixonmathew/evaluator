<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 30/11/14
 * Time: 9:02 PM
 * To change this template use File | Settings | File Templates.
 */

class SectionOneEvaluator {

    public function doEvaluate($testDataModel,$sectionId) {
        $sectionEvaluationResult = new SectionEvaluationResult();
        $sectionEvaluationResult->setSectionId($sectionId);
        $this->calculateSectionScore($testDataModel,$sectionEvaluationResult,$sectionId);
        return $sectionEvaluationResult;
    }

    public function getNextSection() {
        return 2;
    }

    private function calculateSectionScore($testDataModel,$sectionEvaluationResult,$sectionId)
    {
        $passages = $testDataModel->getPassages($sectionId);
        $sectionScore=0;
        $questionsCorrect=0;
        $totalQuestions=0;
        $questionsIncorrect=0;
        foreach ($passages as $passage) {
            $questions = $testDataModel->getQuestionsForPassage($passage->getId());
            foreach ($questions as $question) {
                $totalQuestions++;
                $questionType = $question->getType();
                if ($questionType=="multiple_choice") {
                    $answers = $testDataModel->getAnswersForQuestion($question->getId());
                    foreach ($answers as $answer) {
                        if ($answer->getCorrect()) {
                            $variableName = $question->getId() . "_answer";
                            if (isset($_POST[$variableName])) {

                                $selectedAnswer = $_POST[$variableName];
                                if ($selectedAnswer == $answer->getId()){
                                    $sectionScore += 1;
                                    $questionsCorrect++;
                                }
                            } else {
                                $questionsIncorrect++;
                            }
                        }
                    }
                } else {
                    $evaluatingClass = $question->getEvaluatingClass();

                    if (!is_null($evaluatingClass)) {
                        $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                        include $fileToInclude;
                        $variableName = $question->getId() . "_answer";
                        $selectedAnswer = $_POST[$variableName];
                        $objectForEvaluating = new $evaluatingClass();
                        //todo get the user provided answer and expected answer if any;
                        $objectForEvaluating->doEvaluate($question,$selectedAnswer);
                    }

                }

            }
        }
        $sectionEvaluationResult->setTotalQuestions($totalQuestions);
        $sectionEvaluationResult->setQuestionsCorrect($questionsCorrect);
        $sectionEvaluationResult->setScore($sectionScore);
    }

}