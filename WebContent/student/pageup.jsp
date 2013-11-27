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
	 <title>学生信息管理系统主界面</title>	
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
		<!--图片|导航-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>欢迎登陆--[<a href="user/modifybyuser.jsp">更改密码</a>|<a href="user/out.jsp">退出系统</a>]</td>
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
			<caption>学生列表</caption>
			<tr>
				<th width="180">学号</th>
				<th width="200">姓名</th>
				<th width="200">年龄</th>
				<th width="200">性别</th>
				<th width="200">操作</th>
			</tr>
			<%
			int showPage=Integer.parseInt(request.getParameter("showPage"));
            p.setShowPage(showPage);
      		List list=p.getData(p.getShowPage());  //返回list类型
       		Iterator it=list.iterator();
       while(it.hasNext()){
    	   Student student=(Student)it.next();
       %>  
			<tr>
				<td><%=student.getSid() %></td>
                <td><%=student.getSname() %></td>
                <td><%=student.getAge() %></td>
                <td><%=student.getSex() %></td>
				<td><a href="student/modify.jsp?sid=<%=student.getSid()%>">修改</a>|<a href="student/delete.jsp?sid=<%=student.getSid()%>" onclick="return confirm('您确定要删除学号为[<%=student.getSid() %>]的学生吗?');">删除</a></td>	
			</tr>
			<%
			}
       %>
			
		</table>
	</form>
	<h3 align="center">[<a href="student/student.jsp?showPage=<%=p.getShowPage()-1 %>">上一页</a>|第<%=p.getShowPage()%>页|<a href="student/student.jsp?showPage=<%=p.getShowPage()+1%>">下一页</a>|共<%=p.getPageNum() %>页|<a href="student/student.jsp?showPage=<%=p.getPageNum()  %>">末页</a>]</h3>
	<h2 align="center"><a href="student/add.jsp">添加学生信息</a></h2>
		<!--登录表格end!-->
	</body>
	
</html>