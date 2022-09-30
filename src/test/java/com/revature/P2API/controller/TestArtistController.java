package com.revature.P2API.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Artist;

public class TestArtistController {

	private RestTemplate restTemplate;

	@Mock
	private ArtistController aCon;

	private TestRestTemplate testRestTemplate;

	private ObjectMapper mapper;

	@BeforeEach
	void setup() {
		this.restTemplate = new RestTemplate();
		this.testRestTemplate = new TestRestTemplate();
		this.aCon = new ArtistController();

	}

//	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();

	}

//	@Test
	void getArtistByNameIncorrect() throws IOException {

		Object artist = aCon.getArtistByName("0");

		assertEquals(artist, "{\"artists\":null}");
	}
//
//	@Test
	void getArtistByNameStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

//	@Test
	void getArtistByNameMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

//	@Test
	void getArtistByNameJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getBody(), "{\"artists\":null}");
	}

//	@Test
	void getArtistByIdIncorrect() throws IOException {

		Object artist = aCon.getArtistById("1");

		assertEquals(artist, "{\"artists\":null}");
	}

}
