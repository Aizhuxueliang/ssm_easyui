package com.ssm.example.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.example.entity.Student;

public interface StudentService {
	 public List<Student> findAll(@Param("names") String names, @Param("startRows") int startRows,
	    		@Param("pageSize") int pageSize);
    
    public int getRowCount();
    
    public int addStudent(Student student);
    
    public int updateStudentById(Student student);
    
    public Student selectUsersById(Student student);
    
    public int deleteStudentById(Integer sid);
}

