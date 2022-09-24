package com.revature.P1API.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P1API.repository.models.User;
import com.revature.P1API.service.UserService;

@RestController
@RequestMapping(path="users/")
public class UserController {
	
	
	private final UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		super();
		this.userService = userService;
	}

	
	@GetMapping("create")
	public User createStudent() {
		return userService.createUser();
	}
	
	/*
	@GetMapping("user")
	public User getStudent() {
		return userService.getUser();
		//return null;
	}
	*/
	
	@GetMapping("all")
	public List<User> getStudents() {
		return userService.getUsers();
	}

}