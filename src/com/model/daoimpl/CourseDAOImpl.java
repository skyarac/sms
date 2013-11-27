package com.model.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.dao.CourseDAO;
import com.model.db.DataBaseConnection;
import com.model.vo.Course;
import com.model.vo.Student;

public class CourseDAOImpl implements CourseDAO {

	public void insert(Course course) throws Exception {
		//添加操作
				String sql="INSERT INTO course(cid,cname,tid)VALUES(?,?,?)";
				PreparedStatement pstmt=null;
				DataBaseConnection dbc=null;
				try{
					dbc=new DataBaseConnection();
					pstmt=dbc.getConnection().prepareStatement(sql);
					pstmt.setString(1,course.getCid());
					pstmt.setString(2,course.getCname());
					pstmt.setString(3,course.getTid());
					pstmt.executeUpdate();
					pstmt.close();
				}catch(Exception e){
					throw new Exception("操作出现异常");
				}
				finally{
					dbc.close();
				}
		
	}

	public void update(Course course) throws Exception {
		String sql="UPDATE course SET cname=?,tid=? WHERE cid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,course.getCname());
			pstmt.setString(2,course.getTid());
			pstmt.setString(3,course.getCid());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}
  //按主键cid删除
	public void delete(String cid) throws Exception {
		new ScDAOImpl().deleteByCid(cid);
		System.out.println("与course相关的sc删除成功!");
		String sql="DELETE FROM course WHERE cid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
			
		}
		System.out.println("course关联删除成功!");
		
	}
	//按外键tid删除
	public void deleteByTid(String tid) throws Exception {
		String sql="DELETE FROM course WHERE tid=?";
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
	
	

	public Course queryById(String cid) throws Exception {
		Course course=null;
		String sql="SELECT * FROM course WHERE cid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				course=new Course();
				course.setCid(rs.getString(1));
				course.setCname(rs.getString(2));
				course.setTid(rs.getString(3));
				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return course;
	}

	public List queryAll() throws Exception {
		List<Course> all=new ArrayList<Course>();
		String sql="SELECT * FROM course ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Course course=new Course();
				course.setCid(rs.getString(1));
				course.setCname(rs.getString(2));
				course.setTid(rs.getString(3));
				all.add(course);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return all;	}

}
