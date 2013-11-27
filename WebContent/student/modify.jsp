<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.PageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Student" %>
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
	 <title>学生修改页面</title>	
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
							<a href="student/student.jsp">学生管理</a>|
							  <a href="course/course.jsp">课程管理</a>|
							  <a href="sc/sc.jsp">选课管理</a>|
							  <a href="teacher/teacher.jsp">教师管理</a>|
							  <a href="user/users.jsp">用户管理</a>|
				</td>
			</tr> -->
		</table>
		<!--图片|导航结束-->
		<!--登录表格-->
		<%
		request.setCharacterEncoding("GBK");
		Student student=new Student();
		StudentDAO sd=DAOFactory.getStudentDAOInstance();
		student=sd.queryById(Integer.parseInt(request.getParameter("sid")));
		%>
		<div align="center">
		<form  action="student/domodify.jsp?sid=<%=request.getParameter("sid") %>" method="post">
		    <h2>修改学号为:<%=request.getParameter("sid") %>学生信息</h2>
			
			姓名:<input type="text" name="sname" value="<%=student.getSname()%>"><br/>
			年龄:<input type="text" name="age" value="<%=student.getAge() %>"><br/>
			性别:<input type="text" name="sex" value="<%=student.getSex()%>"><br/>
			<input type="submit" value="提交" onclick="return confirm('确定更改?');">
			<input type="reset" value="清空">
			<!-- 注   要传递sid！！ -->
	    </form>
	    </div>
		<!--登录表格end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>