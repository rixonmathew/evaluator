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
            <div id="testDetails" class="scroll-div" hidden="true">
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