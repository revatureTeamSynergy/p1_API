package com.revature.P2API.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

// Test1
@RestController
@RequestMapping("/album")
public class AlbumController {

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public AlbumController() {
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/name/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getAlbumById(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?m=" + id,
				String.class);

		if (response.equals("{\"album\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Album) mapper.readValue(responseFormatted, new TypeReference<Album>() {
			});

		}

		return result;

	}

	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getAlbumsByArtistId(@PathVariable String id)
			throws JsonMappingException, JsonProcessingException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?i=" + id,
				String.class);

		if (response.equals("{\"album\":null}"))
			result = response;

		else {
			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Album[]) mapper.readValue(responseFormatted, new TypeReference<Album[]>() {
			});

		}

		return result;

	}

}
