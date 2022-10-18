package com.triplethreat.sidewalksale.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.triplethreat.sidewalksale.models.GeoIP;
import com.triplethreat.sidewalksale.models.User;
import com.triplethreat.sidewalksale.services.GeoIPService;
import com.triplethreat.sidewalksale.services.UserService;
import com.triplethreat.sidewalksale.validator.UserValidator;

@Controller
public class UserController {
	 private UserService userService;
	 private GeoIPService locationService;
	// NEW
	    private UserValidator userValidator;
	    
	    // NEW
	    public UserController(UserService userService, UserValidator userValidator) {
	        this.userService = userService;
	        this.userValidator = userValidator;
	    }
	
    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        // NEW
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        
        userService.saveUserWithAdminRole(user);
        return "redirect:/login";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model, HttpSession session) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model, HttpSession session) {
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(email));
        return "homePage.jsp";
    }
    @PostMapping("/location")
    public @ResponseBody String getLocation(@RequestParam(value="ipAddress", required=true)String ipAddress, HttpSession session) throws Exception {
		GeoIPService locationService = new GeoIPService();
		GeoIP userLocation =  locationService.getLocation(ipAddress);
		String userCity = userLocation.getCity();
		session.setAttribute("userLocation", userCity);
		return "redirect:/home";
	}
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(email));
        return "adminPage.jsp";
    }
}
