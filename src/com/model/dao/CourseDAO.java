package com.model.dao;

import java.util.List;

import com.model.vo.Course;

public interface CourseDAO {
	   public void insert(Course course)throws Exception;
	    
	   public void update(Course course)throws Exception;
	   
	   public void delete(String cid)throws Exception;
	   
	   public Course queryById(String cid)throws Exception;
	   
	   public List queryAll()throws Exception;

}
