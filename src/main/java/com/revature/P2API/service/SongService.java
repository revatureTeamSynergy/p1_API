package com.revature.P2API.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.revature.P2API.repository.SongRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;

@Service
public class SongService {
	Logger logger = LoggerFactory.getLogger(SongService.class);
	
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	final private SongRepository songRepository;
	
	private ArtistService artistService;
	
	private AlbumService albumService;

	@Autowired
	public SongService(SongRepository songRepository, AlbumService albumService) {
		super();
		this.restTemplate = new RestTemplate();
		this.songRepository = songRepository;
		this.albumService = albumService;
	}
	
	public Song createSong(Song song) throws JsonMappingException, JsonProcessingException {
//		
//		Artist newSongArtist = artistService.getArtistByName((song).getStrArtist());
		
		
		return songRepository.save(song);
		
	}
	
	public Song createSongByTrackId(String trackId) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + trackId,
				String.class);

		if (response.equals("{\"track\":null}")) {
			logger.error("Unable to create song by track id.");
			result = response;
		}
		else {
			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
			});

		}
		Song song = (Song) result;
		return songRepository.save(song);
	}
	
	public Song getSongById(long id) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			logger.error("Unable to get song by id.");
			throw new IllegalStateException("No song with this id: "+ id);
		}
		return song.get();
	}
	
	public Song getSongByTrackId(String id) {
		Optional<Song> song = songRepository.findByIdTrack(id);
		if(!song.isPresent()) {
			logger.error("Unable to get song by track id.");
			return null;
		}
		return song.get();
	}
	
	public void deleteSongById(long id) {
		boolean isUser = songRepository.existsById(id);
		if(!isUser){
			logger.error("Unable to delete song.");
			throw new IllegalStateException("Unable to delete song by id");
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
		
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + albumId,
				String.class);

		if (response.equals("{\"track\":null}")) {
			logger.error("Unable to get songs by album id.");
			result = response;
		}
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

	public List<Song> getTrendingSongs() throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/trending.php?country=us&type=itunes&format=singles", String.class);
		String responseFormatted = response.substring(12, response.length() - 1);

		result = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
		});
		return (List<Song>) result;
		
	}
	
}