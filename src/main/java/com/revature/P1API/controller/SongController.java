package com.revature.P1API.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P1API.repository.models.Song;
import com.revature.P1API.service.SongService;

@RestController
@RequestMapping(path="/songs")
public class SongController {
	
	
	private final SongService songService;
	
	@Autowired
	public SongController(SongService songService) {
		super();
		this.songService = songService;
	}
	
	@PostMapping("/create")
	public void createSong(@RequestBody Song song) {
		songService.createSong(song);
	}
	
	@DeleteMapping("/delete/{id}")
	public void deleteUser(@PathVariable long id) {
		songService.deleteSongById(id);
	}
	
	@GetMapping
	public List<Song> getSongs() {
		return songService.getSongs();
	}
	
}