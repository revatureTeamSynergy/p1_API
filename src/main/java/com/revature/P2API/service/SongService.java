package com.revature.P2API.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

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
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;

@Service
public class SongService {
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	final private SongRepository songRepository;
	
	final private AlbumController albumController;

	@Autowired
	public SongService(SongRepository songRepository, AlbumController albumController) {
		super();
		this.restTemplate = new RestTemplate();
		this.songRepository = songRepository;
		this.albumController = albumController;
	}
	
	public Song createSong(Song song) {
		return songRepository.save(song);
		
	}
	
	public Song createSongByTrackId(String trackId) throws IOException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + trackId,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {
			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
			});

		}
		
		Album album = (Album) albumController.getAlbumById(((Song) result).getIdAlbum());
		
		System.out.println("ALBUM = " + album.toString());

		
		Song song = (Song) result;
		((Song) result).setStrAlbumThumb(album.getStrAlbumThumb());
		return songRepository.save(song);
	}
	
	public Song getSongById(long id) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			throw new IllegalStateException("No song with this id: "+ id);
			//return null;
		}
		return song.get();
	}
	
	public Song getSongByTrackId(String id) {
		Optional<Song> song = songRepository.findByIdTrack(id);
		if(!song.isPresent()) {
			//throw new IllegalStateException("No song with this id: "+ id);
			return null;
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
		
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + albumId,
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

	
	@Transactional
	public void updateSong(long id, String strAlbumThumb) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
	
		song.get().setStrAlbumThumb(strAlbumThumb);	
		
		
	}

	
	
}