<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.order.domain.Goods" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="com.order.dao.HistoryOrderDao" %>
<%@ page import="com.order.impl.HistoryOrderDaoImpl" %>
<%@ page import="com.order.domain.HistoryOrder" %>
<%@ page import="com.order.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-4-25 0025
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>历史订单</title>
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
            <a class="navbar-brand" href="#">${sessionScope.user.nickname}的历史订单</a>
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
    <table class="table table-hover">
        <tr>
            <td>订单编号</td>
            <td>订单时间</td>
            <td>订单总额</td>
            <td>订单状态</td>
            <td>订单详情</td>
            <td><a href="#">订单管理</a></td>
        </tr>
        <%
            User user = (User) request.getSession().getAttribute("user");
            HistoryOrderDao historyOrderDao=new HistoryOrderDaoImpl();
            List<HistoryOrder> list=historyOrderDao.showAll(user.getId());
            for (HistoryOrder historyOrder:list ) {
                 int id=historyOrder.getH_id();
                 String date= historyOrder.getH_date();
                 int sum=historyOrder.getH_sum();
                 int state=historyOrder.getH_state();
                 String desc=historyOrder.getH_desc();

        %>
        <tr>
            <td><%=id%></td>
            <td><%=date%></td>
            <td><%=sum%></td>
            <td><%=state%></td>
            <td><%=desc%></td>
            <td><a href="#">删除</a></td>
        </tr>
        <%
            }
        %>


    </table>
</nav>
</body>
</html>
