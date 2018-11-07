package com.ssm.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.example.entity.Student;
import com.ssm.example.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;

	/**
	 * 查找所有学生
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String,Object> list(HttpServletRequest request) {
		String names = request.getParameter("names");
		System.out.println(names);
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		int startRows = pageSize*(page-1);
		List<Student> list = studentService.findAll(names,startRows,pageSize);
		int count = studentService.getRowCount();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public int add(Student student) {
		return studentService.addStudent(student);
	}

	@RequestMapping(value = "/update")
	@ResponseBody
	public int update(Student student) {
		return studentService.updateStudentById(student);
	}

	@RequestMapping(value = "/read")
	@ResponseBody
	public Student read(Student student) {
		return studentService.selectUsersById(student);
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public int delete(Integer id) {
		System.out.println("i came");
		return studentService.deleteStudentById(id);
	}
}
