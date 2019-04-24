
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>**点餐系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%
    String msg= (String) request.getAttribute("fail");
    if(msg ==null){
        msg="";
    }
%>

<nav class="navbar navbar-default ">
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
            <a class="navbar-brand" href="#">**点餐系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div style="padding-top: 200px">

        <form class="form-horizontal col-xs-offset-3" action="${pageContext.request.contextPath}/login"   method="post" >
            <div class="form-group">
                <label for="inputAccount" class="col-xs-2 control-label">账号</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" id="inputAccount" placeholder="请输入账号" name="id">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-xs-2 control-label">密码</label>
                <div class="col-xs-5">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
                    <span id="checkuser"><%=msg%></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-offset-2 col-xs-10">
                    <button type="submit" class="btn btn-default">登录</button>
                    <button type="submit" class="btn btn-default" formaction="register.jsp">注册</button>
                </div>
            </div>
        </form>

</div>

</body>
</html>