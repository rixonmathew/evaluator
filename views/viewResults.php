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
            <ul class="nav nav-pills nav-stacked">
            <?
            foreach($testResults as $testResult) { ?>
                <li role="presentation"><a href="viewResults?resultId=<?=$testResult->getId()?>"><?=$testResult->getDate()?></a></li>
            <?}?>
            </ul>
        </div>
    </div>
</div>
</body>
</html>