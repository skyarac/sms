<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.ScPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Sc" %>
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
    
    <title>添加选课信息处理页面</title>
    
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
		Sc sc=new Sc();
   		String sid=request.getParameter("sid");
	    String cid=request.getParameter("cid");
	    String score=request.getParameter("score");
		sc.setSid(sid);
		sc.setCid(cid);
		sc.setScore(Integer.parseInt(score));
		ScDAO ScDAO=DAOFactory.getScDAOInstance();
		ScDAO.insert(sc);
		response.sendRedirect("sc.jsp");
		
		
		
		%>
  </body>
</html>
