package com.revature.P2API.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;


import java.io.IOException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestAlbumController {
	
private RestTemplate restTemplate;
	
	@Mock
	private AlbumController alCon;
	
	private TestRestTemplate testRestTemplate;
	
	private ObjectMapper mapper;
	
	@BeforeEach
	void setup() {
		this.alCon = new AlbumController();
		this.testRestTemplate = new TestRestTemplate();
	}
	
	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();
		
	}
	
	@Test
	void getAlbumByIdIncorrect() throws IOException {
		
		Object album = alCon.getAlbumById("1");
		
		assertEquals(album, "{\"album\":null}");
	}
	
	@Test
	void getAlbumByIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

	@Test
	void getAlbumByIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

	@Test
	void getAlbumByIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getBody(), "{\"album\":null}");
	}
	
	@Test
	void getAlbumsByArtistIncorrect() throws IOException {
		
		Object album = alCon.getAlbumsByArtistId("1");
		
		assertEquals(album, "{\"album\":null}");
	}
	
	@Test
	void getAlbumsByArtistStatusOK() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}
	
	@Test
	void getAlbumsByArtistMediaJson() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		
		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}
	
	@Test
	void getAlbumsByArtistJsonContent() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		
		assertEquals(response.getBody(), "{\"album\":null}");
	}

}
