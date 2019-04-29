<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-4-28 0028
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付中</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
    <script>
        var i=5;
        var seconds = document.getElementsByClassName("seconds");
        window.setInterval(f,1000);
        function f() {
            i--;
            if (i!=0){
                seconds.innerText=i;
            } else{
                window.location.href="historyOrder.jsp";
            }

        }
    </script>
</head>
<body>
      <%response.setContentType("text/html;charset=utf-8");
         String status=(String) request.getSession().getAttribute("state");
         if(status.equalsIgnoreCase("余额不足")){
      %>
          <div>您的余额不足，请保持账户余额充足的情况下重新支付</div>
          <div>将在<span class="seconds">5</span>秒内跳转到订单页面，您可以在订单页面选择重新支付</div>
      <%
         }else if(status.equalsIgnoreCase("已支付")){
      %>
        <div >支付成功</div>
        <div>将在<span class="seconds">5</span>秒内跳转到订单页面</div>
     <%
         }else{
      %>
      <div>将在<span class="seconds">5</span>秒内跳转到订单页面</div>
      <%
         }

      %>
</body>
</html>
