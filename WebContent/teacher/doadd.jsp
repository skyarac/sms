<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.TeacherPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Teacher" %>
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
    
    <title>添加教师信息处理页面</title>
    
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
		Teacher teacher=new Teacher();
   		String tid=request.getParameter("tid");
	    String tname=request.getParameter("tname");
	    String title=request.getParameter("title");
		teacher.setTid(tid);
		teacher.setTname(tname);
		teacher.setTitle(title);
		TeacherDAO TDAO=DAOFactory.getTeacherDAOInstance();
		TDAO.insert(teacher);
		response.sendRedirect("teacher.jsp");
		
		
		
		%>
  </body>
</html>
