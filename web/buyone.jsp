<%@ page import="java.util.Map" %>
<%@ page import="com.order.domain.Goods" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-4-25 0025
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请输入支付密码</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
    <script>
        function pay() {
            var search = location.search;
            var number = search.indexOf("=");
            var s = search.substring(number+1);

            var val = $("#paypwd").val();
            $.post("${pageContext.request.contextPath}/checkPayPasswordServlet",
                {uid:'${sessionScope.user.id}',
                paypwd:val},
            function (data) {
                if (data=='true'){  //支付密码正确
                    //检查余额是否充足
                    $.post("${pageContext.request.contextPath}/checkBalanceEnoughServlet",
                        {uid:'${sessionScope.user.id}',gid:s},
                    function (data) {
                        if (data=='true'){  //充足
                            //扣钱，更新账户，更新订单
                            $.post("${pageContext.request.contextPath}/buyOneServlet",
                                {uid:'${sessionScope.user.id}',gid:s})
                            //提示支付成功
                            alert("购买成功！");
                            //跳转至首页
                            location.href='${pageContext.request.contextPath}/showGoodsServlet';

                        } else {    //不充足
                            alert("您的余额不足，请充值！");
                            location.href='balanceNotEnough.jsp';
                        }
                    })

                } else{ //支付密码错误
                    alert("支付密码错误！");
                }
            })
        }
    </script>

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
            <a class="navbar-brand" href="#">${sessionScope.user.nickname}请您支付</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="showGoodsServlet">首页</a></li>
                <li><a href="OrderCar.jsp">购物车</a></li>
                <li><a href="historyOrder.jsp">历史订单</a></li>
                <li><a href="${pageContext.request.contextPath}/userInfoServlet">个人中心</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="col-xs-6">
    <div class="input-group">
        <input type="password" class="form-control" placeholder="请输入支付密码" id="paypwd">
        <span class="input-group-btn">
        <button class="btn btn-default" type="button" onclick="pay()">确认</button>
      </span>
    </div><!-- /input-group -->
</div><!-- /.col-lg-6 -->
</div><!-- /.row -->
</body>
</html>
