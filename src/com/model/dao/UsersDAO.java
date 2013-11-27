package com.model.dao;

import java.util.List;

import com.model.vo.Users;

public interface UsersDAO {
	 public void insert(Users users)throws Exception;
	   
	   public void update(Users users)throws Exception;
	   
	   public void delete(int uid)throws Exception;
	   
	   public Users queryById(int uid)throws Exception;
	   
	   public List queryAll()throws Exception;


}
