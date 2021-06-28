package com.knockknock.contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	ContactVO contactVO = new ContactVO();
	
	@GetMapping("/contact/contact.do")
	public String moveContact() {
		
		return "/contact/contact";
	}
	
	@PostMapping("/contact/sendContact.do")
	public String sendContact(ContactVO contactVO) {
		System.out.println("contactVO: "+contactVO);
		contactService.sendContact(contactVO);
		return "/contact/contactConfirm";
	}
}
