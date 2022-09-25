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

public class TestSongController {

	private RestTemplate restTemplate;

	@Mock
	private SongController sCon;

	private TestRestTemplate testRestTemplate;

	private ObjectMapper mapper;
/*
	@BeforeEach
	void setup() {
		this.restTemplate = new RestTemplate();
		this.testRestTemplate = new TestRestTemplate();
		this.sCon = new SongController();

	}
*/
	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();

	}

	@Test
	void getSongByIdIncorrect() throws IOException {

		Object song = sCon.getSongById("1");

		assertEquals(song, "{\"track\":null}");
	}

	@Test
	void getSongByIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

	@Test
	void getSongByIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

	@Test
	void getSongByIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getBody(), "{\"track\":null}");
	}

	@Test
	void getSongsByAlbumIdIncorrect() throws IOException {

		Object song = sCon.getSongsByAlbumId("1");

		assertEquals(song, "{\"track\":null}");
	}

	@Test
	void getSongsByAlbumIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

	@Test
	void getSongsByAlbumIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

	@Test
	void getSongsByAlbumIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getBody(), "{\"track\":null}");
	}

}
