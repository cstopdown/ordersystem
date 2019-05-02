<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.order.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>欢迎本店，请您点单</title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
  <script src="jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
    <script>
        function bling(){
            alert("添加购物车成功");


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
      <a class="navbar-brand" href="#">欢迎光临，${sessionScope.user.nickname}</a>
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
<div class="container">
<%
    String kind = (String) request.getAttribute("kind");
%>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" id="milktea_tab"><a href="#milktea"  aria-controls="milktea" role="tab" data-toggle="tab" onclick="javascript:location.href='${pageContext.request.contextPath}/showGoodsServlet?kind=milktea'" >奶茶</a></li>
    <li role="presentation" id="icecream_tab"><a href="#icecream" aria-controls="icecream" role="tab" data-toggle="tab" onclick="javascript:location.href='${pageContext.request.contextPath}/showGoodsServlet?kind=icecream'">冰淇淋</a></li>
    <li role="presentation" id="fruitdrink_tab"><a href="#fruitdrink" aria-controls="fruitdrink" role="tab" data-toggle="tab" onclick="javascript:location.href='${pageContext.request.contextPath}/showGoodsServlet?kind=fruitdrink'">果饮</a></li>
  </ul>

    <script>

            var kind="${kind}";
            if ("milktea"==kind){
                document.getElementById("milktea_tab").setAttribute("class","active");
            } else if ("icecream"==kind){
                document.getElementById("icecream_tab").setAttribute("class","active");
            } else if ("fruitdrink"==kind){
                document.getElementById("fruitdrink_tab").setAttribute("class","active");
            }

    </script>

  <!-- Tab panes -->
  <div class="tab-content" style="margin-top: 5%">
    <div role="tabpanel" class="tab-pane active">
      <div class="table-responsive">
        <table class="table">
          <tr>
            <td>名称</td>
            <td>价格</td>
            <td>操作</td>
          </tr>
          <c:forEach items="${list}" var="i">
              <tr>
                  <c:if test="${kind=='milktea'}">
                      <td><img src="${pageContext.request.contextPath}/images/bubbletea.jpg" width="70px" height="80px">${i.name}</td>
                      <td>${i.price}</td>
                      <td><a href="#">购买</a><br><a href="ShowOrderCarServlet?kind=milktea&&name=${i.name}&&price=${i.price}" onclick="bling()">加入购物车</a></td>
                  </c:if>

                  <c:if test="${kind=='icecream'}">
                      <td><img src="${pageContext.request.contextPath}/images/icecream.jfif" width="70px" height="80px">${i.name}</td>
                      <td>${i.price}</td>
                      <td><a href="#">购买</a><br><a href="ShowOrderCarServlet?kind=icecream&&name=${i.name}&&price=${i.price}" onclick="bling()">加入购物车</a></td>
                  </c:if>

                  <c:if test="${kind=='fruitdrink'}">
                      <td><img src="${pageContext.request.contextPath}/images/lemontea.jpg" width="70px" height="80px">${i.name}</td>
                      <td>${i.price}</td>
                      <td><a href="#">购买</a><br><a href="ShowOrderCarServlet?kind=fruitdrink&&name=${i.name}&&price=${i.price}" onclick="bling()">加入购物车</a></td>
                  </c:if>
              </tr>
          </c:forEach>
        </table>
      </div>
    </div>
  </div>

</div>


</body>
</html>