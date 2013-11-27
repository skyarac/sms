package com.model.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.dao.ScDAO;
import com.model.db.DataBaseConnection;
import com.model.vo.Sc;
import com.model.vo.Student;

public class ScDAOImpl implements ScDAO {

	public void insert(Sc sc) throws Exception {
		//添加操作
				String sql="INSERT INTO sc(sid,cid,score)VALUES(?,?,?)";
				PreparedStatement pstmt=null;
				DataBaseConnection dbc=null;
				try{
					dbc=new DataBaseConnection();
					pstmt=dbc.getConnection().prepareStatement(sql);
					pstmt.setString(1,sc.getSid());
					pstmt.setString(2,sc.getCid());
					pstmt.setInt(3,sc.getScore());
					pstmt.executeUpdate();
					pstmt.close();
				}catch(Exception e){
					throw new Exception("操作出现异常");
				}
				finally{
					dbc.close();
				}
				
		
	}

	public void update(Sc sc) throws Exception {
		String sql="UPDATE sc SET score=? WHERE sid=? AND cid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,sc.getScore());
			pstmt.setString(2,sc.getSid());
			pstmt.setString(3,sc.getCid());
			
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}
    //按候选键删除
	public void delete(String sid,String cid) throws Exception {
		String sql="DELETE FROM sc WHERE sid=? AND cid=? ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,sid);
			pstmt.setString(2,cid);
			
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
	}
	//按sid删除
	public void deleteBySid(String sid) throws Exception {
		String sql="DELETE FROM sc WHERE sid=?  ";
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
		
	}
//按cid删除
	public void deleteByCid(String cid) throws Exception {
		String sql="DELETE FROM sc WHERE cid=? ";
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
		
	}

	public Sc queryById(String sid, String cid) throws Exception {
		Sc sc=null;
		String sql="SELECT * FROM sc WHERE sid=? AND cid=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,sid);
			pstmt.setString(2,cid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				sc=new Sc();
				sc.setSid(rs.getString(1));
				sc.setCid(rs.getString(2));
				sc.setScore(rs.getInt(3));
				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("操作出现异常");
		}
		finally{
			dbc.close();
		}
		
		return sc;
	}

	public List queryAll() throws Exception {
		List<Sc> all=new ArrayList<Sc>();
		String sql="SELECT * FROM sc ";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Sc sc=new Sc();
				sc.setSid(rs.getString(1));
				sc.setCid(rs.getString(2));
				sc.setScore(rs.getInt(3));
				all.add(sc);
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
