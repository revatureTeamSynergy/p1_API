package com.revature.P2API.service;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.LoginRepository;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.User;


@Service
public class LoginService {
	Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	private LoginRepository loginRepository;
	
	@Autowired
	public LoginService(LoginRepository loginRepository) {
		this.loginRepository = loginRepository;
	}

	public User login(User user) {
		
		Optional<User> login = loginRepository.findByUsername(user.getUsername());
		
		if(login.isPresent()) {
//			JwtHandler.createJwt(user.getUsername(), "login", "Music", 800000);
			return login.get();
		}else {
			System.out.println("user not found");
			logger.error("User not found");
			return null;
					}
	}
}
