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
</head>
<body>
<div class="container">
    <div class="header">
        <ul class="nav nav-pills pull-right">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">LeapForWord English Certification</h3>
    </div>
    <div class="row">
        <div>
            <div class="panel panel-default">
                <div class="panel-heading"><strong class="">Question</strong>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" name="question_details" role="form" method="post" action="">
                        <div class="form-group">
                            <label for="questionText" class="col-sm-3 control-label">Question</label>
                            <textarea name="questionText" id="questionText" cols="3" rows="2"/>
                            <label for="inputEmail3" class="col-sm-3 control-label">Email</label>

                        </div>
                        <div class="form-group">
                            <label for="answer1" class="col-sm-3 control-label">Answer 1</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="answer1" name="answer1" placeholder="Enter answer"
                                       name="password" required="true">
                            </div>
                            <div class="col-sm-9">
                                <input type="checkbox" class="form-control" id="isCorrrectAnswer1" name="isCorrrectAnswer1">
                            </div>

                            <div class="col-sm-9">
                                <input type="button" class="form-control" value="+" onclick="">
                            </div>

                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm">Sign in</button>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>
<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="js/question.js"></script>
</body>
</html>