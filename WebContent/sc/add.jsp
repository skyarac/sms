<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.ScPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Sc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>ѡ����Ϣ����������</title>	
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
		<!--��¼����-->
		<div align="center">
		<form align="center" action="sc/doadd.jsp" method="post">
		    <h2>����ѡ����Ϣ</h2>
			ѧ����:<input type="text" name="sid"><br/>
			�γ̺�:<input type="text" name="cid"><br/>
			��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="score"><br/>
			
			<input type="submit" value="�ύ">
			<input type="reset" value="���">
	    </form>
	    </div>
		<!--��¼����end!-->
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
	
</html>