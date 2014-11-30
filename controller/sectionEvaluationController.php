<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 02/11/14
 * Time: 11:59 PM
 */

class sectionEvaluationController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
//        foreach ($_POST as $key => $value)
//          echo "Field ".htmlspecialchars($key)." is ".htmlspecialchars($value)."<br>";

        $section = $_POST['sectionNumber'];
        $testId = $_POST['testId'];
        $testDataModel = new TestDataModel($testId,$this->registry->db);
        $passages = $testDataModel->getPassages($section);
        $sectionScore = 0;
        $questionsCorrect = 0;
        $questionsIncorrect = 0;
        list($sectionScore, $questionsCorrect, $questionsIncorrect) = $this->calculateSectionScore($passages, $testDataModel, $sectionScore, $questionsCorrect, $questionsIncorrect);
        if ($sectionScore<=5) {
            $this->registry->template->sectionScore = $sectionScore;
            $this->registry->template->questionsCorrect = $questionsCorrect;
            $this->registry->template->questionsIncorrect = $questionsIncorrect;
            $this->registry->template->show('sectionEvaluation');
        } else {
            $sectionRenderer = new SectionRenderer($testDataModel);
            $this->registry->template->testDataModel = $testDataModel;
            $this->registry->template->sectionRenderer = $sectionRenderer;
            $this->registry->template->sectionNumber = 2;
            $this->registry->template->show('takeTest');
        }
    }

    /**
     * @param $passages
     * @param $testDataModel
     * @param $sectionScore
     * @param $questionsCorrect
     * @param $questionsIncorrect
     * @return array
     */
    public function calculateSectionScore($passages, $testDataModel, $sectionScore, $questionsCorrect, $questionsIncorrect)
    {
        foreach ($passages as $passage) {
            $questions = $testDataModel->getQuestionsForPassage($passage->getId());
            foreach ($questions as $question) {
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
        return array($sectionScore, $questionsCorrect, $questionsIncorrect);
    }
}