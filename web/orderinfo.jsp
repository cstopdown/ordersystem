<%@ page import="com.order.domain.Goods" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-4-25 0025
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
    <script>
        $(function () {
            $("#btnp").click(function () {
                alert("${sessionScope.user.nickname}先生，订单正在支付中，请勿退出");

            });
        });
    </script>
</head>
<body>
     <h3>订单详情 <span class="label label-default">New</span></h3>
    <form action="historyOrder.jsp" method="post">
    <table class="table">
      <tr>
          <td>商品名称</td>
          <td align="right">商品数量</td>
      </tr>
        <%
            Map<Goods,Integer> map1=(Map<Goods,Integer>) request.getSession().getAttribute("ordercar1");
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
              <td><%=name%></td>
              <td align="right"><%=value%></td>
          </tr>
        <%
            }
                pageContext.setAttribute("all", all);
        %>
        <tr>
            <td>合计</td>
            <td align="right" id="all"><%=all%></td>
        </tr>
        <%

            }

        %>
    </table>

         <table>
             <tr>
                 <td>
                      <div class="btn-group" role="group" aria-label="...">
                         <button type="button" class="btn btn-default">堂食</button>
                         <button type="button" class="btn btn-default">外带</button>
                      </div>
                 </td>
             </tr>


           <tr>
              <td align="left"><a class="btn btn-default" href="OrderPurchaseServlet?nickname=${sessionScope.user.id}&&id=0&all=${all} " role="button">稍后支付</a></td>
              <td align="right"><a class="btn btn-default" href="OrderPurchaseServlet?nickname=${sessionScope.user.id}&&id=1&all=${all} " role="button"  id="btnp" >立即支付</a></td>
          </tr>
         </table>
    </form>
</body>
</html>
