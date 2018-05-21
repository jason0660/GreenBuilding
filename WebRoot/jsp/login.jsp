<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8"/>
    <title>绿色建筑评价管理登录</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=yes">
    <meta http-equiv="Content-Type" content="text/html" >
    <!-- BOOTSTRAP STYLES-->
    <link href="/GreenBuilding/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES--> 
    <link href="/GreenBuilding/css/font-awesome.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>
<body style="background-color: #E2E2E2;">
    <div class="container">
        <div class="row text-center " style="padding-top:100px;">
        	<img src="/GreenBuilding/img/logo.png"/>
        </div>
        <div class="row" style="border:0px solid #F60;">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1" style="border:0px solid #F90;padding-top:0px;">
                <div class="panel-body" style="border:0px solid #F00;padding-top:0px;">
                    <form role="form" method="post">
                        <hr/>
                        <h5>请输入登录信息</h5>
                        <br/>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-tag"></i></span>
                            <input type="text" class="form-control" name="username" placeholder="请输入用户名"/>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control" name="password" placeholder="请输入密码"/>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-inline"><input type="checkbox"/> 保存用户名密码</label>
                        </div>
                        <a type="submit" href="/GreenBuilding/jsp/index.jsp" class="btn btn-primary">用户登录</a>
                        <hr/>
                        Not register ? <a href="/GreenBuilding/jsp/index.jsp">click here </a> or go to <a href="/GreenBuilding/jsp/index.jsp">Home</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>