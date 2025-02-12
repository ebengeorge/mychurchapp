package com.dev.cms.controller;

import java.util.List;

import com.dev.cms.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.dev.cms.service.UserService;

import jakarta.servlet.http.HttpSession;



@org.springframework.stereotype.Controller
public class WebController {
	@Autowired
	UserService userService;

	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if( null == session.getAttribute("userId")) {
			return "login";
		}
		return "redirect:/dashboard";
	}

	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if( null == session.getAttribute("userId")) {
			return "login";
		}
		return "index";
	}

	@GetMapping("/error")
	public String error(Model model, HttpSession session) {
		return "error";
	}

	@GetMapping("/organization")
	public String organization(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "admin";
	}


	@PostMapping(path = "/login", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String authenticate(Model model, HttpSession session, @RequestParam String userId, @RequestParam String pwd) {
		System.out.println("authenticating " + userId);
		List<User> users = userService.findByEmailId(userId);
		if (users != null && !users.isEmpty()){
			if(users.get(0).getPassword().equals(pwd)){
				System.out.println("successfully logged in " + userId);
				session.setAttribute("userId", userId);
				session.setAttribute("userName", users.get(0).getUsername());
				session.setAttribute("orgName", users.get(0).getOrg().getOrgName());
				session.setAttribute("role", users.get(0).getRole());
				// if(users.get(0).getOrg().getOrgName().equals("cms"))
				// {
				// 	return "redirect:/organization";
				// }
				return "redirect:/dashboard";
			}
		} 
		model.addAttribute("message", "Invalid email/password, try again");
		return "login";
	}

	@PostMapping(path = "/logout", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String logout(HttpSession session, @RequestParam String userId) {
		System.out.println(userId);
		session.invalidate();
		return "login";
	}

}

// controller pkg - interacts with the view eg html/api endpoints
// service pkg - bulk of logic = interacts with db and other systems
// bean/model - actual db representations as java classes