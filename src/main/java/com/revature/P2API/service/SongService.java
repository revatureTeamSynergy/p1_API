package com.revature.P2API.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.SongRepository;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;

@Service
public class SongService {
	final private SongRepository songRepository;

	@Autowired
	public SongService(SongRepository songRepository) {
		super();
		this.songRepository = songRepository;
	}
	
	public void createSong(Song song) {
		songRepository.save(song);
	}
	
	public Song getSongById(long id) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			throw new IllegalStateException("No song with this id: "+ id);
		}
		return song.get();
	}
	
	public void deleteSongById(long id) {
		boolean isUser = songRepository.existsById(id);
		if(!isUser){
			throw new IllegalStateException("Unable to delete because no song with this id exist");
		}
		songRepository.deleteById(id);
		
	}
	
	public List<Song> getSongs() {
		return songRepository.findAll();
	}
	
}