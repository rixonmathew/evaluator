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
        $testDataModel = new TestDataModel(1,$this->registry->db);
        $passages = $testDataModel->getPassages($section);
        $sectionScore = 0;
        $questionsCorrect = 0;
        $questionsIncorrect = 0;
        list($sectionScore, $questionsCorrect, $questionsIncorrect) = $this->calculateSectionScore($passages, $testDataModel, $sectionScore, $questionsCorrect, $questionsIncorrect);
        $this->registry->template->sectionScore = $sectionScore;
        $this->registry->template->questionsCorrect = $questionsCorrect;
        $this->registry->template->questionsIncorrect = $questionsIncorrect;
        $this->registry->template->show('sectionEvaluation');
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
            }
        }
        return array($sectionScore, $questionsCorrect, $questionsIncorrect);
    }
}