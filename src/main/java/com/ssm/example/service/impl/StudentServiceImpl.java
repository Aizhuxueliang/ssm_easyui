package com.ssm.example.service.impl;

import java.util.List;

import com.ssm.example.dao.StudentDAO;
import com.ssm.example.entity.Student;
import com.ssm.example.service.StudentService;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDAO studentDAO;
    

	@Override
	public int addStudent(Student student) {
		// TODO Auto-generated method stub
		return studentDAO.addStudent(student);
	}

	@Override
	public int updateStudentById(Student student) {
		return studentDAO.updateStudentById(student);
	}

	@Override
	public Student selectUsersById(Student student) {
		// TODO Auto-generated method stub
		return studentDAO.selectUsersById(student);
	}

	@Override
	public int deleteStudentById(Integer sid) {
		// TODO Auto-generated method stub
		return studentDAO.deleteStudentById(sid);
	}


	@Override
	public List<Student> findAll(@Param("names") String names, @Param("startRows") int startRows,
    		@Param("pageSize") int pageSize) {
		// TODO Auto-generated method stub
		return studentDAO.findAll(names, startRows, pageSize);
	}

	@Override
	public int getRowCount() {
		// TODO Auto-generated method stub
		return studentDAO.getRowCount();
	}

}

