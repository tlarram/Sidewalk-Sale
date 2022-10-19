package com.triplethreat.sidewalksale.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.triplethreat.sidewalksale.models.GeoIP;
import com.triplethreat.sidewalksale.services.GeoIPService;
import com.triplethreat.sidewalksale.services.UserService;


@Controller
public class GeoIPController {
	private GeoIPService locationService;
	@Autowired
	private UserService userServ;
	
	public GeoIPController() throws IOException {
		locationService = new GeoIPService();
	}
	
	@PostMapping("/location")
	public String getLocation(@RequestParam(value="ipAddress", required=true)String ipAddress, HttpSession session, Principal principal, Model model) throws Exception {
		String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
		GeoIPService locationService = new GeoIPService();
		GeoIP userLocation =  locationService.getLocation(ipAddress);
		String userCity = userLocation.getCity();
		session.setAttribute("userLocation", userCity);
		return "redirect:/sidewalk-sale";
		
		
	}

}
