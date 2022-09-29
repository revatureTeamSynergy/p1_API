package com.revature.P2API.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.revature.P2API.models.MusicList;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;
import com.revature.P2API.service.MusicListService;
import com.revature.P2API.service.SongService;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping(path="/lists")
@CrossOrigin("*")
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
	public MusicList createList(@RequestBody MusicList list) {
		listService.createList(list);
		
		MusicList list2 = getList(list.getName());
		
		return list2;
	}
	
	@PutMapping("/{listId}/songs/{trackId}")
	public MusicList addSongToList(@PathVariable long listId, @PathVariable String trackId) throws JsonMappingException, JsonProcessingException {
		MusicList list = listService.getListById(listId);
		Song song = songService.getSongByTrackId(trackId);
		
		if(song == null) {
			Song createdSong = songService.createSongByTrackId(trackId);
			list.addSong(createdSong);
			return listService.saveList(list);
			
		}else if(song != null) {
			if (!list.getSongs().contains(song)) {
				list.addSong(song);
				return listService.saveList(list);
			}
		}
		return list;
	}
	
	@PostMapping("/{listId}/manySongs")
	public MusicList addSongsToList(@RequestBody List<Song> songs,@PathVariable long listId ) {
		
		MusicList list = listService.getListById(listId);
		
		for (int i = 0; i < songs.size(); i++) {
			list.addSong(songs.get(i));
		
		}
		
		return listService.saveList(list);
	}
	
	@PutMapping("/{listId}/users/{userId}")
	public MusicList addUserToList(@PathVariable long listId, @PathVariable long userId) {
		MusicList list = listService.getListById(listId);
		User user = userService.getUserById(userId);
		
		list.addUser(user);
		return listService.saveList(list);
	}
	
	@GetMapping("/list")
	public MusicList getList(@RequestParam String name) {
		MusicList list = listService.getListByName(name);

		return list;
	}
	
	@GetMapping
	public List<MusicList> getUsers() {
		return listService.getlists();
	}
	
	
}
