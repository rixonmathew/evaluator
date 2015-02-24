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
        <div>
            <div class="row">
                <div class="col-md-1">
                    <h3>#</h3>
                </div>
                <div class="col-md-7">
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
            <?
            $counter=1;
            foreach($testAttemptAnswers as $testAttemptAnswer) { ?>
                <div class="row">
                    <div class="col-md-1">
                        <h3><?=$counter++;?></h3>
                    </div>
                    <div class="col-md-7">
                        <h3><?=$testAttemptAnswer->getQuestionText();?></h3>
                    </div>
                    <div class="col-md-3" style="word-wrap: break-word;">
                        <h4><p><?=$testAttemptAnswer->getAnswer();?></p></h4>
                    </div>
                    <div class="col-md-1">
                        <? if ($testAttemptAnswer->getCorrect()=="Yes") { ?>
                            <h4><span class="label label-success">Right</span></h4>
                        <? } else {?>
                            <h4><span class="label label-danger">Wrong</span></h4>
                        <?} ?>
                    </div>
                </div>
            <?}?>
       </div>
</div>
</body>
</html>