package com.revature.P1API.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P1API.repository.models.User;
import com.revature.P1API.service.UserService;

@RestController
@RequestMapping(path="/users")
public class UserController {
	
	
	private final UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		super();
		this.userService = userService;
	}
	
	@PostMapping("/create")
	public void createUser(@RequestBody User user) {
		userService.createUser(user);
	}
	
	@GetMapping("/{id}")
	public User getUser(@PathVariable long id) {
		return userService.getUserById(id);
	}
	
	/*
	@GetMapping("/")
	public User getUser(@RequestParam long id) {
		return userService.getUserById(id);
	}
	*/
	
	@DeleteMapping("/delete/{id}")
	public void deleteUser(@PathVariable long id) {
		userService.deleteUserById(id);
	}
	
	@PutMapping("/{id}")
	public void updateUser(@PathVariable long id, @RequestParam() String password) {
		userService.updateUser(id, password);
		
	}
	
	@GetMapping
	public List<User> getUsers() {
		return userService.getUsers();
	}

}