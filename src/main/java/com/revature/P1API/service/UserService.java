package com.revature.P1API.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P1API.repository.UserRepository;
import com.revature.P1API.repository.models.User;

@Service
public class UserService {
	final private UserRepository userRepository;

	@Autowired
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	public User getUser() {
		Long id = (long) 1;
		Optional<User> student = userRepository.findById(id);
		return student.get();
	}
	
	public User createUser() {
		return userRepository.save(new User("jpam", "password"));
	}
	
	public List<User> getUsers() {
		return (List<User>) userRepository.findAll();
	}
	
}