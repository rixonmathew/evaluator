<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
</head>
<body>
<div class="container">
    <? include_once "common/nav.php" ?>
    <div class="row">
        <div>
            <div class="panel panel-default">
                <div class="panel-heading"><strong class="">Login</strong>
                </div>
                <div class="panel-body">
                    <?php if (isset($login_failed)){?>
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <strong>Warning!</strong> Invalid Credentials.Please try again.
                    </div>
                    <?php } ?>
                    <? include_once "common/show_alert.php" ?>
                    <form class="form-horizontal" role="form" method="post" action="authenticate">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">Email</label>

                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email"
                                       name="email" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-3 control-label">Password</label>

                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password"
                                       name="password" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label class="">
                                        <input type="checkbox" class="">Remember me</label>
                                </div>
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
                <div class="panel-footer">Not Registered? <a href="register" class="">Register here</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>