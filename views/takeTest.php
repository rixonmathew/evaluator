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
    <script src="js/takeTest.js"></script>
    <script src="js/flipclock.min.js"></script>
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
            <div class="form-group last">
                <div class="row">
                    <button type="button" class="btn btn-default btn-lg" onclick="startTest()">Start</button>
                    <button type="submit" class="btn btn-success btn-lg" onclick="submitTest()">Submit</button>
                    <button type="reset" class="btn btn-default btn-lg">Reset</button>
                    <div class="pull-right">
                        <div class="clock" style="margin:2em;"></div>
                    </div>
                </div>
            </div>
            <div id="testDetails" hidden="true">

                <form id="sectionDetails" class="form" role="form" method="post" action="sectionEvaluation">
                    <input type="hidden" id="sectionNumber" name="sectionNumber" value="<?=$sectionNumber?>">
                    <?php
                    $passages = $testDataModel->getPassages($sectionNumber);
                    foreach($passages as $passage) {
                        echo "<div class=\"row\" \"scrollable\">";
                        echo "  <div class=\"col-md-9\">";
                        echo "<h2>{$passage->getDescription()}</h2>";
                        echo " </div>";
                        echo "</div><br/>";
                        echo "<div id=\"questionSet\">";
                        $questions = $testDataModel->getQuestionsForPassage($passage->getId());
                        foreach($questions as $question) {
                            echo "<div id=\"question\" class=\"row\">";
                            echo "    <div class=\"col-md-5\">";
                            echo "<h3>{$question->getText()}</h3>";
                            echo "   </div>";
                            echo "</div>";
                            $answers = $testDataModel->getAnswersForQuestion($question->getId());
                            $counter=1;
                            foreach($answers as $answer){
                               echo "<div id=\"answerSet$counter\" class=\"row\">";
                               echo "   <div class=\"col-lg-6\">";
                               echo "      <div class=\"input-group\">";
                               echo "          <span class=\"input-group-addon\">";
                               echo "              <input type=\"checkbox\" name=\"q{$question->getId()}_answer_{$answer->getId()}\">";
                               echo "          </span>";
                               echo "          <span class=\"form-control\">".$answer->getText()."</span>";
                               echo "      </div>";
                               echo "  </div>";
                               echo "</div>";
                               $counter+=1;
                            };
                        };
                    };
                ?>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>