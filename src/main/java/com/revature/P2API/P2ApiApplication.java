package com.revature.P2API;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import com.revature.P2API.controller.SongController;
import com.revature.P2API.repository.SongRepository;
import com.revature.P2API.service.SongService;

@SpringBootApplication

public class P2ApiApplication {
	
	
	public static void main(String[] args) {
		SpringApplication.run(P2ApiApplication.class, args);
	}
	
	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}
	
	
	
	
	

}
