<? include_once "common/check_authenticated.php" ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
</head>
<body>
<div class="container">
    <? include_once "common/nav.php" ?>
    <? if (isset($show_alert) && $show_alert) { ?>
        <div class="alert alert-<?=$alert_type?> alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <?=$question_message?>
        </div>
    <? } ?>
    <div class="panel panel-default">
        <div class="panel panel-heading">
            <strong>Question and Answers</strong>
        </div>
        <div class="panel panel-body">
            <div class="row">
                <div class="col-md-8">
                    <h3>Question</h3>
                </div>
                <div class="col-md-3">
                    <h4>Selected Answer</h4>
                </div>
                <div class="col-md-1">
                    <h4>Is Correct?</h4>
                </div>
            </div>
            <hr/>
            <? foreach($testAttemptAnswers as $testAttemptAnswer) { ?>
                <div class="row">
                    <div class="col-md-8">
                        <h3><?=$testAttemptAnswer->getQuestionText();?></h3>
                    </div>
                    <div class="col-md-3">
                        <h4><span><?=$testAttemptAnswer->getAnswer();?></span></h4>
                    </div>
                    <div class="col-md-1">
                        <? if ($testAttemptAnswer->getCorrect()=="Yes") { ?>
                            <h4><span class="label label-success">Ok</span></h4>
                        <? } else {?>
                            <h4><span class="label label-danger">Incorrect</span></h4>
                        <?} ?>
                    </div>
                </div>
            <?}?>
       </div>
    </div>
</div>
</body>
</html>