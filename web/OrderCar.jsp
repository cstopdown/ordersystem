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
    <title>购物车</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
    <script>
        $(function(){
            $("#check1").click(function(){
              $("input[type='checkbox']:gt(0)").prop("checked",this.checked);
            });
        });


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
        <a class="navbar-brand" href="#">${sessionScope.user.nickname}的购物车</a>
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
  <div class="container" >
      <table class="table table-hover" id="info">
          <tr >
              <td><input type="checkbox" id="check1" class="123"></td>
              <td>商品名称</td>
              <td>商品数量</td>
              <td>商品单价</td>
              <td>商品总价</td>
          </tr>
      <%
          Map<Goods,Integer> map1=(Map<Goods,Integer>) session.getAttribute("ordercar1");
          if(map1!=null) {
              int all=0;
              for (Goods goods :map1.keySet()) {
                 String name=goods.getName();
                 int price=goods.getPrice();
                 int value=map1.get(goods);
                 int sum=price*value;
                 all=all+sum;
      %>
          <tr>
              <%--<script>--%>
                  <%--var name=${sessionScope.}--%>
              <%--</script>--%>
              <td><input type="checkbox" class="123"></td>
              <td><%=name%></td>
                  <td>
                      <table  class="table table-hover" align="left">
                          <tr >
                              <td><a href="CarSettingServlet?id=1&&name=<%=name%>"><font size="3">+</font></a></td>
                              <td><%=value%></td>
                              <td><a href="CarSettingServlet?id=0&&name=<%=name%>"><font size="3">-</font></a></td>
                          </tr>
                      </table>
                   </td>
              <td><%=price%></td>
              <td><%=sum%></td>
          </tr>
      <%
         }

      %>
          <tr >
              <td>商品总价</td>
              <td><font color="red">*</font></td>
              <td><font color="red">*</font></td>
              <td><font color="red">*</font></td>
              <td><%=all%></td>

          </tr>
          <%

              }


          %>
            <tr>
                <td align="left"><a class="btn btn-default" href="ClearOrderCarServlet" role="button">清空购物车</a></td>
                <td  align="right"><a class="btn btn-default" href="orderinfo.jsp" role="button" >购买商品</a></td>
            </tr>
      </table>
  </div>
</body>
</html>
