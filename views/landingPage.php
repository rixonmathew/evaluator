<? include_once "common/check_authenticated.php" ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
</head>
<body>
<div class="container">
    <? include_once "common/nav.php" ?>
    <div class="panel panel-default">
        <div class="panel-heading"><h2>Hello, <?= $first_name?></h2></div>
        <div class="panel-body">
            <div>
            <h3><p>What would you like to do today?</p></h3>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="takeTest?testId=1">Take a new English language test</a></li>
                <li role="presentation"><a href="viewTestResults">View previous Test results</a></li>
                <li role="presentation"><a href="#">View profile</a></li>
                <li role="presentation"><a href="#">Update profile</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>