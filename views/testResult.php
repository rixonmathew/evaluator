<? include_once "common/check_authenticated.php" ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
    <script src="js/sectionEvaluation.js"></script>
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
            <!--TODO This needs to be hidden -->
            <!--<h2> Your score is <?=$sectionScore?>. You got <?=$questionsCorrect?> questions correct out of  <?=$questionsTotal?> questions</h2> -->
            <h2> Test Date and time  : <?=$testDateAndTime?></h2>
            <h2> Comprehension Score  : <?=$comprehensionScore?></h2>
            <h2> Communication Score  : <?=$communicationScore?></h2>
            <h2> <a href="testAttemptAnswer?testAttemptId=<?=$testAttemptId?>">View Answers</a></h2>
        </div>

    </div>
</div>
</body>
</html>