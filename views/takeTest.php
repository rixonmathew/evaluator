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
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/question.js"></script>
</head>
<body>
<div class="container">
    <div class="header">
        <ul class="nav nav-pills pull-right">
            <li class="active"><a href="#">Home</a></li>
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
            <strong>Section <?=$sectionNumber?></strong>
        </div>
        <div class="panel panel-body">
            <form id="sectionDetails" class="form" role="form" method="post" action="sectionEvaluation">
                <input type="hidden" id="questionAttributes" name="questionAttributes" value="default">
                <input type="hidden" id="operation" name="operation" value="view">
                <div class="row">
                    <div class="col-md-1">
                        <label for="test">Enter question</label>
                    </div>
                    <div class="col-md-9">
                        <textarea rows="3" cols="70" name="text" class="form-control" required="true"></textarea>
                    </div>
                </div>
                <div id="answerSet">
                    <div id="answerSetHeading" class="row active">
                        <div class="col-md-3">
                            <label>Enter Answer</label>
                        </div>
                        <div class="col-md-2">
                            <label>Correct</label>
                        </div>
                    </div>
                    <div id="answerSet1" class="row">
                        <div class="col-md-3">
                            <textarea rows="3" cols="20" name="answer1" class="form-control" required="true"></textarea>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" name="isCorrectAnswer1">
                        </div>
                    </div>
                    <div id="answerSet2" class="row">
                        <div class="col-md-3">
                            <textarea rows="3" cols="20" name="answer2" class="form-control" required="true"></textarea>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" name="isCorrectAnswer2" required="true">
                        </div>
                    </div>
                    <div id="answerSet3" class="row">
                        <div class="col-md-3">
                            <textarea rows="3" cols="20" name="answer3" class="form-control" required="true"></textarea>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" name="isCorrectAnswer3">
                        </div>
                    </div>
                    <div id="answerSet1" class="row">
                        <div class="col-md-3">
                            <textarea rows="3" cols="20" name="answer4" class="form-control" required="true"></textarea>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" name="isCorrectAnswer4">
                        </div>
                    </div>
                </div>
                <div id="otherInformation" class="row">
                    <div class="col-md-2">
                        <select class="form-control" name="complexity">
                            <option value="Simple">Simple</option>
                            <option value="Medium">Medium</option>
                            <option value="Complex">Complex</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="attributes">Enter attributes</label>
                        <div contenteditable="true" id="attributesDiv">
                            <kbd>English</kbd>
                        </div>
                    </div>
                </div>
                <div class="form-group last">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-success btn-sm">Save</button>
                        <button type="reset" class="btn btn-default btn-sm">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>