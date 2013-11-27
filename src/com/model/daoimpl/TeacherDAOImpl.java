package com.model.daoimpl;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.dao.TeacherDAO;
import com.model.db.DataBaseConnection;
import com.model.vo.Teacher;
public class TeacherDAOImpl implements TeacherDAO {

	public void insert(Teacher teacher) throws Exception {
		//添加操作
				String sql="INSERT INTO teacher(tid,tname,title)VALUES(?,?,?)";
				PreparedStatement pstmt=null;
				DataBaseConnection dbc=null;
				try{
					dbc=new DataBaseConnection();
					pstmt=dbc.getConnection().prepareStatement(sql);
					pstmt.setString(1,teacher.getTid());
					pstmt.setString(2,teacher.getTname());
					pstmt.setString(3,teacher.getTitle());
					pstmt.executeUpdate();
					pstmt.close();
				}catch(Exception e){
					throw new Exception("操作出现异常");
				}
				finally{
					
					dbc.close();
				}
				
	}

	public void update(Teacher teacher) throws Exception {
		String sql="UPDATE teacher SET tname=?,title=? WHERE tid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,teacher.getTname());
			pstmt.setString(2,teacher.getTitle());
			pstmt.setString(3,teacher.getTid());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
	}

	public void delete(String tid) throws Exception {
		new CourseDAOImpl().deleteByTid(tid);
		String sql="DELETE FROM teacher WHERE tid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,tid);
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}
	
	

	public Teacher queryById(String tid) throws Exception {
		Teacher teacher=null;
		String sql="SELECT * FROM teacher WHERE tid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,tid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				teacher=new Teacher();
				teacher.setTid(rs.getString(1));
				teacher.setTname(rs.getString(2));
				teacher.setTitle(rs.getString(3));
				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return teacher;
	}

	public List queryAll() throws Exception {
		List<Teacher> all=new ArrayList<Teacher>();
		String sql="SELECT * FROM teacher ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Teacher teacher=new Teacher();
				teacher.setTid(rs.getString(1));
				teacher.setTname(rs.getString(2));
				teacher.setTitle(rs.getString(3));
				all.add(teacher);
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
