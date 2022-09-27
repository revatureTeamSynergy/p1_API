package com.revature.P2API.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P2API.models.MusicList;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;
import com.revature.P2API.repository.LoginRepository;
import com.revature.P2API.service.MusicListService;
import com.revature.P2API.service.SongService;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping(path="/users")
@CrossOrigin("*")
public class UserController {
	
	
	private final UserService userService;
	private LoginRepository loginRepository;
	private MusicListService listService;
	public MusicListController musicController;
	private SongService songService;
	
	
	@Autowired
	public UserController(UserService userService, LoginRepository loginRepository,  MusicListService listService, SongService songService, MusicListController musicController) {
		super();
		this.userService = userService;
		this.loginRepository = loginRepository;
		this.listService = listService;
		this.songService = songService;
		this.musicController = musicController;
	}
	
	@PostMapping("/create")
	public void createUser(@RequestBody User user) {
		userService.createUser(user);
		
		Optional<User> login = loginRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		
		MusicList list = new MusicList(user.getUsername() + "'s " + " Library", login.get());
		
		musicController.createList(list);
		listService.saveList(list);
	
		musicController.addUserToList(listService.getListByName(user.getUsername() + "'s " + " Library").getId(), login.get().getId());
		
		
	}
	
	@GetMapping("/{id}")
	public User getUser(@PathVariable long id) {
		return userService.getUserById(id);
	}
	
	@DeleteMapping("/delete/{id}")
	public void deleteUser(@PathVariable long id) {
		userService.deleteUserById(id);
	}
	
	@PutMapping("/{id}")
	public void updateUser(@PathVariable long id, @RequestParam() String password) {
		userService.updateUser(id, password);
		
	}
	
	//http://localhost:8080/users/user/1/lists
	@GetMapping("/user/{id}/lists")
	public List<String> getListsNames(@PathVariable long id){
		return userService.getListsNames(id);
	}
	
	@GetMapping
	public List<User> getUsers() {
		return userService.getUsers();
	}
	
	

}