package com.revature.P2API.controller;

import java.io.IOException;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	private final SongService songService;
	private final ArtistService artistService;
	private final AlbumService albumService;
	private final AlbumController albumController;
	
	@Autowired
	public SongController(SongService songService, ArtistService artistService, AlbumService albumService, AlbumController albumController) {
		this.artistService = artistService;
		this.songService = songService;
		this.albumService = albumService;
		this.albumController = albumController;
		
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/song/album/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongsByAlbumId(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + id,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}

	@RequestMapping(value = "/song/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongById(@PathVariable String id)
			throws Exception {

		System.out.println("TOP OF GETSONGBYID");
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + id,
				String.class);
		System.out.println("RESPONSE = " + response);
		if (response.equals("{\"track\":null}"))
			result = response;
		else {
			String responseFormatted = response.substring(10, response.length() - 2);
			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
				
			});

			Artist artist = artistService.getArtistByName( ((Song) result).getIdArtist());
			System.out.println("ARTIST = " + artist.toString());
			
			Album album = (Album) albumController.getAlbumById(((Song) result).getIdAlbum());
			
			System.out.println("ALBUM = " + album.toString());
	
		((Song) result).setStrAlbumThumb(album.getStrAlbumThumb());
		
		
		
		createSong((Song) result);
//		
		}
//		return  (Song) result;
//		}
		return (Song) result;

	}
	
	@PutMapping("/{id}")
	public void updateSong(@PathVariable long id, @RequestParam() String strAlbumThumb) {
		songService.updateSong(id, strAlbumThumb);
		
	}
	
	//http://localhost:8080/songs/artist?name=shakira
	@GetMapping("/artist")
	public List<Song> getSongsByArtist(@RequestParam String name) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(name);
		
		List<Album> albums = albumService.getAlbumsByArtistId(artist.getIdArtist());
		List<Song> songsWithVids = null;
		List<Song> songs = songService.getSongsByArtistAlbums(albums);
		for (Song song : songs) song.setStrAlbumThumb(artist.getStrArtistThumb());
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);
		
		

		if (response.equals("{\"mvids\":null}")) {
			System.out.println("Null response");
			result = "";

		}else {

			String responseFormatted = response.substring(9, response.length() - 1);

			songsWithVids = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
			});
			

			
			for (Song songVid : songsWithVids) {
				for (Song song : songs) {
//					String thumb = albumService.getAlbumThumb(song.getIdAlbum());
//					System.out.println(thumb);
//					song.setStrAlbumThumb(thumb);
//				
					if (songVid.getIdTrack() == song.getIdTrack()) {
						song.setStrMusicVid(songVid.getStrMusicVid());
						
					}
				}
				
			}

		}
		
		
		
		
		return songs;
	}
	
	@GetMapping("/videos/artist")
	public @ResponseBody Object getMusicVideosByArtistName(@RequestParam String id) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(id);
		
		System.out.println(artist.getIdArtist().toString());
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}
	
	@PostMapping("/create")
	public void createSong(@RequestBody Song song) throws JsonMappingException, JsonProcessingException {
		System.out.println("START CREATE SONG");
		System.out.println(song.toString());
		String albumStr = albumService.getAlbumThumb(song.getIdAlbum());
		song.setStrAlbumThumb(albumStr);
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
