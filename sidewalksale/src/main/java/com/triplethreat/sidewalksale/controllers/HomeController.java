package com.triplethreat.sidewalksale.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/sidewalk-sale")
	public String dashboard(HttpSession session) {
		return "dashboard.jsp";
	}
	
	@GetMapping("/register")
	public String Register() {
		return "register.jsp";
	}
	
}
