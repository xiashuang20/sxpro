<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- import easyui-css -->
<link rel="stylesheet" type="text/css"
	href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<!-- 引入easyu的js文件 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
	    url:'depart_select',
	    columns:[[
			{field:'ck',checkbox:true,width:100},      
			{field:'id',title:'编号',width:100},
			{field:'dname',title:'部门名',width:100},
			
			{field:'dinfo',title:'部门信息',width:100},
			

			{field:'operate',title:'操作',align:'center',width:$(this).width()*0.1,
				formatter:function(value, row, index){
					var str = '<a href="tjbm.jsp?id='+row.id+'&dname='+row.dname+'&dinfo='+row.dinfo+'  " name="opera" class="easyui-linkbutton" ></a>';
				//	console.log(str);
				//	console.log(row);
				
					return str;
					
			}},
			

			

			
	    ]],
	    
	    onLoadSuccess:function(data){  
	        $("a[name='opera']").linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});  
	},
	    
	 
	    
	    data: [
			{id:'value10',dname:'value11', dinfo:'value12'}
			
		
		],
	    pagination:true,
	    toolbar: [
	    	  	{
			iconCls: 'icon-add',
			text:'增加部门',
			handler: function(){
				window.location.href="tjbm.jsp?t=5";
				
			}
		},'-', 
		{
			iconCls: 'icon-cancel',
			text:'删除部门',
			handler: function(){
				var  datas = $('#dg').datagrid('getSelections');
				//console.log(datas[0].id)
				//console.log(datas[1].id)
			//	console.log(datas.length);
				 
				 
				<!--用ajax传递数据 -->
				for(var a=0;a<datas.length;a++ ){
					var c=datas[a].id;
					console.log("id");
					 console.log(c);
				  $.ajax({
					
					 url:'depart_delete',
					 type:"post",
					 data:{"id":c},
					 dataType:"text",
					 success:function(res){
					    //获取通过resp回写的数据
						 console.log(res)
						//现在要将数据写在本页面  利用js或者jquey操作页面对应的元素
					//	$("#uname").val(res)
						
					 }
					 
				 }) 
			}
				
				$('#dg').datagrid('reload');
				
			}
		}]
	});	
});

//查询部分代码
function doSearch(){
	$('#dg').datagrid('load',{
		dname: $('#dname').val(),
		dinfo: $('#dinfo').val()
	});
}
</script>
<body>
<div id="tb" style="padding:3px">
	<span>部门名:</span>
	<input id="dname" style="line-height:26px;border:1px solid #ccc">
	<span>部门信息:</span>
	<input id="dinfo" style="line-height:26px;border:1px solid #ccc">
	<a href="#" class="easyui-linkbutton"  plain="true" onclick="doSearch()">查询</a>
</div>

<table id="dg"></table>
</body>
</html>