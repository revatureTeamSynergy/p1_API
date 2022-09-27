package com.revature.P2API.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.revature.P2API.repository.SongRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;

@Service
public class SongService {
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	final private SongRepository songRepository;

	@Autowired
	public SongService(SongRepository songRepository) {
		super();
		this.restTemplate = new RestTemplate();
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
	
	public List<Song> getSongsByArtistAlbums(List<Album> albums) throws JsonMappingException, JsonProcessingException{
		List<Song> allSongs = new ArrayList<Song>();
		
		for(Album album: albums) {
			List<Song> albumSongs = this.getSongsByAlbumId(album.getIdAlbum());
			for(Song song : albumSongs) {
				allSongs.add(song);
			}
		}
		return allSongs;
	}
	
	private List<Song> getSongsByAlbumId(String albumId) throws JsonMappingException, JsonProcessingException {
		
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + albumId,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
			});

		}
		return (List<Song>) result;
	}

	public List<Song> getSongs() {
		return songRepository.findAll();
	}
	
}