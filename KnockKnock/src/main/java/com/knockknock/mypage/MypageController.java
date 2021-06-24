package com.knockknock.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;

@Controller
@SessionAttributes("user")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	//@GetMapping("/myp.do")
	@RequestMapping(value="/myp.do", method=RequestMethod.GET)
	public String moveMypage() {
		System.out.println("이동완료");
		
		return null;
	}
	
	
	// 내 정보 수정으로 이동(임시)
	@GetMapping("/mypage.do")
	public String updateMypage(UserVO vo, Model model) {
		
		String id = "test";
		UserVO user = mypageService.selelctOneUser(id);
		model.addAttribute("user", user);
		
		return "updateMyInfo";
		
	}

}
