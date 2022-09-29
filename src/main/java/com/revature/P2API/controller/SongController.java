package com.revature.P2API.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;
import com.revature.P2API.models.Song;
import com.revature.P2API.service.AlbumService;
import com.revature.P2API.service.ArtistService;
import com.revature.P2API.service.SongService;

@RestController
@RequestMapping(path="/songs")
@CrossOrigin("*")
public class SongController {
	Logger logger = LoggerFactory.getLogger(SongController.class);

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	private final SongService songService;
	private final ArtistService artistService;
	private final AlbumService albumService;
	
	@Autowired
	public SongController(SongService songService, ArtistService artistService, AlbumService albumService) {
		this.artistService = artistService;
		this.songService = songService;
		this.albumService = albumService;
		
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/song/album/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongsByAlbumId(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + id,
				String.class);

		if (response.equals("{\"track\":null}")) {
			logger.error("Unable to get song by album id");
			result = response;
		}
		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}

	@RequestMapping(value = "/song/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongById(@PathVariable String id)
			throws JsonMappingException, JsonProcessingException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + id,
				String.class);

		if (response.equals("{\"track\":null}")) {
			logger.error("Unable to get song by id.");
			result = response;
		}
		else {
			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
			});

		}
		
//		List<Song> songsWithVids = null;
//		
//		String response2 = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + ((Song) result).getIdArtist(),
//				String.class);
//
//		if (response.equals("{\"track\":null}"))
//			result = response2;
//
//		else {
//
//			String responseFormatted = response.substring(9, response.length() - 1);
//
//			songsWithVids = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
//			});
//
//		}
//		
//		for (Song songVid : songsWithVids) {
//			
//				if (songVid.getIdTrack() == ((Song) result).getIdTrack()) {
//					((Song) result).setStrMusicVid(songVid.getStrMusicVid());
//					((Song) result).setStrDescriptionEN(songVid.getStrDescriptionEN());
//				
//			}
//			
//		}
		
		String thumb = albumService.getAlbumThumb((((Song) result).getIdAlbum()));
		String dog = "dog";
		System.out.println(dog);
		
		System.out.println(thumb);
		
//		song.setStrArtistBanner(newSongArtist.getStrArtistBanner());
//		song.setStrArtistLogo(newSongArtist.getStrArtistLogo());
//		song.setStrArtistThumb(newSongArtist.getStrArtistLogo());
		((Song) result).setStrAlbumThumb(thumb);
		
		createSong((Song) result);

		return (Song)result;

	}
	
	//http://localhost:8080/songs/artist?name=shakira
	@GetMapping("/artist")
	public List<Song> getSongsByArtist(@RequestParam String name) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(name);
		
		List<Album> albums = albumService.getAlbumsByArtistId(artist.getIdArtist());
		List<Song> songsWithVids = null;
		List<Song> songs = songService.getSongsByArtistAlbums(albums);
		
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);
		
		

		if (response.equals("{\"mvids\":null}")) {
			logger.error("Unable to get songs by artist");
			System.out.println("Null response");
			result = "";

		}else {

			String responseFormatted = response.substring(9, response.length() - 1);

			songsWithVids = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
			});
			
			for (Song songVid : songsWithVids) {
				for (Song song : songs) {
					if (songVid.getIdTrack() == song.getIdTrack()) {
						song.setStrMusicVid(songVid.getStrMusicVid());
						song.setStrDescriptionEN(songVid.getStrDescriptionEN());
					}
				}
				
			}

		}
		
		
		
		
		return songs;
	}
	
	@GetMapping("/topsongs")
	public List<Song> getTrendingSongs() throws JsonMappingException, JsonProcessingException{
//		Artist artist = artistService.getArtistByName(name);
//		
//		List<Album> albums = albumService.getAlbumsByArtistId(artist.getIdArtist());
		List<Song> songsWithVids = null;
		List<Song> trending = songService.getTrendingSongs();
		String artistId = trending.get(0).getIdArtist();
		System.out.println("artist Id at start " + artistId);
		
			
			for (Song trendingSong : trending) {
				
				
				String responseVids = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artistId,
						String.class);
				
				if (responseVids.equals("{\"mvids\":null}")) {
					logger.error("Unable to get trending songs.");
					System.out.println("Null response");
					result = "";
				
					
				}	else {
					
					String responseFormatted = responseVids.substring(9, responseVids.length() - 1);
					
					songsWithVids = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
					});
				
				
				
				
				for (Song songVid : songsWithVids) {
					artistId = trendingSong.getIdArtist();
					System.out.println("artist Id in loop " + artistId);
					System.out.println();
					if (songVid.getIdTrack() == trendingSong.getIdTrack()) {
						trendingSong.setStrMusicVid(songVid.getStrMusicVid());
						trendingSong.setStrDescriptionEN(songVid.getStrDescriptionEN());
					}
				}
			
		}
		
		
	
		
		}
		
		
		return trending;
	}
	
	@GetMapping("/videos/artist")
	public @ResponseBody Object getMusicVideosByArtistName(@RequestParam String id) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(id);
		
		System.out.println(artist.getIdArtist().toString());
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);

		if (response.equals("{\"track\":null}")) {
			logger.error("Unable to get music videos by artist name.");
			result = response;
		}
		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}
	
	@PostMapping("/create")
	public void createSong(@RequestBody Song song) throws JsonMappingException, JsonProcessingException {
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
