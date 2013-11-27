package com.model.dao;

import java.util.List;

import com.model.vo.Student;



public interface StudentDAO {
	   public void insert(Student student)throws Exception;
	   
	   public void update(Student student)throws Exception;
	   
	   public void delete(String sid)throws Exception;
	   
	   public Student queryById(int sid)throws Exception;
	   
	   public List queryAll()throws Exception;

}
