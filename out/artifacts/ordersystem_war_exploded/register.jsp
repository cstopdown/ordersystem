<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>兄dei，注册个账号再登录吧</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        function changeCheckCode() {
            var img = document.getElementById("checkcodeimg");
            var codespan = document.getElementById("checkcode_span");
            codespan.innerText="";

            var time = new Date().getTime();
            img.src="/ordersystem/checkCodeServlet?"+time;
        }
    		function showTips(id,mes){
				var span=document.getElementById(id);
				span.innerHTML=mes;
			}
            
            function checkNickname(){
            	
				var nickname =document.getElementById("inputNickName").value;
				if(nickname.length<3 || nickname.length>8){
					var span=document.getElementById("nickname_span");
				    span.innerHTML="<font color='red'>对不起，昵称不可用</font>";
				}else{
				   var span=document.getElementById("nickname_span");
				    span.innerHTML="<font color='red'>昵称可用</font>";
				}
				
    	
            }
             function checkUsername(){
            	
				var username =document.getElementById("inputAccount").value;
				if(username.length<11 || username.length>11){
					var span=document.getElementById("username_span");
				    span.innerHTML="<font color='red'>对不起，您输入的账号不正确</font>";
				}else{
				   var span=document.getElementById("username_span");
				    span.innerHTML="<font color='red'>账号正确</font>";
				}
				
    	
            }
             function checkPassword(){
             	var password=document.getElementById("inputPassword").value;
             	//var reg = new RegExp( /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/);
             	if(password.length<6||password.length>16){
             		 var span=document.getElementById("password_span");
				     span.innerHTML="<font color='red'>密码长度不符合规范</font>";
             	}
             	
             }
             function checkRepassword(){
             	var password=document.getElementById("inputPassword").value;
             	var repassword=document.getElementById("checkPassword").value;
             	if(password==repassword){
             		var span=document.getElementById("repassword_span");
				    span.innerHTML="<font color='red'>密码正确</font>";
             	}else{
             		var span=document.getElementById("repassword_span");
				    span.innerHTML="<font color='red'>两次密码不一致</font>";
             	}
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
            <a class="navbar-brand" href="#">BOBO点餐系统</a>
        </div>
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/ordersystem/login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
            </ul>
        </div>
    </div>
</nav>
<%
    String msg= (String) request.getAttribute("msg");
    if(msg ==null){
        msg = "";
    }
    String checkcodemsg= (String) request.getAttribute("checkcodefail");
    if(checkcodemsg==null){
        checkcodemsg="";
    }

%>
<div style="padding-top: 200px"> 

    <form class="form-horizontal col-xs-offset-3" action="/ordersystem/register"   method="post" >
        <div class="form-group">
            <label for="inputNickName" class="col-xs-2 control-label">昵称</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" id="inputNickName" placeholder="请输入昵称" name="nickname" onfocus="showTips('nickname_span','昵称中不能含有中文标点符号以及希腊字母')" onkeyup="checkNickname()"><span  id="nickname_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputAccount" class="col-xs-2 control-label">账号</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" id="inputAccount" placeholder="请输入手机号" name="username" onfocus="showTips('username_span','账号必须是11位')" onkeyup="checkUsername()"><span  id="username_span"><%=msg%></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-xs-2 control-label">密码</label>
            <div class="col-xs-5">
                <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="password" onfocus="showTips('password_span','密码长度必须在6-16位之间且包含大小写的英文字母以及数字')" onkeyup="checkPassword()"><span id="password_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="checkPassword" class="col-xs-2 control-label">确认密码</label>
            <div class="col-xs-5">
                <input type="password" class="form-control" id="checkPassword" placeholder="确认密码" name="repassword" onfocus="showTips('repassword_span','两次密码保持一致')" onblur="checkRepassword()"><span id="repassword_span"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="checkCode" class="col-xs-2 control-label">验证码</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" id="checkCode" placeholder="请输入验证码" name="checkcode" >
                <div style="margin-top: 10px"><a href="javascript:void(0);"><img id="checkcodeimg" src="/ordersystem/checkCodeServlet" onclick="changeCheckCode()"></a></div>
                <span id="checkcode_span"><%=checkcodemsg%></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="submit" class="btn btn-default">注册</button>
            </div>
        </div>
    </form>

</div>


</body>
</html>