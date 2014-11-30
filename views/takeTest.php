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
        <div class="panel-heading">Section <?= $sectionNumber ?></div>
        <div class="panel-body">
            <div class="form-group">
                <div class="row">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-lg" onclick="startTest()">Start</button>
                        <button type="reset" class="btn btn-default btn-lg">Reset</button>
                    </div>
                    <div class="pull-right">
                        <div class="clock" style="margin:2em;"></div>
                        <h6>Clock provided by <a href="http://flipclockjs.com/">flipclockjs</a></h6>
                    </div>
                </div>
            </div>
            <div id="testDetails" class="scroll-div" hidden="true">
                <form id="sectionDetails" class="form" role="form" method="post" action="sectionEvaluation">
                    <input type="hidden" id="timeForTest" name="timeForTest" value="<?= $timeForTest?>">
                    <input type="hidden" id="sectionNumber" name="sectionNumber" value="<?= $sectionNumber ?>">
                    <?php
                    $sectionQuestions = $testDataModel->getSectionQuestions($sectionNumber);
                    foreach($sectionQuestions as $sectionQuestion) {
                        if ($sectionQuestion->isQuestionSet()) {
                            $passage = $testDataModel->getPassage($sectionQuestion->getQuestionSetDefinitionId());
                            $sectionRenderer->renderPassage($passage);
                        } else {
                            $question = $testDataModel->getQuestion($sectionQuestion->getQuestionId());
                            $sectionRenderer->renderQuestion($question);
                        }
                    }
                    ?>
                </form>
                <br/>
                <div class="form-group">
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success btn-lg" onclick="submitTest()">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>