package com.model.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.dao.UsersDAO;
import com.model.db.DataBaseConnection;
import com.model.vo.Users;

public class UsersDAOImpl implements UsersDAO {

	public void insert(Users users) throws Exception {
		//添加操作
		String sql="INSERT INTO users(uname,upassword)VALUES(?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,users.getUname());
			pstmt.setString(2,users.getUpassword());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
				
		
	}

	public void update(Users users) throws Exception {
		String sql="UPDATE users SET uname=?,upassword=? WHERE uid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,users.getUname());
			pstmt.setString(2,users.getUpassword());
			pstmt.setInt(3,users.getUid());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}

	public void delete(int  uid) throws Exception {
		String sql="DELETE FROM users WHERE uid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,uid);
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		
	}

	public Users queryById(int uid) throws Exception {
		Users users=null;
		String sql="SELECT * FROM users WHERE uid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,uid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				users=new Users();
				users.setUid(rs.getInt(1));
				users.setUname(rs.getString(2));
				users.setUpassword(rs.getString(3));
				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return users;
	}

	public List queryAll() throws Exception {
		List<Users> all=new ArrayList<Users>();
		String sql="SELECT * FROM users ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Users users=new Users();
				users.setUid(rs.getInt(1));
				users.setUname(rs.getString(2));
				users.setUpassword(rs.getString(3));
				all.add(users);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return all;
	}
	

}
