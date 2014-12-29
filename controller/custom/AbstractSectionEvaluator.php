<?php

abstract class AbstractSectionEvaluator {
    protected $nextSection;
    protected $sectionEvaluationResult;
    protected $sectionQuestions;
    protected $sectionScore=0;
    protected $questionsCorrect=0;
    protected $totalQuestions=0;
    protected $questionsIncorrect=0;
    protected $totalQuestionsForTopic = array();
    protected $correctQuestionsForTopic = array();


    function __construct()
    {

    }

    public function doEvaluate($testDataModel,$sectionId) {
//        foreach ($_POST as $key => $value) {
//            echo "Got [$key] with value [$value] <br/>";
//        }
        $this->sectionEvaluationResult = new SectionEvaluationResult();
        $this->sectionEvaluationResult->setSectionId($sectionId);
        $this->calculateSectionScore($testDataModel,$sectionId);
        return $this->sectionEvaluationResult;
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



    protected function calculateSectionScore($testDataModel,$sectionId)
    {
        $this->sectionQuestions = $testDataModel->getSectionQuestions($sectionId);

        foreach($this->sectionQuestions as $sectionQuestion) {
            if ($sectionQuestion->isQuestionSet()) {
                $passage = $testDataModel->getPassage($sectionQuestion->getQuestionSetDefinitionId());
                $questions = $testDataModel->getQuestionsForPassage($passage->getId());
                foreach ($questions as $question) {
                    $this->evaluateQuestion($testDataModel,$question);
                }
            } else {
                $question = $testDataModel->getQuestion($sectionQuestion->getQuestionId());
                $this->evaluateQuestion($testDataModel,$question);
            }
        }
        $topicScores = array();
        foreach ($this->totalQuestionsForTopic as $topic => $topicValue) {
            if (isset($this->correctQuestionsForTopic[$topic])){
                $topicScores[$topic] = bcdiv($this->correctQuestionsForTopic[$topic], $topicValue, 3);
            } else {
                $topicScores[$topic] = 0;
            }
        }

        $this->sectionEvaluationResult->setTopicScores($topicScores);
        $minTopicScore = $this->calculateMinimumTopicScore($topicScores);
        //echo "In Evaluator {$this->totalQuestions}, {$this->questionsCorrect}, {$this->sectionScore},$minTopicScore <br/>";
        $this->populateResults($this->sectionEvaluationResult, $this->totalQuestions, $this->questionsCorrect, $this->sectionScore,$minTopicScore);
    }

    /**
     * @param $sectionEvaluationResult passed by reference as its updated
     * @param $totalQuestions
     * @param $questionsCorrect
     * @param $sectionScore
     * @param $minTopicScore
     */
    protected abstract function populateResults(&$sectionEvaluationResult, $totalQuestions, $questionsCorrect, $sectionScore, $minTopicScore);

    private function calculateMinimumTopicScore($topicScores) {
        $minTopicScore = 1;
        foreach ($topicScores as $topic => $score) {
            if ($score<=$minTopicScore) {
                $minTopicScore = $score;
            }
        }
        return $minTopicScore;
    }

    /**
     * @param $testDataModel
     * @param $question
     */
    private function evaluateQuestion($testDataModel,$question)
    {

        if ($question->getTopic() !== null) {
            $countPerTopic = 1;
            if (isset($this->totalQuestionsForTopic[$question->getTopic()])) {
                $countPerTopic = $this->totalQuestionsForTopic[$question->getTopic()];
                $countPerTopic++;
            }
            $this->totalQuestionsForTopic[$question->getTopic()] = $countPerTopic;
        }

        $testAttemptAnswer = new TestAttemptAnswer();
        $testAttemptAnswer->setQuestionId($question->getId());

        $questionType = $question->getType();
        if ($questionType == "multiple_choice") {
            $this->totalQuestions++;
            $answers = $testDataModel->getAnswersForQuestion($question->getId());
            foreach ($answers as $answer) {
                $variableName = $question->getId() . "_answer";
                $selectedAnswer = "";
                if (isset($_POST[$variableName])) {
                    $selectedAnswer = $_POST[$variableName];
                }
                if ($answer->getCorrect() && ($answer->getId()==$selectedAnswer)) {
                    $this->sectionScore += 1;
                    $this->questionsCorrect++;
                    $testAttemptAnswer->setAnswer($answer->getRawText());
                    $testAttemptAnswer->setCorrect(1);

                    if ($question->getTopic() !== null) {
                        $countOFCorrectAnswersPerTopic = 1;
                        if (isset($this->correctQuestionsForTopic[$question->getTopic()])) {
                            $countOFCorrectAnswersPerTopic = $this->correctQuestionsForTopic[$question->getTopic()];
                            $countOFCorrectAnswersPerTopic++;
                        }
                        $this->correctQuestionsForTopic[$question->getTopic()] = $countOFCorrectAnswersPerTopic;
                    }
                } else if ($answer->getId()==$selectedAnswer) {
                    $this->questionsIncorrect++;
                    $testAttemptAnswer->setAnswer($answer->getRawText());
                    $testAttemptAnswer->setCorrect(0);
                }
            }
        } else if ($questionType == "fill_blank") {
            $evaluatingClass = $question->getEvaluatingClass();
            if (!is_null($evaluatingClass)) {
                $fileToInclude = __SITE_PATH . '/controller/custom/' . $evaluatingClass . '.php';
                include_once $fileToInclude;
                $objectForEvaluating = new $evaluatingClass();
                $variableName = "q_".$question->getId() . "_answer_";
                $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                $arrayOfWords = explode(",", $correctAnswer[0]->getRawText());
                foreach ($_POST as $key => $value) {
                    if (strpos($key, $variableName) !== false) {
                        $this->totalQuestions++;
                        $selectedAnswer = $_POST[$key];
                        $questionScore = $objectForEvaluating->doEvaluate($question, $selectedAnswer, $arrayOfWords);
                        $arr = explode(":", $questionScore);
                        $this->sectionScore += $arr[0];
                        $testAttemptAnswer->setAnswer($selectedAnswer);
                        if ($arr[0] > 0 && $question->getTopic() !== null) {
                            $testAttemptAnswer->setCorrect(1);
                            $countOFCorrectAnswersPerTopic = 1;
                            if (isset($this->correctQuestionsForTopic[$question->getTopic()])) {
                                $countOFCorrectAnswersPerTopic = $this->correctQuestionsForTopic[$question->getTopic()];
                                $countOFCorrectAnswersPerTopic++;
                            }
                            $this->correctQuestionsForTopic[$question->getTopic()] = $countOFCorrectAnswersPerTopic;
                        } else {
                            $testAttemptAnswer->setCorrect(0);
                        }
                    }
                }
            }
        } else {
            $evaluatingClass = $question->getEvaluatingClass();
            if (!is_null($evaluatingClass)) {
                $fileToInclude = __SITE_PATH . '/controller/custom/' . $evaluatingClass . '.php';
                include_once $fileToInclude;
                $this->totalQuestions++;
                $variableName = $question->getId() . "_answer";
                $selectedAnswer = $_POST[$variableName];
                $testAttemptAnswer->setAnswer($selectedAnswer);
                $correctAnswer = $testDataModel->getAnswersForQuestion($question->getId());
                $arrayOfWords = explode(",", $correctAnswer[0]->getText());
                $objectForEvaluating = new $evaluatingClass();
                $questionScore = $objectForEvaluating->doEvaluate($question, $selectedAnswer, $arrayOfWords);
                $arr = explode(":", $questionScore);
                $this->sectionScore += $arr[0];
                if ($arr[0] > 0 && $question->getTopic() !== null) {
                    $countOFCorrectAnswersPerTopic = 1;
                    $testAttemptAnswer->setCorrect(1);
                    if (isset($this->correctQuestionsForTopic[$question->getTopic()])) {
                        $countOFCorrectAnswersPerTopic = $this->correctQuestionsForTopic[$question->getTopic()];
                        $countOFCorrectAnswersPerTopic++;
                    }
                    $this->correctQuestionsForTopic[$question->getTopic()] = $countOFCorrectAnswersPerTopic;
                } else {
                    $testAttemptAnswer->setCorrect(0);
                }
            }
        }
        $this->sectionEvaluationResult->addTestAttemptAnswer($testAttemptAnswer);
    }
}