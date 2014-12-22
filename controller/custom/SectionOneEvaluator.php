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
                } else if ($questionType=="fill_blank"){
                    $evaluatingClass = $question->getEvaluatingClass();
                    if (!is_null($evaluatingClass)) {
                        $fileToInclude = __SITE_PATH.'/controller/custom/'.$evaluatingClass.'.php';
                        include_once $fileToInclude;
                        $variableName = $question->getId() . "_answer";
                        $selectedAnswer = $_POST[$variableName];
                        //TODO loop over all answer where keyname is like the patter and add answer in selected answer
                        //TODO From question get correct answer in array
                        $objectForEvaluating = new $evaluatingClass();
                        //todo get the user provided answer and expected answer if any;
                        $objectForEvaluating->doEvaluate($question,$selectedAnswer);
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
        $sectionEvaluationResult->setCommunicationGrade("RED");
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