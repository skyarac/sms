<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.UserPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Users" %>
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
	 <title>�û��޸�ҳ��</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>

	<body>
		<!--ͼƬ|����-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<!--  <tr style="background:#26ad8f">
				<td>��ӭ��½--[<a href="#">��������</a>|<a href="#">�˳�ϵͳ</a>]</td>
				<td align="right" height="30px">
							  <a href="#">ѧ������</a>|
							  <a href="#">�γ̹���</a>|
							  <a href="#">��ʦ����</a>|
							  <a href="#">�û�����</a>|
				</td>
			</tr> -->
		</table>
		<!--ͼƬ|��������-->
		<!--��¼���-->
		<%
		request.setCharacterEncoding("GBK");
		Users users=new Users();
		UsersDAO ud=DAOFactory.getUsersDAOInstance();
		users=ud.queryById(Integer.parseInt((String)session.getAttribute("uid")));
		%>
		<div align="center">
		<form  action="user/domodify.jsp?uid=<%=session.getAttribute("uid") %>" method="post">
		    <h2>�޸��û���Ϊ:<%=request.getParameter("uid") %>�û���Ϣ</h2>
			
			����:<input type="text" name="uname" value="<%=users.getUname()%>"><br/>
			����:<input type="text" name="upassword" value="<%=users.getUpassword() %>"><br/>
			
			<input type="submit" value="�ύ" onclick="return confirm('ȷ������?');">
			<input type="reset" value="���">
			<!-- ע   Ҫ����sid���� -->
	    </form>
	    </div>
		<!--��¼���end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>