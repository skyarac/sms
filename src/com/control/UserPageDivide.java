package com.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.db.DataBaseConnection;
import com.model.vo.Users;

public class UserPageDivide {
	private int sumRecord=0;   //��ʾ���ܼ�¼����
	private int pageRecord=5;  //ÿҳ��ʾ�ļ�¼��
	private int pageNum=0;   //��ʾ����ҳ����
	private int showPage=1;   //��Ҫ��ʾ��ҳ����
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql="select * from users";
	
	public UserPageDivide(){
		//���ݿ�����
		con=new DataBaseConnection().getConnection();
		try {
			pstmt=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);//�ɻع� ���޸Ĳ�����,�ɸ���
		//	pstmt=con.prepareStatement(sql);
			//rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.sumRecord=this.getSumRecord();  //����ܼ�¼��
		this.pageNum=this.getPageNum();  //�����ҳ����
	}
	//��ȡ�ܼ�¼��
	public int getSumRecord(){
		try {
			rs=pstmt.executeQuery();
			rs.last();    //�α궨λ�����һ�м�¼
			sumRecord=rs.getRow();  //����������
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sumRecord;
		
	}
	//��ȡ�����ؼ�¼����
	public List getData(int n){  //��ʾ��nҳ������
		List list=new ArrayList();
		if(n<1){
			n=1;
			showPage=1;
		}
		if(n>=pageNum){
			n=pageNum;
			showPage=pageNum;
		}
		int begin=(n-1)*pageRecord+1;  //��ȡ��n��ĵ�һ����¼��λ��ֵ
		try {
			rs=pstmt.executeQuery();
			rs.absolute(begin);//����������α궨λ����nҳ�ĵ�һ����¼
			for(int i=0;i<pageRecord&&(begin+i)<=sumRecord;i++){
				//�������һҳ���������
				int uid=rs.getInt(1);
				//uid=new String(uid.getBytes("GBK"),"GB18030");
				
				String uname=rs.getString(2);
				//���Ĵ���
				uname=new String(uname.getBytes("GBK"),"GB18030");
				//int age=rs.getInt(3);
				String upassword=rs.getString(3);
				upassword=new String(upassword.getBytes("GBK"),"GB18030");
				
				//��װ��Ϣ��ʵ����
				Users users=new Users();
				users.setUid(uid);
				users.setUname(uname);
				users.setUpassword(upassword);
				//student.setSex(sex);
				list.add(users);
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
	public void setSumRecord(int sumRecord){  //�����ܼ�¼��
		this.sumRecord=sumRecord;
	}
    public int getPageRecord(){  //��ȡÿҳ��ʾ�ļ�¼��
    	return pageRecord;
    }
    public void setPageRecord(int pageRecord){  //����ÿҳ�ļ�¼��
    	this.pageRecord=pageRecord;
    }
	//������ҳ����
    public int getPageNum(){  //���ҳ������
    	
    	if(sumRecord%pageRecord==0){
    		pageNum=sumRecord/pageRecord;
    		
    	}else{
    		pageNum=sumRecord/pageRecord+1;
    	}
    	System.out.println("��ҳ��"+pageNum+" �ܼ�¼����"+sumRecord+" ÿҳ��ʾ�ļ�¼����"+pageRecord);
    	return pageNum;
    }
    public void setPageNum(int pageNum){ //������ʾ����ҳ����
    	this.pageNum=pageNum;
    }
    //���صڼ�ҳ����Ϣ
    public int getShowPage(){  //���Ҫ��ʾ��ҳ���
    	return showPage;
    }
    //������ʾ�ڼ�ҳ����Ϣ
    public void setShowPage(int showPage){  //����Ҫ��ʾ��ҳ���
    	this.showPage=showPage;
    }
	
	//������
    /*
	public static void main(String args[]){
		PageDivide t=new PageDivide();
		//t.getPageNum();
		
	}
	
	*/
	
	
	
	
	
	
	
	

}
