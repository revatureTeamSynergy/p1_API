package com.revature.P2API.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;

@Service
public class AlbumService {
	Logger logger = LoggerFactory.getLogger(AlbumService.class);
	
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public AlbumService() {
		this.restTemplate = new RestTemplate();
	}
	
	public List<Album> getAlbumsByArtistId(String artistId) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?i=" + artistId,
				String.class);

		if (response.equals("{\"album\":null}")) {
			logger.error("Unable to get albums by artist id");
			result = response;
		}
		else {
			String responseFormatted = response.substring(9, response.length() - 1);

			result = (List<Album>) mapper.readValue(responseFormatted, new TypeReference<List<Album>>() {
			});

		}
	
		return (List<Album>) result;
	}
	
	public String getAlbumThumb(String albumId) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://theaudiodb.com/api/v1/json/523532/album.php?m=" + albumId,
				String.class);

			int start = response.indexOf("strAlbumThumb");
		    int end = response.indexOf("strAlbumThumbHQ");
			String result = response.substring(start + 16, end - 3);
			System.out.println(result);
			
		
	
		return result;
	}
	
}