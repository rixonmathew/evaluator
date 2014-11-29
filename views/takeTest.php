<? include_once "common/check_authenticated.php" ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
    <script src="js/takeTest.js"></script>
    <link rel="stylesheet" href="css/flipclock.css">
    <script src="js/flipclock.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <? include_once "common/nav.php" ?>
    <? if (isset($show_alert) && $show_alert) { ?>
        <div class="alert alert-<?= $alert_type ?> alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            <?= $question_message ?>
        </div>
    <? } ?>
    <div class="panel panel-default">
        <div class="panel panel-heading">
            <strong>Section <?= $sectionNumber ?></strong>
        </div>
        <div class="panel panel-body">
            <div class="form-group">
                <div class="row">
                    <button type="button" class="btn btn-default btn-lg" onclick="startTest()">Start</button>
                    <button type="reset" class="btn btn-default btn-lg">Reset</button>
                    <div class="pull-right">
                        <div class="clock" style="margin:2em;"></div>
                        <h6>Clock provided by <a href="http://flipclockjs.com/">flipclockjs</a></h6>
                    </div>

                </div>
            </div>
            <div id="testDetails" class="scroll-div" hidden="true">
                <form id="sectionDetails" class="form" role="form" method="post" action="sectionEvaluation">
                    <input type="hidden" id="sectionNumber" name="sectionNumber" value="<?= $sectionNumber ?>">
                    <?php
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
                </form>
                <div class="form-group">
                    <div class="row">
                        <button type="submit" class="btn btn-success btn-lg" onclick="submitTest()">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>