<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.PageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Student" %>
<%@ page import="com.model.daofactory.*" %>
<%@ page import="com.model.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加学生处理页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    request.setCharacterEncoding("GBK");
		Student student=new Student();
	    String sid=request.getParameter("sid");
	    String sname=request.getParameter("sname");
	    int age=Integer.parseInt(request.getParameter("age"));
	    String sex=request.getParameter("sex");
	//	student.setSid(request.getParameter("sid"));
	//	student.setSname(request.getParameter("sname"));
	//	student.setAge(Integer.parseInt(request.getParameter("age")));
	//	student.setSex(request.getParameter("sex"));
		StudentDAO SDAO=DAOFactory.getStudentDAOInstance();
		student.setSid(sid);
		student.setSname(sname);
		student.setAge(age);
		student.setSex(sex);
		SDAO.insert(student);
		response.sendRedirect("student.jsp");
		
		
		
		%>
  </body>
</html>
