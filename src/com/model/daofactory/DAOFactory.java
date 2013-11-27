package com.model.daofactory;


import com.model.dao.CourseDAO;
import com.model.dao.ScDAO;
import com.model.dao.StudentDAO;
import com.model.dao.TeacherDAO;
import com.model.dao.UsersDAO;
import com.model.daoimpl.CourseDAOImpl;
import com.model.daoimpl.ScDAOImpl;
import com.model.daoimpl.StudentDAOImpl;
import com.model.daoimpl.TeacherDAOImpl;
import com.model.daoimpl.UsersDAOImpl;

public class DAOFactory {
	
    public static StudentDAO getStudentDAOInstance(){
    	return new StudentDAOImpl();
    }
    public static UsersDAO getUsersDAOInstance(){
    	return new UsersDAOImpl();
    }
    public static TeacherDAO getTeacherDAOInstance(){
    	return new TeacherDAOImpl();
    }
    public static CourseDAO getCourseDAOInstance(){
    	return new CourseDAOImpl();
    }
    public static ScDAO getScDAOInstance(){
    	return new ScDAOImpl();
    }
}
