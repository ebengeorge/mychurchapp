package com.dev.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dev.cms.model.Post;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.dev.cms.service.UserService;
import com.dev.cms.service.UserTeamService;
import com.dev.cms.utils.Utils;

import jakarta.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
public class WebController {
	@Autowired
	UserService userService;
	@Autowired
	UserTeamService userTeamService;
	@Autowired
	PostService postService;


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

	@GetMapping("/teamAdmin")
	public String teamAdmin(HttpSession session) {
		// Ensure that the user is logged in before displaying the team admin page.
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		// "teamAdmin" is the logical view name that your view resolver will map to /WEB-INF/views/teamAdmin.jsp (for example)
		return "teamAdmin";
	}


	@PostMapping(path = "/login", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String authenticate(Model model, HttpSession session, @RequestParam String userId, @RequestParam String pwd) {
		System.out.println("authenticating " + userId);
		try {
		List<User> users = userService.findByEmailId(userId);
		if (users != null && !users.isEmpty()){
			if(users.get(0).getPassword().equals(pwd)){
				System.out.println("successfully logged in " + userId);
				List<UserTeam> utList = userTeamService.findByUser(users.get(0));
				Map<Integer, String> userTeamMap = new HashMap<Integer, String>();
				for (UserTeam uTeam : utList) {
					userTeamMap.put(uTeam.getTeam().getId(), uTeam.getTeam().getName());
				}
				String json = Utils.toJson(userTeamMap);
				session.setAttribute("userId", users.getFirst().getId());
				session.setAttribute("userName", userId);
				session.setAttribute("userName", users.get(0).getUsername());
				session.setAttribute("orgName", users.get(0).getOrg().getOrgName());
				session.setAttribute("orgId", users.get(0).getOrg().getId());
				session.setAttribute("role", users.get(0).getRole());
				session.setAttribute("teams", json);

				 if(users.get(0).getOrg().getOrgName().equals("cms"))
				 {
				 	return "redirect:/organization";
				 }
				return "redirect:/dashboard";
			}
		}
		model.addAttribute("message", "Invalid email/password, try again");
		return "login";
	} catch (Exception e) {
		e.printStackTrace();
		model.addAttribute("message", "Something went wrong, please try agin");
		return "login";
	}
	}

	@GetMapping("/timeline")
	public String timeline(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		List<Post> posts = postService.findAll();
		return "timeline";
	}

	@PostMapping(path = "/logout", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String logout(HttpSession session, @RequestParam String userId) {
		session.invalidate();
		return "login";
	}

	@GetMapping("/calendar")
	public String calendar(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "calendar";
	}


}

// controller pkg - interacts with the view eg html/api endpoints
// service pkg - bulk of logic = interacts with db and other systems
// bean/model - actual db representations as java classes