<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.PageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Student" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>学生信息管理系统主界面</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>

	<body>
		<!--图片|导航-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<!--  <tr style="background:#26ad8f">
				<td>欢迎登陆--[<a href="#">更改密码</a>|<a href="#">退出系统</a>]</td>
				<td align="right" height="30px">
							  <a href="#">学生管理</a>|
							  <a href="#">课程管理</a>|
							  <a href="#">教师管理</a>|
							  <a href="#">用户管理</a>|
				</td>
			</tr> -->
		</table>
		<!--图片|导航结束-->
		<!--登录表格-->
		<div align="center">
		<form align="center" action="student/doadd.jsp" method="post">
		    <h2>添加学生信息</h2>
			学号:<input type="text" name="sid"><br/>
			姓名:<input type="text" name="sname"><br/>
			年龄:<input type="text" name="age"><br/>
			性别:<input type="text" name="sex"><br/>
			<input type="submit" value="提交">
			<input type="reset" value="清空">
	    </form>
	    </div>
		<!--登录表格end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>