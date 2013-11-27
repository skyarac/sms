<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.TeacherPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Teacher" %>
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
	 <title>教师信息修改页面</title>	
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
		//Teacher teacher=new Teacher();
		Teacher teacher=null;
		TeacherDAO td=DAOFactory.getTeacherDAOInstance();
		teacher=td.queryById(request.getParameter("tid"));
		%>
		<div align="center">
		<form  action="teacher/domodify.jsp" method="post">
		    <h2>修改职工号为:<%=request.getParameter("tid") %>教师信息</h2>
			
			职工号:<input type="text" name="tid" value="<%=teacher.getTid()%>"><br/>
			姓名:<input type="text" name="tname" value="<%=teacher.getTname() %>"><br/>
			职称:<input type="text" name="title" value="<%=teacher.getTitle()%>"><br/>
			<input type="submit" value="提交" onclick="return confirm('确定更改?');">
			<input type="reset" value="清空">
			<!-- 注   要传递sid！！ -->
	    </form>
	    </div>
		<!--登录表格end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>