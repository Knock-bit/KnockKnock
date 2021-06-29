package com.knockknock.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	UserVO user = new UserVO();
	
	public UserController() {
		System.out.println("UserController생성자");
	}

	//로그인하기로 이동
	@GetMapping("/user/login.do")
	public String moveLogin() {
		
		return "/user/login";
	}
	//회원가입창으로 이동
	@GetMapping("/user/signup.do")
	public String moveSignup() {
		return "/user/signup";
	}
	//회원가입 전 tnc로 이동
	@GetMapping("/user/tnc.do")
	public String tnc() {
		return "/user/tnc";
	}
	//id중복체크
	@RequestMapping("/user/idCheck.do")
	@ResponseBody
	public int idCheck(String id) {
		UserVO vo = new UserVO();
	
		int result;
		
 		result = userService.idCheck(id); 		
		return result;
		
	}
	//email중복체크
	@RequestMapping("/user/emailCheck.do")
	@ResponseBody
	public int emailCheck(String email) {
		UserVO vo = new UserVO();
	
		int result;
		
 		result = userService.emailCheck(email); 		
		return result;
		
	}
	//로그인
	@PostMapping("/user/loginUser.do")
	public String loginUser(UserVO vo, Model model) {
		
		UserVO loginUser = userService.selectlogin(vo);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "/main/main";
		}else {
			System.out.println(">>로그인 실패한 경우");
			
			return "/user/login";
		}
		
	}
	//로그아웃
	@PostMapping("/user/join.do")
	public String join(UserVO vo) {
		System.out.println("회원가입 controller join()");
		System.out.println("vo: "+vo);
		userService.join(vo);
		return "/main/main";
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("main/main");
		
		return mv;
	}
	
	
} 