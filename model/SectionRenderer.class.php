<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 30/11/14
 * Time: 12:26 AM
 * To change this template use File | Settings | File Templates.
 */

class SectionRenderer {

    private $testDataModel;

    function __construct($testDataModel)
    {
        $this->testDataModel = $testDataModel;
    }


    public function renderPassage($passage) {
        $htmlString = <<<HTML_PASSAGE
        <div>
            <div class=row">
               <h3>{$passage->getDescription()}</h3>
            </div>
            <br/>
HTML_PASSAGE;

        $questions = $this->testDataModel->getQuestionsForPassage($passage->getId());
        foreach ($questions as $question) {
            $htmlString.= $this->getHTMLForQuestion($question);
        }
        $htmlString.="</div>".PHP_EOL;
        $htmlString.="<hr/>".PHP_EOL;
        echo $htmlString;
    }

    public function renderQuestion($question) {
        echo $this->getHTMLForQuestion($question);
    }

    private function getHTMLForQuestion($question) {
        $htmlString="";
        $questionType = $question->getType();
        if ($questionType=="multiple_choice") {
            $htmlString.= <<<QUESTION_PASSAGE
            <div id="questionSet" class="row">
                <div class="col-md-9">
                    <h5>{$question->getText()}</h5>
                </div>
            </div>
QUESTION_PASSAGE;
        } else if ($questionType=="fill_blank") {
            $rawQuestion = $question->getText();
            $formattedQuestion = preg_replace('/_#answer(\d{1,2})#_/',"<input type=\"text\" id=\"q_{$question->getId()}_answer_$1\">",$rawQuestion);
            $htmlString.= <<<QUESTION_PASSAGE
            <div id="questionSet" class="row">
                <div class="col-md-9">
                    <h5>{$formattedQuestion}</h5>
                </div>
            </div>
QUESTION_PASSAGE;
        } else {
            $renderingClass = $question->getRenderingClass();
            if (!is_null($renderingClass)) {
                $fileToInclude = __SITE_PATH.'/controller/custom/'.$renderingClass.'.php';
                include $fileToInclude;
                $objectForRendering = new $renderingClass();
                $htmlString.= $objectForRendering->doEvaluate($question);
            }
        }
        if ($questionType=="multiple_choice") {
            $answers = $this->testDataModel->getAnswersForQuestion($question->getId());
            $counter = 1;
            foreach ($answers as $answer) {
                $htmlString.= <<<ANSWER_PASSAGE
                <div id="answerSet{$counter}" class="row">
                    <div class="col-md-9">
                        <div class="radio">
                            <label>
                                <input type="radio" id="{$question->getId()}_answer"
                                       name="{$question->getId()}_answer"
                                       value="{$answer->getId()}">{$answer->getText()}
                            </label>
                            <br/>
                        </div>
                    </div>
                </div>
ANSWER_PASSAGE;
            }
        }
        return $htmlString;
    }
}