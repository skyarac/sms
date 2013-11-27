package com.model.dao;

import java.util.List;

import com.model.vo.Teacher;

public interface TeacherDAO {
	  public void insert(Teacher teacher)throws Exception;
	   
	   public void update(Teacher teacher)throws Exception;
	   
	   public void delete(String tid)throws Exception;
	   
	   public Teacher queryById(String  tid)throws Exception;
	   
	   public List queryAll()throws Exception;


}
