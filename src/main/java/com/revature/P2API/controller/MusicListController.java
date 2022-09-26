package com.revature.P2API.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P2API.models.MusicList;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;
import com.revature.P2API.service.MusicListService;
import com.revature.P2API.service.SongService;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping(path="/lists")
public class MusicListController {
	
	private final MusicListService listService;
	private final SongService songService;
	private final UserService userService;
	
	@Autowired
	public MusicListController(MusicListService listService, SongService songService, UserService userService) {
		super();
		this.listService = listService;
		this.songService = songService;
		this.userService = userService;
	}
	
	@PostMapping("/create")
	public void createList(@RequestBody MusicList list) {
		listService.createList(list);
	}
	
	@PutMapping("/{listId}/songs/{songId}")
	public MusicList addSongToList(@PathVariable long listId, @PathVariable long songId) {
		MusicList list = listService.getListById(listId);
		Song song = songService.getSongById(songId);
		
		list.addSong(song);
		return listService.saveList(list);
	}
	
	@PutMapping("/{listId}/users/{userId}")
	public MusicList addUserToList(@PathVariable long listId, @PathVariable long userId) {
		MusicList list = listService.getListById(listId);
		User user = userService.getUserById(userId);
		
		list.addUser(user);
		return listService.saveList(list);
	}
	
	@GetMapping
	public List<MusicList> getUsers() {
		return listService.getlists();
	}
}
