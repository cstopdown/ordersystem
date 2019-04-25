<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.order.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${user.nickname}的个人中心</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">欢迎光临，${user.nickname}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">修改登录密码</a></li>
                <li><a href="#">修改支付密码</a></li>
                <li><a href="#">修改个人资料</a></li>
                <li><a href="${pageContext.request.contextPath}/showGoodsServlet">返回首页</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="row">
        <div class="panel panel-default panel-info">
            <div class="panel-heading">账号</div>
            <div class="panel-body" id="account">
                ${user.id}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-default panel-info">
            <div class="panel-heading">昵称</div>
            <div class="panel-body" id="nickname">
                ${user.nickname}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-default panel-info">
            <div class="panel-heading">余额</div>
            <div class="panel-body">
                ￥<span id="balance">${user.balance}</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>