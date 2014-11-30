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


    /*
                         $passages = $testDataModel->getPassages($sectionNumber);
                    foreach ($passages as $passage) {
                        ?>
                        <div class=row">
                            <div class="col-md-9">
                                <h2>
                                    <block><?= $passage->getDescription() ?></block>
                                </h2>
                            </div>
                        </div>
                        <br/>
                        <?php
                        $questions = $testDataModel->getQuestionsForPassage($passage->getId());
                        foreach ($questions as $question) {
                            $questionType = $question->getType();
                            if ($questionType=="multiple_choice") { ?>
                                <div id="questionSet" class="row">
                                    <div class="col-md-5">
                                        <h4><?= $question->getText() ?></h4>
                                    </div>
                                </div>
                            <?php
                            } else {
                                $renderingClass = $question->getRenderingClass();

                                if (!is_null($renderingClass)) {
                                    $fileToInclude = __SITE_PATH.'/controller/custom/'.$renderingClass.'.php';
                                    include $fileToInclude;
                                    $objectForRendering = new $renderingClass();
                                    $objectForRendering->doEvaluate($question);
                                }
                            }

                            $answers = $testDataModel->getAnswersForQuestion($question->getId());
                            $counter = 1;
                            foreach ($answers as $answer) {
                                ?>
                                <div id="answerSet<?= $counter ?>" class="row">
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" id="<?= $question->getId() ?>_answer"
                                                       name="<?= $question->getId() ?>_answer"
                                                       value="<?= $answer->getId() ?>"><?= $answer->getText() ?>
                                            </label>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <?php
                                $counter += 1;
                            };
                        };
                    };
                    ?>

     */

    public function renderPassage($passage) {
        $htmlString = <<<HTML_PASSAGE
            <div class=row">
                <div class="col-md-9">
                    <h2>
                        <block>{$passage->getDescription()}</block>
                    </h2>
                </div>
            </div>
            <br/>
HTML_PASSAGE;

        $questions = $this->testDataModel->getQuestionsForPassage($passage->getId());
        foreach ($questions as $question) {
            $questionType = $question->getType();
            if ($questionType=="multiple_choice") {
            $htmlString.= <<<QUESTION_PASSAGE
            <div id="questionSet" class="row">
                <div class="col-md-5">
                    <h4>{$question->getText()}</h4>
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
            $answers = $this->testDataModel->getAnswersForQuestion($question->getId());
            $counter = 1;
            foreach ($answers as $answer) {
                $htmlString.= <<<ANSWER_PASSAGE
                <div id="answerSet{$counter}" class="row">
                    <div class="col-md-5">
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
        echo $htmlString;
    }

    public function renderQuestion($question) {
        echo "Rendering..Question ".$question->getId().PHP_EOL;
    }
}