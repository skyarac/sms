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
	 <title>课程信息管理系统主界面</title>	
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
		<!--图片|导航-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>欢迎登陆--[<a href="user/out.jsp">退出系统</a>]</td>
				<td align="right" height="30px">
							  <a href="student/student.jsp">学生管理</a>|
							  <a href="course/course.jsp">课程管理</a>|
							  <a href="sc/sc.jsp">选课管理</a>|
							  <a href="teacher/teacher.jsp">教师管理</a>|
							  <a href="user/users.jsp">用户管理</a>|
				</td>
			</tr>
		</table>
		<!--图片|导航结束-->
		<!--登录表格-->
		<form>
		<table align="center" style="width:980px" >
			<caption>课程列表</caption>
			<tr>
				<th width="180">课程号</th>
				<th width="200">课程名</th>
				<th width="200">教师号</th>
			    <th width="200">操作</th>
			</tr>
			<%
      // p.setShowPage(1);
	   int showPage=Integer.parseInt(request.getParameter("showPage"));
	   p.setShowPage(showPage);
       List list=p.getData(p.getShowPage());  //返回list类型
       Iterator it=list.iterator();
       while(it.hasNext()){
    	   Course course=(Course)it.next();
       %>  
			<tr>
				<td><%=course.getCid() %></td>
                <td><%=course.getCname() %></td>
                <td><%=course.getTid() %></td>
                
				<td><a href="course/modify.jsp?cid=<%=course.getCid()%>">修改</a>|<a href="course/delete.jsp?cid=<%=course.getCid()%>" onclick="return confirm('您确定要删除课程号为[<%=course.getCid() %>]的课程吗?');">删除</a></td>	
			</tr>
			<%
				}
      		%>
			
		</table>
	</form>
	<h3 align="center">[<a href="course/course.jsp?showPage=<%=p.getShowPage()-1 %>">上一页</a>|第<%=p.getShowPage()%>页|<a href="course/course.jsp?showPage=<%=p.getShowPage()+1 %>">下一页</a>|共<%=p.getPageNum() %>页|<a href="course/course.jsp?showPage=<%=p.getPageNum()  %>">末页</a>]</h3>
	<h2 align="center"><a href="course/add.jsp">添加课程信息</a></h2>
		<!--登录表格end!-->
	</body>
	
</html>