<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.UserPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Users" %>
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
    
    <title>用户信息修改页面</title>
    
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
		Users users=new Users();
	    String uname=request.getParameter("uname");
	   
	    String upassword=request.getParameter("upassword");
	    int uid=(Integer)session.getAttribute("uid");
	
		UsersDAO UDAO=DAOFactory.getUsersDAOInstance();
		users.setUid(uid);
		users.setUname(uname);
		users.setUpassword(upassword);
		UDAO.update(users);
		response.sendRedirect("users.jsp");
		
		 
		 
		%>
  </body>
</html>
