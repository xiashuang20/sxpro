<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>人力资源管理系统</title>
<style type="text/css">
.CRI{
  color:white;
}
.d2{
  font-color:white;
}
</style>
</head>
<!-- import easyui-css -->
<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<!-- 引入easyu的js文件 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#tt').tree({
			url : 'showMenus',
			onLoadSuccess : function(node, data) {
				$('#tt').tree('expandAll')
			},
			onClick : function(node) {
				if (node.attributes) {
				var  flag = $('#menus').tabs('exists',node.text)
				if(flag){
					$('#menus').tabs('select',node.text);
				}else{
					console.log(node)
					//添加新的tab
					$('#menus').tabs('add',{
						title: node.text,
						closable:true,
						content: "<iframe src='"+node.attributes.menupath+"' frameborder='0' width='100%' height='100%' >"
					});
				}
		
				}
			}
		});
	})
	
</script>
<script type="text/javascript">
//页面加载调用
window.onload=function(){
//每1秒刷新时间
    setInterval("NowTime()",1000);
}
function NowTime(){
  //获取年月日
  var time=new Date();
  var year=time.getFullYear();
  var month=time.getMonth()+1;
  var day=time.getDate();
  //获取时分秒
  var h=time.getHours();
  var m=time.getMinutes();
  var s=time.getSeconds();
  // var day = time.getDay();
  //检查是否小于10
  h=check(h);
  m=check(m);
  s=check(s);
  document.getElementById("time").innerHTML=""+year+"年"+month+"月"+day+"日  "+h+":"+m+":"+s;
}
//时间数字小于10，则在之前加个“0”补位。
function check(i){
   //方法一，用三元运算符
   var num;
   i<10?num="0"+i:num=i;
   return num;
}
</script>
<body class="easyui-layout" >
    
	<div region="north" split="false"
		style="height: 45px; font-size: 15px; padding: 8px; background-color:#4B0082 "
		border="false">
		 
		 <span class="CRI"><img style="height:23px;width:23px" src="image/1.jpg ">人力资源管理系统</span>
		  <span class="CRI" id="time" style="font-size:15px;height:10px ;padding-left:500px;padding-bottom:5px"></span>
		  <a href="userlogin1.jsp">
			<span class="CRI" style="float:right">退出登录</span></a>
		<div id="nowtime"></div>
	</div>
	
	<div data-options="region:'west',title:'功能菜单',collapsible:false"
		style="width: 200px;background-color:#FFFFFF">
		<!-- 使用tree组件 -->
		<ul id="tt"></ul>
	</div>
	<div  data-options="region:'center',title:'管理界面',fit:false,bodyCls:'欢迎'"
		style="padding: 5px; background: #FFFFFF;width: 500px; height: 250px;">
		<!-- 展现tabs -->
		<div id="menus" class="easyui-tabs" data-options="fit:true"  style="width: 500px; height: 250px;">
	    
		</div>
	</div>

</body>
</html>