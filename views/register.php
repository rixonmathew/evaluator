<!DOCTYPE html>
<html>
<head lang="en">
    <? include_once "common/header.php" ?>
    <script src="js/register.js"></script>
</head>
<body>
<div class="container">
    <? include_once "common/nav.php" ?>
    <div class="row">
        <div>
            <div class="panel panel-default">
                <div class="panel-heading"><strong class="">Regsiter</strong>
                </div>
                <div class="panel-body">
                    <form id = "userDetails" class="form-horizontal" role="form" method="post" action="register">
                        <input type="hidden" id="operation" name="operation">
                        <div class="form-group">
                            <label for="firstName" class="col-sm-3 control-label">First Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="firstName" placeholder="First Name"
                                       name="firstName" required="true">
                            </div>
                            <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="lastName" placeholder="Last Name"
                                       name="lastName" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email"
                                       name="email" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password"
                                       name="password" required="true">
                            </div>
                            <label for="inputPassword1" class="col-sm-3 control-label">Confirm Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword1" placeholder="Password"
                                       name="password1" required="true">
                            </div>
                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm">Register</button>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>