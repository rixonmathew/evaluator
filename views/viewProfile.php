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
                <div class="panel-heading"><strong class="">Regsiter</strong>
                </div>
                <div class="panel-body">
                    <form id = "userDetails" class="form-horizontal" role="form" method="post" action="register">
                        <div class="form-group">
                            <label for="firstName" class="col-sm-3 control-label">First Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="firstName" placeholder="First Name"
                                       name="firstName" required="true" value="<?=$firstName?>" readonly>
                            </div>
                            <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="lastName" placeholder="Last Name"
                                       name="lastName" required="true" value="<?=$lastName?>" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email"
                                       name="email" required="true" value="<?=$userName?>" readonly>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

