<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.PageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Student" %>
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
	 <title>ѧ���޸�ҳ��</title>	
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
							<a href="student/student.jsp">ѧ������</a>|
							  <a href="course/course.jsp">�γ̹���</a>|
							  <a href="sc/sc.jsp">ѡ�ι���</a>|
							  <a href="teacher/teacher.jsp">��ʦ����</a>|
							  <a href="user/users.jsp">�û�����</a>|
				</td>
			</tr> -->
		</table>
		<!--ͼƬ|��������-->
		<!--��¼���-->
		<%
		request.setCharacterEncoding("GBK");
		Student student=new Student();
		StudentDAO sd=DAOFactory.getStudentDAOInstance();
		student=sd.queryById(Integer.parseInt(request.getParameter("sid")));
		%>
		<div align="center">
		<form  action="student/domodify.jsp?sid=<%=request.getParameter("sid") %>" method="post">
		    <h2>�޸�ѧ��Ϊ:<%=request.getParameter("sid") %>ѧ����Ϣ</h2>
			
			����:<input type="text" name="sname" value="<%=student.getSname()%>"><br/>
			����:<input type="text" name="age" value="<%=student.getAge() %>"><br/>
			�Ա�:<input type="text" name="sex" value="<%=student.getSex()%>"><br/>
			<input type="submit" value="�ύ" onclick="return confirm('ȷ������?');">
			<input type="reset" value="���">
			<!-- ע   Ҫ����sid���� -->
	    </form>
	    </div>
		<!--��¼���end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>