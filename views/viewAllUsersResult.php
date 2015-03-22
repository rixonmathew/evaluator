<? include_once "common/check_authenticated.php" ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
    <script src="js/viewResults.js"></script>
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
            <strong>Results</strong>
        </div>
        <div class="panel panel-body">
            <div>
                <div class="row">
                    <div class="col-md-1">
                        <h3>#</h3>
                    </div>
                    <div class="col-md-4">
                        <h3>User name</h3>
                    </div>
                    <div class="col-md-2">
                        <h4>Test Date and time</h4>
                    </div>
                    <div class="col-md-2">
                        <h4>Communication Score</h4>
                    </div>
                    <div class="col-md-2">
                        <h4>Comprehension score</h4>
                    </div>
                    <div class="col-md-1">
                        <h4>View details</h4>
                    </div>
                </div>
                <hr/>
                <?
                $counter=1;
                foreach($testResults as $testResult) { ?>
                    <div class="row">
                        <div class="col-md-1">
                            <h3><?=$counter++;?></h3>
                        </div>
                        <div class="col-md-4">
                            <h3><?=$testResult->getUserName();?></h3>
                        </div>
                        <div class="col-md-2">
                            <h4><?=$testResult->getTestDateAndTime();?></h4>
                        </div>
                        <div class="col-md-2">
                            <h4><?=$testResult->getCommunicationScore();?></h4>
                        </div>
                        <div class="col-md-2">
                            <h4><?=$testResult->getComprehensionScore();?></h4>
                        </div>
                        <div class="col-md-1">
                            <h4><a href="testAttemptAnswer?testAttemptId=<?=$testResult->getTestAttemptId()?>">Details</a></h4>
                        </div>
                    </div>
                    <hr/>
                <?}?>
        </div>
    </div>
</div>
</body>
</html>