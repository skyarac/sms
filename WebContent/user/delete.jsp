<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.model.daofactory.DAOFactory" %>
<%@ page import="com.model.daoimpl.StudentDAOImpl" %>
<%@ page import="com.model.vo.Users" %>
<%@ page import="com.model.dao.UsersDAO" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ɾ���û�ҳ��</title>
    
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
    int uid=Integer.parseInt(request.getParameter("uid"));
    UsersDAO udi=DAOFactory.getUsersDAOInstance();
    udi.delete(uid);
    response.sendRedirect("users.jsp");
    %>
  </body>
</html>