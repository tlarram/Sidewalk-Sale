package com.triplethreat.sidewalksale.controllers;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.triplethreat.sidewalksale.models.GeoIP;
import com.triplethreat.sidewalksale.services.GeoIPService;


@Controller
public class GeoIPController {
	private GeoIPService locationService;
	
	public GeoIPController() throws IOException {
		locationService = new GeoIPService();
	}
	
	@GetMapping("/GeoIPTest")
	public String home() {
		return "GeoIPTest.jsp";
	}
	
	@PostMapping("/GeoIPTest")
	public @ResponseBody GeoIP getLocation(@RequestParam(value="ipAddress", required=true)String ipAddress) throws Exception {
		GeoIPService locationService = new GeoIPService();
		return locationService.getLocation(ipAddress);
	}

}
