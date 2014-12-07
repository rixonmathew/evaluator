<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 30/11/14
 * Time: 9:02 PM
 * To change this template use File | Settings | File Templates.
 */

class SectionFiveEvaluator {

    public function doEvaluate($testDataModel,$sectionId) {
        $sectionEvaluationResult = new SectionEvaluationResult();
        $sectionEvaluationResult->setSectionId($sectionId);
        $this->calculateSectionScore($testDataModel,$sectionEvaluationResult,$sectionId);
        return $sectionEvaluationResult;
    }

    public function getNextSection() {
        return "NA";
    }

    private function calculateSectionScore($testDataModel,$sectionEvaluationResult,$sectionId)
    {
        $sectionQuestions = $testDataModel->getSectionQuestions($sectionId);
        $sectionScore=0;
        $questionsCorrect=0;
        $totalQuestions=0;
        $questionsIncorrect=0;

        foreach($sectionQuestions as $sectionQuestion) {
            if ($sectionQuestion->isQuestionSet()) {
                $passage = $testDataModel->getPassage($sectionQuestion->getQuestionSetDefinitionId());
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
                    } else if ($questionType=="fill_blank"){
                        $evaluatingClass = $question->getEvaluatingClass();
                        if (!is_null($evaluatingClass)) {
                            $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                            include_once $fileToInclude;
                            $objectForEvaluating = new $evaluatingClass();
                            $variableName = $question->getId() . "_answer";
                            $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                            $arrayOfWords  = explode(",",$correctAnswer[0]->getText());
                            foreach ($_POST as $key => $value) {
                                if (strpos($key,$variableName)!==false){
                                    $selectedAnswer = $_POST[$key];
                                    $questionScore = $objectForEvaluating->doEvaluate($question,$selectedAnswer,$arrayOfWords);
                                    $arr = explode(":",$questionScore);
                                    $sectionScore+=$arr[0];
                                }
                            }
                        }
                    } else {
                        $evaluatingClass = $question->getEvaluatingClass();
                        if (!is_null($evaluatingClass)) {
                            $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                            include_once $fileToInclude;
                            $variableName = $question->getId() . "_answer";
                            $selectedAnswer = $_POST[$variableName];
                            $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                            $arrayOfWords  = explode(",",$correctAnswer[0]->getText());
                            $objectForEvaluating = new $evaluatingClass();
                            $questionScore = $objectForEvaluating->doEvaluate($question,$selectedAnswer,$arrayOfWords);
                            $arr = explode(":",$questionScore);
                            $sectionScore+=$arr[0];
                        }
                    }
                }
            } else {
                $question = $testDataModel->getQuestion($sectionQuestion->getQuestionId());
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
                } else if ($questionType=="fill_blank"){
                    $evaluatingClass = $question->getEvaluatingClass();
                    if (!is_null($evaluatingClass)) {
                        $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                        include_once $fileToInclude;
                        $objectForEvaluating = new $evaluatingClass();
                        $variableName = $question->getId() . "_answer";
                        $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                        $arrayOfWords  = explode(",",$correctAnswer[0]->getText());
                        foreach ($_POST as $key => $value) {
                            if (strpos($key,$variableName)!==false){
                                $selectedAnswer = $_POST[$key];
                                $questionScore = $objectForEvaluating->doEvaluate($question,$selectedAnswer,$arrayOfWords);
                                $arr = explode(":",$questionScore);
                                $sectionScore+=$arr[0];
                            }
                        }
                    }
                } else {
                    $evaluatingClass = $question->getEvaluatingClass();
                    if (!is_null($evaluatingClass)) {
                        $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                        include_once $fileToInclude;
                        $variableName = $question->getId() . "_answer";
                        $selectedAnswer = $_POST[$variableName];
                        $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                        $arrayOfWords  = explode(",",$correctAnswer[0]->getText());
                        $objectForEvaluating = new $evaluatingClass();
                        $questionScore = $objectForEvaluating->doEvaluate($question,$selectedAnswer,$arrayOfWords);
                        $arr = explode(":",$questionScore);
                        $sectionScore+=$arr[0];
                    }
                }
            }
        }

        $sectionEvaluationResult->setTotalQuestions($totalQuestions);
        $sectionEvaluationResult->setQuestionsCorrect($questionsCorrect);
        $sectionEvaluationResult->setScore($sectionScore);
        if ($sectionScore<33) {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Orange");
        } else {
            $sectionEvaluationResult->setComprehensionGrade("3");
            $sectionEvaluationResult->setCommunicationGrade("Purple");
        }
        $sectionEvaluationResult->setShowResult(true);
    }
}