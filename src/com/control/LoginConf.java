package com.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.LoginCheck;

public class LoginConf extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		//接收用户参数
		String username=request.getParameter("username");
		String password=request.getParameter("userpassword");
	//	System.out.println(username);
	//	System.out.println(password);
		//获得session对象
		HttpSession session=request.getSession();
		//new 一个LoginCheck对象
		LoginCheck lc=new LoginCheck();
		//调用业务逻辑组件的判断功能来判断
	//	System.out.println(lc.isLogin(username, password));
		if(lc.isLogin(username, password)){
			//如果为合法用户，在request范围中添加属性login,其属性值为true,并跳转到登录成功页面
			session.setAttribute("login","true");
			session.setAttribute("username", username);
			session.setAttribute("userpassword",password);
			session.setAttribute("uid",lc.getUid());
		//	request.setAttribute("showPage", "1");
			request.getRequestDispatcher("student/student.jsp?").forward(request, response);
		}else{
			//如果非法用户跳转到登录失败页面
			request.getRequestDispatcher("Login_failure.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}

}
