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
	 <title>学生选课信息管理系统主界面</title>	
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
		<!--图片|导航-->
		<table align="center" style="width:980px; background:#26ADFE;" id="headtb">
			<tr>
				<td colspan="2"><img src="images/head.jpg"></td>
				
			</tr>
			<tr style="background:#26ad8f">
				<td>欢迎登陆--[<a href="#">退出系统</a>]</td>
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
			<caption>选课信息列表</caption>
			<tr>
				<th width="180">学生号</th>
				<th width="200">课程号</th>
				<th width="200">分数</th>
				<th width="200">操作</th>
			</tr>
			<%
      // p.setShowPage(1);
       List list=p.getData(1);  //返回list类型
       Iterator it=list.iterator();
       while(it.hasNext()){
    	   Sc sc=(Sc)it.next();
       %>  
			<tr>
				<td><%=sc.getSid() %></td>
                <td><%=sc.getCid() %></td>
                <td><%=sc.getScore() %></td>
               
				<td><a href="sc/modify.jsp?sid=<%=sc.getSid()%>&cid=<%=sc.getCid()%>">修改</a>|<a href="sc/delete.jsp?sid=<%=sc.getSid()%>&cid=<%=sc.getCid()%>" onclick="return confirm('您确定要删除学号为[<%=sc.getSid() %>|课程号为<%=sc.getCid() %>]的记录吗?');">删除</a></td>	
			</tr>
			<%
			}
       %>
			
		</table>
	</form>
	<h3 align="center">[<a href="sc/sc.jsp?showPage=<%=p.getShowPage()-1 %>">上一页</a>|第<%=p.getShowPage()%>页|<a href="sc/sc.jsp?showPage=<%=p.getShowPage()+1 %>">下一页</a>|共<%=p.getPageNum() %>页|<a href="sc/sc.jsp?showPage=<%=p.getPageNum() %>">末页</a>]</h3>
	<h2 align="center"><a href="sc/add.jsp">添加选课信息</a></h2>
		<!--登录表格end!-->
	</body>
	
</html>