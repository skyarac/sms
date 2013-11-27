package com.model.dao;

import java.util.List;

import com.model.vo.Sc;


public interface ScDAO {
	 public void insert(Sc sc)throws Exception;
	   
	   public void update(Sc sc)throws Exception;
	   
	   public void delete(String sid,String cid)throws Exception;
	   
	   public Sc queryById(String sid,String cid)throws Exception;
	   
	   public List queryAll()throws Exception;


}
