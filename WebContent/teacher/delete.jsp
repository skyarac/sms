<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.model.daofactory.DAOFactory" %>
<%@ page import="com.model.daoimpl.TeacherDAOImpl" %>
<%@ page import="com.model.vo.Teacher" %>
<%@ page import="com.model.dao.TeacherDAO" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ɾ����ʦҳ��</title>
    
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
    //Student student=new Student();
    String tid=request.getParameter("tid");
    TeacherDAO tdi=DAOFactory.getTeacherDAOInstance();
    tdi.delete(tid);
    response.sendRedirect("teacher.jsp");
    %>
  </body>
</html>
