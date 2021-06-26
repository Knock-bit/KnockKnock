package com.knockknock.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
 
@Controller

public class UserController {
	
	UserVO user = new UserVO();
	
	@Autowired
	public UserController() {
		System.out.println("UserController생성자");
	}

	//로그인하기
	@GetMapping("/user/login.do")
	public String moveLogin() {
		
		return "/user/login";
	}
	
	@PostMapping("/user/signup.do")
	public String login(UserVO vo) {
		System.out.println(">>로그인처리 login() 시작");
		System.out.println("받은 VO: " +vo);
		
		return "index";
	}
	
	
} 