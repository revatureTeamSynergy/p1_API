package com.revature.P2API.service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.UserRepository;
import com.revature.P2API.repository.models.User;

@Service
public class UserService {
	final private UserRepository userRepository;

	@Autowired
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	public User getUserById(long id) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		return user.get();
	}
	
	public void createUser(User user) {
		userRepository.save(user);
	}
	
	public List<User> getUsers() {
		return userRepository.findAll();
	}

	public void deleteUserById(long id) {
		boolean isUser = userRepository.existsById(id);
		if(!isUser){
			throw new IllegalStateException("Unable to delete because no user with this id exist");
		}
		userRepository.deleteById(id);
		
	}
	
	@Transactional
	public void updateUser(long id, String password) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		if(password != null && !Objects.equals(user.get().getPassword(), password)) {
			user.get().setPassword(password);	
		}
		
	}
	
}