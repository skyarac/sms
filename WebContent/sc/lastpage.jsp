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
	 <title>ѧ��ѡ����Ϣ����ϵͳ������</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script>  -->
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/>
	 <style type="text/css">

	 </style>
	</head>
	<%
  		ScPageDivide p=new ScPageDivide();
  	%>
	<body>
		<!--ͼƬ|����-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>��ӭ��½--[<a href="#">�˳�ϵͳ</a>]</td>
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
			<caption>ѡ����Ϣ�б�</caption>
			<tr>
				<th width="180">ѧ����</th>
				<th width="200">�γ̺�</th>
				<th width="200">����</th>
				<th width="200">����</th>
			</tr>
			<%
      // p.setShowPage(1);
       List list=p.getData(1);  //����list����
       Iterator it=list.iterator();
       while(it.hasNext()){
    	   Sc sc=(Sc)it.next();
       %>  
			<tr>
				<td><%=sc.getSid() %></td>
                <td><%=sc.getCid() %></td>
                <td><%=sc.getScore() %></td>
               
				<td><a href="sc/modify.jsp?sid=<%=sc.getSid()%>&cid=<%=sc.getCid()%>">�޸�</a>|<a href="sc/delete.jsp?sid=<%=sc.getSid()%>&cid=<%=sc.getCid()%>" onclick="return confirm('��ȷ��Ҫɾ��ѧ��Ϊ[<%=sc.getSid() %>|�γ̺�Ϊ<%=sc.getCid() %>]�ļ�¼��?');">ɾ��</a></td>	
			</tr>
			<%
			}
       %>
			
		</table>
	</form>
	<h3 align="center">[<a href="sc/sc.jsp?showPage=<%=p.getShowPage()-1 %>">��һҳ</a>|��<%=p.getShowPage()%>ҳ|<a href="sc/sc.jsp?showPage=<%=p.getShowPage()+1 %>">��һҳ</a>|��<%=p.getPageNum() %>ҳ|<a href="sc/sc.jsp?showPage=<%=p.getPageNum() %>">ĩҳ</a>]</h3>
	<h2 align="center"><a href="sc/add.jsp">���ѡ����Ϣ</a></h2>
		<!--��¼���end!-->
	</body>
	
</html>