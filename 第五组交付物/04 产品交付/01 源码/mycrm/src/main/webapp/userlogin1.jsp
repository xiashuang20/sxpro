<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>登录窗口</title>

</head>
<script type="text/javascript">

$(function(){
		 $("#bt1").click(function(){
			 var uname = $("#uname").val()
			 var upass=$("#upass").val()
			 console.log(uname)
			console.log(upass)
			 $.ajax({
				 url:"login1",
				 type:"post",
				 data:{"uname":uname,"upass":upass},
				 
				 dataType:"text",
				 success:function(msg){
				   
					 if("true" == msg){
							window.location.href = "main.jsp";
							
				 }
					 else if("false"==msg)
						 {
						 window.location.href = "userlogin1.jsp";
					alert("用户名或密码错误!");
						 }
						 }
				 
			 })
		 })	 
})
</script>


<body body background="images/login.jpg"
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
		
		<div class="box1">
		<div class="title" style="color: aliceblue;">CIS员工之家</div>
		<div class="box2">
		<div class="username">
		<input type="image" src="images/username.jpg" />
		<input id="uname" name="loginname" value="" style="border-radius: 5px;" class="form-control l35" fv_type="NOTCN" type="text" maxlength="20" placeholder="请输入您的用户名" value=""  data-toggle="tooltip" data-placement="right"/>
		</div>
		<div class="password" >
		<input type="image" src="images/password.jpg" />
		<input id="upass" name="password" value="" style="border-radius: 5px;" class="form-control l35" fv_type="NOTCN" type="text" maxlength="20" placeholder="请输入您的密码" value=""  data-toggle="tooltip" data-placement="right" />
		</div>
		</div>
		   <div class="formoperate">
<span class="rememberPwd" >
<input type="checkbox" id="rememberPwd"/><label for="rememberPwd">记住密码</label>
</span>
</div>

		<div class="box3">
		<button id="bt1" type="button" style="width:100px;border-radius: 8px;" >登录</button>
		<a href="regist.jsp" ><button class="register" type=" button"  style="width:100px ;border-radius: 8px;">注册</button></a>
		</div>
		</div>
		
		
	</body>
</html>