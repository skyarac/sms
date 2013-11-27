package com.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.db.DataBaseConnection;
import com.model.vo.Teacher;

public class TeacherPageDivide {
	private int sumRecord=0;   //显示的总记录条数
	private int pageRecord=5;  //每页显示的记录数
	private int pageNum=0;   //显示的总页码数
	private int showPage=1;   //所要显示的页码数
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql="select * from teacher";
	
	public TeacherPageDivide(){
		//数据库连接
		con=new DataBaseConnection().getConnection();
		try {
			pstmt=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);//可回滚 对修改不敏感,可更新
		//	pstmt=con.prepareStatement(sql);
			//rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.sumRecord=this.getSumRecord();  //获得总记录数
		this.pageNum=this.getPageNum();  //获得总页码数
	}
	//获取总记录数
	public int getSumRecord(){
		try {
			rs=pstmt.executeQuery();
			rs.last();    //游标定位到最后一行记录
			sumRecord=rs.getRow();  //返回总行数
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sumRecord;
		
	}
	//获取并返回记录集合
	public List getData(int n){  //显示第n页的数据
		List list=new ArrayList();
		if(n<1){
			n=1;
			showPage=1;
		}
		if(n>=pageNum){
			n=pageNum;
			showPage=pageNum;
		}
		int begin=(n-1)*pageRecord+1;  //获取第n项的第一条记录的位置值
		try {
			rs=pstmt.executeQuery();
			rs.absolute(begin);//将结果集的游标定位到第n页的第一条记录
			for(int i=0;i<pageRecord&&(begin+i)<=sumRecord;i++){
				//处理最后一页的特殊情况
				String tid=rs.getString(1);
				tid=new String(tid.getBytes("GBK"),"GB18030");
				
				String tname=rs.getString(2);
				//中文处理
				tname=new String(tname.getBytes("GBK"),"GB18030");
				String title=rs.getString(3);
				title=new String(title.getBytes("GBK"),"GB18030");
				
				//封装信息到实体中
				Teacher teacher=new Teacher();
				teacher.setTid(tid);
				teacher.setTname(tname);
				teacher.setTitle(title);
				list.add(teacher);
				rs.next();
				
			}
			if(rs!=null){
				rs.close();
				pstmt.close();
				con.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public void setSumRecord(int sumRecord){  //设置总记录数
		this.sumRecord=sumRecord;
	}
    public int getPageRecord(){  //获取每页显示的记录数
    	return pageRecord;
    }
    public void setPageRecord(int pageRecord){  //设置每页的记录数
    	this.pageRecord=pageRecord;
    }
	//就算总页码数
    public int getPageNum(){  //获得页面总数
    	
    	if(sumRecord%pageRecord==0){
    		pageNum=sumRecord/pageRecord;
    		
    	}else{
    		pageNum=sumRecord/pageRecord+1;
    	}
    	System.out.println("总页数"+pageNum+" 总记录条数"+sumRecord+" 每页显示的记录条数"+pageRecord);
    	return pageNum;
    }
    public void setPageNum(int pageNum){ //设置显示的总页码数
    	this.pageNum=pageNum;
    }
    //返回第几页的信息
    public int getShowPage(){  //获得要显示的页面号
    	return showPage;
    }
    //设置显示第几页的信息
    public void setShowPage(int showPage){  //设置要显示的页面号
    	this.showPage=showPage;
    }
	
	//测试类
    /*
	public static void main(String args[]){
		PageDivide t=new PageDivide();
		//t.getPageNum();
		
	}
	
	*/
	
	
	

}
