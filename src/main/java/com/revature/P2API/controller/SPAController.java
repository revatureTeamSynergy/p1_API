package com.revature.P2API.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SPAController {
	
	@GetMapping
	public String homePage() {
		return "index";
	}

}
