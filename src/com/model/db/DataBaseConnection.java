package com.model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DataBaseConnection {
	// mysql�������ݿ�
	private final String DBDRIVER="com.mysql.jdbc.Driver";
	private final String DBURL="jdbc:mysql://localhost:3306/student";
	private final String DBUSER="root";
	
	/*mssqlserver2005�������ݿ�*/
//	private final String DBDRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	private final String DBURL="jdbc:sqlserver://localhost:1433;DatabaseName=ѧ����Ϣ����ϵͳ";
//	private final String DBUSER="sa";
	/*mssqlserver2000�������ݿ�*/
	/*
	private final String DBDRIVER="com.microsoft.jdbc.sqlserver.SQLServerDriver";
	private final String DBURL="jdbc:microsoft:sqlserver://localhost:1433; DatabaseName=ѧ����Ϣ����ϵͳ";
	private final String DBUSER="sa";
	*/
	
	private final String DBPASSWORD="wangge";
	private  Connection conn=null;
	public  DataBaseConnection(){
		try{
			Class.forName(DBDRIVER);
			
		}catch(Exception e){
			System.out.println("�������ݿ�����ʧ��!");
			e.printStackTrace();
		//	System.exit(0);
		}
		try {
			this.conn=DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
		} catch (SQLException e) {
			System.out.println("���Ӷ����ȡʧ��");
			e.printStackTrace();
		}
	}
	public  Connection getConnection(){
		return this.conn;
	}
	public void close(){
		try{
			if(conn!=null){
			   conn.close();
			}
		}catch(Exception e){
			System.out.println("���ݿ����ӹر�ʧ��!");
		}
	}
	
	//test
/*
	public static void main(String args[]){
		DataBaseConnection dbc=new DataBaseConnection();
		Connection c=dbc.getConnection();
		String username="liu";
		String password="liu";
		try {
			PreparedStatement pstmt=c.prepareStatement("select * from users where uname=? and upassword=?");
		
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				System.out.println(rs.getInt("uid"));
				System.out.println(rs.getString("uname"));
				System.out.println(rs.getString("upassword"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.close();
	//	System.out.println("test ok!");
	}
  */ 
 
}
