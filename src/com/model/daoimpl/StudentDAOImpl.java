package com.model.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.dao.StudentDAO;
import com.model.db.DataBaseConnection;
import com.model.vo.Student;

public class StudentDAOImpl implements StudentDAO{
	public void insert(Student student) throws Exception {
		//添加操作
		String sql="INSERT INTO student(sid,sname,sex,age)VALUES(?,?,?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,student.getSid());
			pstmt.setString(2,student.getSname());
			pstmt.setString(3,student.getSex());
			pstmt.setInt(4,student.getAge());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}

	public void update(Student student) throws Exception {
		String sql="UPDATE Student SET sname=?,sex=?,age=? WHERE sid=?";
		
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,student.getSname());
			pstmt.setString(2,student.getSex());
			pstmt.setInt(3,student.getAge());
			pstmt.setString(4,student.getSid());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		
	}

	public void delete(String sid) throws Exception {
		new ScDAOImpl().deleteBySid(sid);
		System.out.println("student关联的sc删除!");
		String sql="DELETE FROM student WHERE sid=?";
		
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,sid);
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		System.out.println("成功删除student!");
	}
	
	

	public Student queryById(int sid) throws Exception {
		Student student=null;
		String sql="SELECT * FROM student WHERE sid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,sid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				student=new Student();
				student.setSid(rs.getString(1));
				student.setSname(rs.getString(2));
				student.setAge(rs.getInt(3));
				student.setSex(rs.getString(4));
				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return student;
	}

	public List queryAll() throws Exception {
		List<Student> all=new ArrayList<Student>();
		String sql="SELECT * FROM student ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setSid(rs.getString(1));
				student.setSname(rs.getString(2));
				student.setAge(rs.getInt(3));
				student.setSex(rs.getString(4));
				all.add(student);
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
