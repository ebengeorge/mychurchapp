package com.dev.cms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import com.dev.cms.model.Model;

@org.springframework.stereotype.Controller
public class WebController {
	@GetMapping("/")
	public String home(Model model) {
		return "login";
	}

	@GetMapping("/welcome")
	public String welcome(Model model) {
		return "index";
	}
}

// controller pkg - interacts with the view eg html/api endpoints
// service pkg - bulk of logic = interacts with db and other systems
// bean/model - actual db representations as java classes