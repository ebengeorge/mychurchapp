package com.dev.cms.controller;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.cms.model.Model;


import jakarta.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
public class WebController {
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if( null == session.getAttribute("userId")) {
			return "login";
		}
		return "index";
	}


	@PostMapping(path = "/user/authenticate", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String authenticate(Model model, HttpSession session, @RequestParam String userId, @RequestParam String pwd) {
		System.out.println(userId);
		System.out.println(pwd);
		session.setAttribute("userId", userId);
		return "redirect:/";
	}

	@PostMapping(path = "/user/logout", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String logout(Model model, HttpSession session, @RequestParam String userId) {
		System.out.println(userId);
		session.invalidate();
		return "redirect:/";
	}

}

// controller pkg - interacts with the view eg html/api endpoints
// service pkg - bulk of logic = interacts with db and other systems
// bean/model - actual db representations as java classes