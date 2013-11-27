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
		//�����û�����
		String username=request.getParameter("username");
		String password=request.getParameter("userpassword");
	//	System.out.println(username);
	//	System.out.println(password);
		//���session����
		HttpSession session=request.getSession();
		//new һ��LoginCheck����
		LoginCheck lc=new LoginCheck();
		//����ҵ���߼�������жϹ������ж�
	//	System.out.println(lc.isLogin(username, password));
		if(lc.isLogin(username, password)){
			//���Ϊ�Ϸ��û�����request��Χ���������login,������ֵΪtrue,����ת����¼�ɹ�ҳ��
			session.setAttribute("login","true");
			session.setAttribute("username", username);
			session.setAttribute("userpassword",password);
			session.setAttribute("uid",lc.getUid());
		//	request.setAttribute("showPage", "1");
			request.getRequestDispatcher("student/student.jsp?").forward(request, response);
		}else{
			//����Ƿ��û���ת����¼ʧ��ҳ��
			request.getRequestDispatcher("Login_failure.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}

}
