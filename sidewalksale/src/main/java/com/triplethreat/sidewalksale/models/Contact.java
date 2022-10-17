package com.triplethreat.sidewalksale.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class Contact {
	@NotEmpty(message="Please provide your name")
	@Size(min=5, message="You must put in your first and last name")
	private String name;
	
	@NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
	
	@NotEmpty(message="Subject is required!")
	@Size(min=5, message="Please provide a subject")
	private String subject;
	
	@NotEmpty(message="Message is required!")
	@Size(min=5, max=200, message="your message must be between 5-200 characters")
	private String content;
	
	public Contact() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
