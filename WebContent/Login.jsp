<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html >
	<head>
	<script language="javascript">
		function checkForm(form1)
		{
			if(form1.username.value=="")
			{
				alert("请输入用户名");
				form1.username.focus();
				return false;
			}
			if(form1.userpassword.value=="")
			{
				alert("请输入登录密码");
				form1.userpassword.focus();
				return false;
			}
			else
			   return true;
		}
</script>
	
		
	 <title>学生信息管理系统登录界面</title>	
	<!-- <meta http-equiv="content-type" content="text/html;charset=GB2312">
	 <script language="javascript" src="./script/student.js"></script> 
	 <link rel="stylesheet" type="text/css" href="./style/style.css"/> -->
	 <style type="text/css">
	 	table caption{
	 		font-size:18px;
	 		}
	 </style>
	</head>
	<body>
		<!--图片-->
		<table align="center" style="margin-top:100px">
			<tr>
				<td ><img src="images/head.jpg"></td>
				
			</tr>
		</table>
		<!--图片结束-->
		<!--登录表格-->
		<form action="LoginConf" method="post" name="form1" onsubmit="return checkForm(this);">
		<table align="center" >
			<caption>用户登录</caption>
			<tr>
				<td >
					用户账号:
				</td>
				<td >
					<input type="text" name="username" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td >
					用户密码:
				</td>
				<td >
					<input type="password" name="userpassword" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="登录">
					<input type="reset" value="清空">
				</td>
				
			</tr>
		</table>
	</form>
		<!--登录表格end!-->
	</body>
	
</html>
<!-- 页面输入校验脚本 -->

<!--脚本校验代码结束!  end  -->




















