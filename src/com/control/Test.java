package com.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.db.DataBaseConnection;

public class Test {
	
//	System.out.println(username);
//	System.out.println(password);
	
   public static void main(String args[]){
	    String username="zeng";
		String password="zeng";
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
	    dbc=new DataBaseConnection();
		
		Connection conn= dbc.getConnection();     //
		
		System.out.println(conn==null);
		try {
		//	String sql="select * from users where uname=? and upassword=?";
			pstmt=conn.prepareStatement("select * from users where uname=? and upassword=?");
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			ResultSet rs=pstmt.executeQuery();
		//	System.out.println(rs.next());
			while(rs.next()){
				int uid=rs.getInt("uid");
				System.out.println(uid); 
			}
			rs.close();
			pstmt.close();
		}catch (Exception e){

			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		//return check;
	}
   

}
