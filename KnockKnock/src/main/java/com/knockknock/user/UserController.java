package com.knockknock.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
 
@Controller

public class UserController {
	
	@Autowired
	public UserController() {
		System.out.println("UserController생성자");
	}

	//로그인하기
	@GetMapping("/user/login.do")
	public String moveLogin() {
		
		return "/user/login";
	}
	
	
} 