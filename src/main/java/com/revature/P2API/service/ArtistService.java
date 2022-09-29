package com.revature.P2API.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.Artist;
import com.revature.P2API.models.Song;
import com.revature.P2API.repository.SongRepository;
import org.springframework.web.client.RestTemplate;

@Service
public class ArtistService {
	Logger logger = LoggerFactory.getLogger(ArtistService.class);
	
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public ArtistService() {
		this.restTemplate = new RestTemplate();
	}
	
	public Artist getArtistByName(String name) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/search.php?s=" + name,
				String.class);

		if (response.equals("{\"artists\":null}")) {
			logger.error("Unable to get artist by name.");
			result = new Artist("No artist found");
		}
		else {

			String responseFormatted = response.substring(12, response.length() - 2);
			result = (Artist) mapper.readValue(responseFormatted, new TypeReference<Artist>() {
			});

		}
		return (Artist) result;
	}
	
}