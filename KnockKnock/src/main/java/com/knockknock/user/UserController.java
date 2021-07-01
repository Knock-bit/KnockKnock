package com.knockknock.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	// 로그인하기로 이동
	@GetMapping("/user/login.do")
	public String moveLogin() {

		return "/user/login";
	}

	// 회원가입창으로 이동
	@GetMapping("/user/signup.do")
	public String moveSignup() {
		return "/user/signup";
	}

	// 회원가입 전 tnc로 이동
	@GetMapping("/user/tnc.do")
	public String tnc() {
		return "/user/tnc";
	}

	// id중복체크
	@RequestMapping("/user/idCheck.do")
	@ResponseBody
	public int idCheck(String id) {
		UserVO vo = new UserVO();

		int result;

		result = userService.idCheck(id);
		return result;

	}

	// email중복체크
	@RequestMapping("/user/emailCheck.do")
	@ResponseBody
	public int emailCheck(String email) {
		UserVO vo = new UserVO();

		int result;

		result = userService.emailCheck(email);
		return result;

	}

	@RequestMapping("/user/nickCheck.do")
	@ResponseBody
	public int nickCheck(String nickname) {
		UserVO vo = new UserVO();
		int result;

		result = userService.nickCheck(nickname);
		return result;
	}

	// 로그인
	@RequestMapping(value="/user/loginUser.do", method= {RequestMethod.POST})
	@ResponseBody
	public String loginUser(@RequestBody UserVO vo) {
		/*
		 * System.out.println(param); 
		 * String id = (String)param.get("id"); 
		 * String pwd = (String)param.get("pwd"); UserVO vo = new UserVO(); vo.setuId(id);
		 * vo.setuPwd(pwd);
		 */
		
		System.out.println(vo);
		return "";
	}

	// 회원가입
	@PostMapping("/user/join.do")
	public String join(UserVO vo) {
		System.out.println("회원가입 controller join()");
		System.out.println("vo: " + vo);
		userService.join(vo);
		return "/user/joinconfirm";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("main/main");

		return mv;
	}

	// 카카오
	@RequestMapping(value = "/user/kakaologin.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String kakaologin(String uId, HttpServletRequest request) {
		UserVO vo = new UserVO();
		System.out.println("1) 카카오톡 로그인 실행: " + uId);
		vo.setuEmail(uId);
		
		
		UserVO login = userService.kakaoLogin(vo);
		

		if(login == null) {
			System.out.println("아이디가 없는 경우");

			return "noid";
		}else {
			request.getSession().setAttribute("login", login);
			System.out.println("로그인 성공");
			return "idok";
		}
		
	}

}