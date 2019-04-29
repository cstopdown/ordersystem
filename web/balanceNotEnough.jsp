<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>您的余额不足，请充值</title>

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
            <a class="navbar-brand" href="#">欢迎您，${user.nickname}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->

    </div><!-- /.container-fluid -->
</nav>

<div style="margin-top: 200px" class="col-xs-offset-3 col-xs-5">
    <p class="bg-success" style="height: 100px;width: 800px;padding-top: 35px" align="center">您的余额不足，将在<span id="seconds">3</span>秒内跳转至个人中心</p>
</div>
<script>
    var i=3;
    var seconds = document.getElementById("seconds");
    window.setInterval(f,1000);
    function f() {
        i--;
        if (i!=0){
            seconds.innerText=i;
        } else{
            window.location.href="${pageContext.request.contextPath}/userInfoServlet";
        }

    }

</script>
</body>
</html>