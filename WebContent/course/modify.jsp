<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.CoursePageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Course" %>
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
	 <title>�γ���Ϣ�޸�ҳ��</title>	
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
		Course course=new Course();
		CourseDAO cd=DAOFactory.getCourseDAOInstance();
		course=cd.queryById(request.getParameter("cid"));
		%>
		<div align="center">
		<form  action="course/domodify.jsp" method="post">
		    <h2>�޸Ŀγ̺�Ϊ:<%=request.getParameter("cid") %>�γ���Ϣ</h2>
			
			�γ���:<input type="text" name="cname" value="<%=course.getCname()%>"><br/>
			��ʦ��:<input type="text" name="tid" value="<%=course.getTid() %>"><br/>
			     <input type="hidden" name="cid" value="<%=course.getCid()%>"><br>
			<input type="submit" value="�ύ" onclick="return confirm('ȷ������?');">
			<input type="reset" value="���">
			<!-- ע   Ҫ����sid���� -->
	    </form>
	    </div>
		<!--��¼���end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>