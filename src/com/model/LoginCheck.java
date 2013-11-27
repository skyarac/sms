package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.model.db.DataBaseConnection;

public class LoginCheck {
	//判断是否为合法用户
	//Users users=new Users();
	
    private int uid;
	public int getUid(){
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public boolean isLogin(String username,String password){
		 boolean check=false;
		 DataBaseConnection dbc=new DataBaseConnection();
		 PreparedStatement pstmt=null;
	   //  dbc=new DataBaseConnection();
		
		Connection conn= dbc.getConnection();     //
		//String username=u;
		//String password=p;
		System.out.println(username);
		try {
			String sql="select * from users where uname=? and upassword=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
			    check=true;
			    uid=rs.getInt("uid");
				System.out.println(uid); 
			}
			rs.close();
			pstmt.close();
		}catch (Exception e){

			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return check;
	}

}
