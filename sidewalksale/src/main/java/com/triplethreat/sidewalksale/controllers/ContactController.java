package com.triplethreat.sidewalksale.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.triplethreat.sidewalksale.models.Contact;
import com.triplethreat.sidewalksale.services.MailService;

@Controller
public class ContactController {
	@Autowired
	private MailService mailService;
	
	@GetMapping("/sidewalk-sale/contact")
	public String showContactForm(ModelMap modelMap) {
		modelMap.put("contact", new Contact());
		return "contact.jsp";
	}
	
	@PostMapping("/sidewalk-sale/contact")
	public String sendEmail(@ModelAttribute("contact") Contact contact, BindingResult result, ModelMap modelMap) {
		try { 
			String content =  contact.getName() + " sent a message <br>" 
					+ contact.getContent() + 
					"<br>You can reach " + contact.getName() + " at " + contact.getEmail();
			// the email set in the second argument is where the email is sent to
			mailService.send(contact.getEmail(), "sidewalksale.contact@gmail.com", contact.getSubject(), content);
			modelMap.put("msg", "Thank you for contacting us");
			
		} catch (Exception e) {
			modelMap.put("msg", e.getMessage());
		}
		return "contactSuccess.jsp";
	}
}
