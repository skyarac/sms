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
	 <title>��ʦ��Ϣ�޸�ҳ��</title>	
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
		//Teacher teacher=new Teacher();
		Teacher teacher=null;
		TeacherDAO td=DAOFactory.getTeacherDAOInstance();
		teacher=td.queryById(request.getParameter("tid"));
		%>
		<div align="center">
		<form  action="teacher/domodify.jsp" method="post">
		    <h2>�޸�ְ����Ϊ:<%=request.getParameter("tid") %>��ʦ��Ϣ</h2>
			
			ְ����:<input type="text" name="tid" value="<%=teacher.getTid()%>"><br/>
			����:<input type="text" name="tname" value="<%=teacher.getTname() %>"><br/>
			ְ��:<input type="text" name="title" value="<%=teacher.getTitle()%>"><br/>
			<input type="submit" value="�ύ" onclick="return confirm('ȷ������?');">
			<input type="reset" value="���">
			<!-- ע   Ҫ����sid���� -->
	    </form>
	    </div>
		<!--��¼���end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>