<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.CoursePageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Course" %>
<%@ page import="com.model.dao.*" %>
<%@ page import="com.model.daoimpl.*" %>
<%@ page import="com.model.daofactory.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>课程信息修改页面</title>	
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
		<%
		request.setCharacterEncoding("GBK");
		Course course=new Course();
		CourseDAO cd=DAOFactory.getCourseDAOInstance();
		course=cd.queryById(request.getParameter("cid"));
		%>
		<div align="center">
		<form  action="course/domodify.jsp" method="post">
		    <h2>修改课程号为:<%=request.getParameter("cid") %>课程信息</h2>
			
			课程名:<input type="text" name="cname" value="<%=course.getCname()%>"><br/>
			教师号:<input type="text" name="tid" value="<%=course.getTid() %>"><br/>
			     <input type="hidden" name="cid" value="<%=course.getCid()%>"><br>
			<input type="submit" value="提交" onclick="return confirm('确定更改?');">
			<input type="reset" value="清空">
			<!-- 注   要传递sid！！ -->
	    </form>
	    </div>
		<!--登录表格end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>