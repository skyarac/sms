<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html >
	<head>
	<script language="javascript">
		function checkForm(form1)
		{
			if(form1.username.value=="")
			{
				alert("�������û���");
				form1.username.focus();
				return false;
			}
			if(form1.userpassword.value=="")
			{
				alert("�������¼����");
				form1.userpassword.focus();
				return false;
			}
			else
			   return true;
		}
</script>
	
		
	 <title>ѧ����Ϣ����ϵͳ��¼����</title>	
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
		<!--ͼƬ-->
		<table align="center" style="margin-top:100px">
			<tr>
				<td ><img src="images/head.jpg"></td>
				
			</tr>
		</table>
		<!--ͼƬ����-->
		<!--��¼���-->
		<form action="LoginConf" method="post" name="form1" onsubmit="return checkForm(this);">
		<table align="center" >
			<caption>�û���¼</caption>
			<tr>
				<td >
					�û��˺�:
				</td>
				<td >
					<input type="text" name="username" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td >
					�û�����:
				</td>
				<td >
					<input type="password" name="userpassword" style="width:150px"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="��¼">
					<input type="reset" value="���">
				</td>
				
			</tr>
		</table>
	</form>
		<!--��¼���end!-->
	</body>
	
</html>
<!-- ҳ������У��ű� -->

<!--�ű�У��������!  end  -->




















