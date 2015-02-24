<?php

class SectionOneEvaluator {

    private $nextSection = 2;

    public function doEvaluate($testDataModel,$sectionId) {
        $sectionEvaluationResult = new SectionEvaluationResult();
        $sectionEvaluationResult->setSectionId($sectionId);
        $this->calculateSectionScore($testDataModel,$sectionEvaluationResult,$sectionId);
        return $sectionEvaluationResult;
    }

    public function getNextSection() {
        return $this->nextSection;
    }

    /**
     * @param int $nextSection
     */
    public function setNextSection($nextSection)
    {
        $this->nextSection = $nextSection;
    }

    private function calculateSectionScore($testDataModel,&$sectionEvaluationResult,$sectionId)
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
                $testAttemptAnswer = new TestAttemptAnswer();
                $testAttemptAnswer->setQuestionId($question->getId());
                $testAttemptAnswer->setCorrect(0);
                $questionType = $question->getType();
                if ($questionType=="multiple_choice") {
                    $answers = $testDataModel->getAnswersForQuestion($question->getId());
                    $variableName = $question->getId() . "_answer";
                    $selectedAnswer="";
                    if (isset($_POST[$variableName])){
                        $selectedAnswer = $_POST[$variableName];
                    }
                    foreach ($answers as $answer) {
                        if ($answer->getCorrect() && ($answer->getId()==$selectedAnswer)) {
                            $sectionScore += 1;
                            $questionsCorrect++;
                            $testAttemptAnswer->setAnswer($answer->getRawText());
                            $testAttemptAnswer->setCorrect(1);
                         } else if ($answer->getId()==$selectedAnswer) {
                            $questionsIncorrect++;
                            $testAttemptAnswer->setAnswer($answer->getRawText());
                            $testAttemptAnswer->setCorrect(0);
                        }
                    }
                } else {
                    $evaluatingClass = $question->getEvaluatingClass();
                    if (!is_null($evaluatingClass)) {
                        $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                        include_once $fileToInclude;
                        $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                        $arrayOfWords  = explode(",",$correctAnswer[0]->getRawText());
                        $variableName = "q_".$question->getId() . "_answer_";
                        $selectedAnswerArray = array();
                        $allWordsCorrect = true;
                        foreach ($_POST as $key => $value) {
                            if (strpos($key, $variableName) !== false) {
                                $totalQuestions++;
                                $selectedAnswer = $_POST[$key];
                                array_push($selectedAnswerArray,$selectedAnswer);
                                $variableNameParts = explode("_",$key);
                                $answerId = $variableNameParts[3];
                                $expectedCorrectAnswer = $arrayOfWords[$answerId-1];
                                if (trim($selectedAnswer)==$expectedCorrectAnswer){
                                    $sectionScore+= 1;
                                    $questionsCorrect++;
                                } else {
                                    $allWordsCorrect = false;
                                }
                            }
                        }
                        $testAttemptAnswer->setAnswer(join(",",$selectedAnswerArray));
                        if ($allWordsCorrect) {
                            $testAttemptAnswer->setCorrect(1);
                        } else {
                            $testAttemptAnswer->setCorrect(0);
                        }
                    }
                }
                $sectionEvaluationResult->addTestAttemptAnswer($testAttemptAnswer);
            }
        }
        $sectionEvaluationResult->setTotalQuestions($totalQuestions);
        $sectionEvaluationResult->setQuestionsCorrect($questionsCorrect);
        $sectionEvaluationResult->setScore($sectionScore);
        $sectionEvaluationResult->setCommunicationGrade("Red");

        if ($sectionScore==25) {
            $sectionEvaluationResult->setComprehensionGrade("3");
        } else if ($sectionScore<25 && $sectionScore>=21) {
            $sectionEvaluationResult->setComprehensionGrade("2");
        } else if ($sectionScore>=17) {
            $sectionEvaluationResult->setComprehensionGrade("1");
        } else {
            $sectionEvaluationResult->setComprehensionGrade("0");
            $sectionEvaluationResult->setShowResult(true);
        }
    }
}