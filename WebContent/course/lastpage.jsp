<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.control.CoursePageDivide" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.vo.Course" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
	<head>
	 <base href="<%=basePath%>">	
	 <title>�γ���Ϣ����ϵͳ������</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>
	<%
 	 CoursePageDivide p=new CoursePageDivide();
  	%>
	<body>
		<!--ͼƬ|����-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>��ӭ��½--[<a href="user/out.jsp">�˳�ϵͳ</a>]</td>
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
			<caption>�γ��б�</caption>
			<tr>
				<th width="180">�γ̺�</th>
				<th width="200">�γ���</th>
				<th width="200">��ʦ��</th>
			    <th width="200">����</th>
			</tr>
			<%
      // p.setShowPage(1);
	   int showPage=Integer.parseInt(request.getParameter("showPage"));
	   p.setShowPage(showPage);
       List list=p.getData(p.getShowPage());  //����list����
       Iterator it=list.iterator();
       while(it.hasNext()){
    	   Course course=(Course)it.next();
       %>  
			<tr>
				<td><%=course.getCid() %></td>
                <td><%=course.getCname() %></td>
                <td><%=course.getTid() %></td>
                
				<td><a href="course/modify.jsp?cid=<%=course.getCid()%>">�޸�</a>|<a href="course/delete.jsp?cid=<%=course.getCid()%>" onclick="return confirm('��ȷ��Ҫɾ���γ̺�Ϊ[<%=course.getCid() %>]�Ŀγ���?');">ɾ��</a></td>	
			</tr>
			<%
				}
      		%>
			
		</table>
	</form>
	<h3 align="center">[<a href="course/course.jsp?showPage=<%=p.getShowPage()-1 %>">��һҳ</a>|��<%=p.getShowPage()%>ҳ|<a href="course/course.jsp?showPage=<%=p.getShowPage()+1 %>">��һҳ</a>|��<%=p.getPageNum() %>ҳ|<a href="course/course.jsp?showPage=<%=p.getPageNum()  %>">ĩҳ</a>]</h3>
	<h2 align="center"><a href="course/add.jsp">��ӿγ���Ϣ</a></h2>
		<!--��¼���end!-->
	</body>
	
</html>