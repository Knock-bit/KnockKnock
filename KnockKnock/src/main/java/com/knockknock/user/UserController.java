package com.knockknock.user;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.knockknock.user.impl.UserDAO;
 
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	UserVO user = new UserVO();
	
	public UserController() {
		System.out.println("UserController생성자");
	}

	//로그인하기
	@GetMapping("/user/login.do")
	public String moveLogin() {
		
		return "/user/login";
	}
	
	@GetMapping("/user/signup.do")
	public String moveSignup() {
		System.out.println("signup.do");
		return "/user/signup";
	}

//	@RequestMapping("/user/idCheck.do")
//	public String idCheck() {
//		UserVO vo = null;
//		String uId = vo.getuId();
//		int result;
//		
//		UserDAO userDAO = new UserDAO();
// 		
//		return null;
//		
//	}
	@PostMapping("/user/loginUser.do")
	public String loginUser(UserVO vo, Model model) {
		System.out.println(">>로그인처리 loginUser() 시작");
		System.out.println("받은 VO: " +vo);
		
		UserVO loginUser = userService.selectlogin(vo);
		System.out.println("loginUser: "+loginUser);
		
		if(loginUser != null) {
			System.out.println(">>로그인 성공한 경우");
			model.addAttribute("loginUser", loginUser);
			return "/main/main";
		}else {
			System.out.println(">>로그인 실패한 경우");
			
			return "/user/login";
		}
		
	}
	
	
} 