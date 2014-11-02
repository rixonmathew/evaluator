<?php
//TODO move this to check authentication page
session_start();
if (!isset($_SESSION['login'])){
    header ("Location: login");
}
?>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Question</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/evaluator.css"/>
    <link rel="stylesheet" href="css/flipclock.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/sectionEvaluation.js"></script>
</head>
<body>
<div class="container">
    <div class="header">
        <ul class="nav nav-pills pull-right">
            <li class="active"><a href="/evaluator">Home</a></li>
            <li><a href="question/allQuestions">View All Questions</a></li>
        </ul>
        <h3 class="text-muted">LeapForWord English Certification</h3>
    </div>

    <? if (isset($show_alert) && $show_alert) { ?>
        <div class="alert alert-<?=$alert_type?> alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <?=$question_message?>
        </div>
    <? } ?>
    <div class="panel panel-default">
        <div class="panel panel-heading">
            <strong>Section Results</strong>
        </div>
        <div class="panel panel-body">
            <h2> Your score is <?=$sectionScore?>. You got <?=$questionsCorrect?> questions correct and <?=$questionsIncorrect?> questions incorrect.</h2>
        </div>

    </div>
</div>
</body>
</html>