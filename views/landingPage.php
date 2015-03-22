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
        <div class="panel-heading"><h2>Hello, <?= $firstName?></h2></div>
        <div class="panel-body">
            <div>
            <h3><p>What would you like to do today?</p></h3>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="takeTest?testId=1">Take a new English language test</a></li>
                <li role="presentation"><a href="viewAllTestResults">View previous Test results</a></li>
                <? if (isset($isAdmin) && $isAdmin) {?>
                    <li role="presentation"><a href="viewAllUsersTestResults">View All Users Test results</a></li>
                <?}?>
                <li role="presentation"><a href="viewProfile?userId=<?=$userId?>">View profile</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>