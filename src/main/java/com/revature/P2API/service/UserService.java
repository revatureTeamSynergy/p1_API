package com.revature.P2API.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.controller.MusicListController;
import com.revature.P2API.models.MusicList;
import com.revature.P2API.models.User;
import com.revature.P2API.repository.LoginRepository;
import com.revature.P2API.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	Logger logger = LoggerFactory.getLogger(UserService.class);
	
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder encoder;



	@Autowired
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	
	
	}

	public User getUserById(long id) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			logger.error("Unable to get user by id");
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		return user.get();
	}
	
	public User createUser(User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		
		
		return userRepository.save(user);
	}
	
	public List<User> getUsers() {
		return userRepository.findAll();
	}

	public void deleteUserById(long id) {
		boolean isUser = userRepository.existsById(id);
		if(!isUser){
			logger.error("Unable to delete user by id");
			throw new IllegalStateException("Unable to delete because no user with this id exist");
		}
		userRepository.deleteById(id);
		
	}
	
	 public User getByUsername(String username) {
	        return userRepository.findByUsername(username);
	    }
	
	public List<String> getListsNames(long id){
		User user = this.getUserById(id);
		Set<MusicList> lists = user.getLists();
		List<String> listsNames = new ArrayList<String>();
	    
		for(MusicList list: lists) {
			listsNames.add(list.getName());
		}
		return listsNames;
	}
	
	@Transactional
	public void updateUser(long id, String password) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			logger.error("Unable to update user.");
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		if(password != null && !Objects.equals(user.get().getPassword(), password)) {
			user.get().setPassword(encoder.encode(password));	
		}
		
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = getByUsername(username);

        if (user == null) {
        	logger.error("Unable to load user by username.");
            throw new UsernameNotFoundException(String.format("User '%s' not found", username));
        } else {
            Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
           
                authorities.add(new SimpleGrantedAuthority("admin"));
                return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
            }

          
        }
	


	
}