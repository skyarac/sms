<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.PageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Student" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>ѧ����Ϣ����ϵͳ������</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>
	<%
  		PageDivide p=new PageDivide();
 	 %>
	<body>
		<!--ͼƬ|����-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>��ӭ��½--[<a href="user/modifybyuser.jsp">��������</a>|<a href="user/out.jsp">�˳�ϵͳ</a>]</td>
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
			<caption>ѧ���б�</caption>
			<tr>
				<th width="180">ѧ��</th>
				<th width="200">����</th>
				<th width="200">����</th>
				<th width="200">�Ա�</th>
				<th width="200">����</th>
			</tr>
			<%
			int showPage=Integer.parseInt(request.getParameter("showPage"));
            p.setShowPage(showPage);
      		List list=p.getData(p.getShowPage());  //����list����
       		Iterator it=list.iterator();
       while(it.hasNext()){
    	   Student student=(Student)it.next();
       %>  
			<tr>
				<td><%=student.getSid() %></td>
                <td><%=student.getSname() %></td>
                <td><%=student.getAge() %></td>
                <td><%=student.getSex() %></td>
				<td><a href="student/modify.jsp?sid=<%=student.getSid()%>">�޸�</a>|<a href="student/delete.jsp?sid=<%=student.getSid()%>" onclick="return confirm('��ȷ��Ҫɾ��ѧ��Ϊ[<%=student.getSid() %>]��ѧ����?');">ɾ��</a></td>	
			</tr>
			<%
			}
       %>
			
		</table>
	</form>
	<h3 align="center">[<a href="student/student.jsp?showPage=<%=p.getShowPage()-1 %>">��һҳ</a>|��<%=p.getShowPage()%>ҳ|<a href="student/student.jsp?showPage=<%=p.getShowPage()+1%>">��һҳ</a>|��<%=p.getPageNum() %>ҳ|<a href="student/student.jsp?showPage=<%=p.getPageNum()  %>">ĩҳ</a>]</h3>
	<h2 align="center"><a href="student/add.jsp">���ѧ����Ϣ</a></h2>
		<!--��¼���end!-->
	</body>
	
</html>