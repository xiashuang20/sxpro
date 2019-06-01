<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="register.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<title>注册页面</title>
</head>
<script type="text/javascript">

$(function(){
		 $("#bt1").click(function(){
			 var uname = $("#uname").val()
			 var upass=$("#upass").val()
			 console.log(uname)
			console.log(upass)
			 $.ajax({
				 url:"regist1",
				 type:"post",
				 data:{"uname":uname,"upass":upass},
				  dataType:"text",
				 success:function(msg1){
				   
					 if("true"== msg1){
							window.location.href = "userlogin1.jsp";
				alert("注册成功，点击登陆");
				 }
					 else if("false"==msg1)
						 {window.location.href = "regist.jsp";
						alert("用户名已注册");
						 }
						 }
				 
			 })
		 })	 
})
</script>
<body body background="image/login.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
		<div class="b1">
			<div class="title" style="color: aliceblue">用户注册</div>
			<div class="b2">
				<div class="username">
					<input type="image" src="image/username.jpg" />
					<input id="uname" name="loginname" value="" style="border-radius: 5px;height: 20px;" class="form-control l35"
					 fv_type="NOTCN" type="text" maxlength="20" placeholder="请输入您的用户名" value="" data-toggle="tooltip" data-placement="right" />
				</div>
				<div class="password">
					<input type="image" src="image/password.jpg" />
					<input id="upass" name="password" value="" style="border-radius: 5px;height: 20px;" class="form-control l35"
					 fv_type="NOTCN" type="text" maxlength="20" placeholder="请输入您的密码" value="" data-toggle="tooltip" data-placement="right" />
				</div>
			</div>
			<div class="b3">

				<a href="userlogin1.jsp"><button id="bt1" type=" button" style="width:100px ;border-radius: 8px;">注册</button></a>
			</div>
		</div>
		</body>
</html>
