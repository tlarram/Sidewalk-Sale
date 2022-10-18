package com.triplethreat.sidewalksale.controllers;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.triplethreat.sidewalksale.models.GeoIP;
import com.triplethreat.sidewalksale.services.GeoIPService;


@Controller
public class GeoIPController {
	private GeoIPService locationService;
	
	public GeoIPController() throws IOException {
		locationService = new GeoIPService();
	}
	
	@PostMapping("/location")
	public String getLocation(@RequestParam(value="ipAddress", required=true)String ipAddress, HttpSession session) throws Exception {
		GeoIPService locationService = new GeoIPService();
		GeoIP userLocation =  locationService.getLocation(ipAddress);
		String userCity = userLocation.getCity();
		session.setAttribute("userLocation", userCity);
		return "redirect:/sidewalk-sale";
		
		
	}

}
