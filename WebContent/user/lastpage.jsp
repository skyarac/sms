<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.UserPageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Users" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>�û���Ϣ����ϵͳ������</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>
	<%
  		UserPageDivide p=new UserPageDivide();
 	 %>
	<body>
		<!--ͼƬ|����-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>��ӭ��½--[<a href="user/modify.jsp">��������</a>|<a href="user/out.jsp">�˳�ϵͳ</a>]</td>
				<td align="right" height="30px">
							<a href="student/student.jsp">ѧ������</a>|
							  <a href="course/course.jsp">�γ̹���</a>|
							  <a href="sc/sc.jsp">ѡ�ι���</a>|
							  <a href="teacher/teacher.jsp">��ʦ����</a>|
							  <a href="user/users.jsp">�û�����</a>|
				</td>
			</tr>
		</table>
		<!--ͼƬ|��������-->
		<!--��¼���-->
		<form>
		<table align="center" style="width:980px" >
			<caption>�û��б�</caption>
			<tr>
				<th width="180">�˺�</th>
				<th width="200">����</th>
				<th width="200">����</th>
				<th width="200">����</th>
			</tr>
			<%
      // p.setShowPage(1);
       List list=p.getData(1);  //����list����
       Iterator it=list.iterator();
       while(it.hasNext()){
    	   Users users=(Users)it.next();
       %>  
			<tr>
				<td><%=users.getUid() %></td>
                <td><%=users.getUname() %></td>
                <td><%=users.getUpassword() %></td>
				<td><a href="user/modify.jsp?uid=<%=users.getUid()%>">�޸�</a>|<a href="user/delete.jsp?uid=<%=users.getUid()%>" onclick="return confirm('��ȷ��Ҫɾ���ʺ�Ϊ[<%=users.getUid() %>]���û���?');">ɾ��</a></td>	
			</tr>
			<%
			}
       %>
			
		</table>
	</form>
	<h3 align="center">[<a href="user/users.jsp?showPage=<%=p.getShowPage()-1 %>">��һҳ</a>|��<%=p.getShowPage()%>ҳ|<a href="user/suers.jsp?showPage=<%=p.getShowPage()+1 %>">��һҳ</a>|��<%=p.getPageNum() %>ҳ|<a href="user/users.jsp?showPage=<%=p.getPageNum() %>">ĩҳ</a>]</h3>
	<h2 align="center"><a href="user/add.jsp">����û���Ϣ</a></h2>
		<!--��¼���end!-->
	</body>
	
</html>