package com.knockknock.contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.knockknock.user.UserVO;

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
	public String sendContact(ContactVO contactVO, Model model) {
		System.out.println("Controller contactVO: "+contactVO);
		UserVO userVO = new UserVO();
		model.addAttribute("UserVO", userVO);
		
		ContactCategoryVO categoryVO = new ContactCategoryVO();
		model.addAttribute("ContactCategoryVO", categoryVO);
		contactService.sendContact(contactVO);
		return "contact/contactConfirm";
	}
	
	@GetMapping("/main.do'")
	public String backToMain() {
		return "main/main";
	}
	
	@GetMapping("/mypage/myrequest.do") 
	public String seeMyRequest() {
		return "/mypage/myrequest";
	}
}
