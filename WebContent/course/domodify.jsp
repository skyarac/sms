<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.CoursePageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Course" %>
<%@ page import="com.model.dao.*" %>
<%@ page import="com.model.daofactory.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ѧ����Ϣ�޸�ҳ��</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br>
   <% 
   	    request.setCharacterEncoding("GBK");
		Course course=new Course();
	    String cid=request.getParameter("cid");
	    String cname=request.getParameter("cname");
	    String tid=request.getParameter("tid");
	
		CourseDAO SDAO=DAOFactory.getCourseDAOInstance();
		course.setCid(cid);
		course.setCname(cname);
		course.setTid(tid);
		SDAO.update(course);
		response.sendRedirect("course.jsp");
		
		 
		 
		%>
  </body>
</html>
