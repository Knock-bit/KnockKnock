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
@SessionAttributes("users")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	// 마이페이지 임시 메인으로 이동
	@GetMapping("/myPage.do")
	public String moveMypage() {
		
		return "/mypage/mypage";
	}
	
	
	// 내 정보 수정으로 이동
	@GetMapping("/updateMyInfo.do")
	public String updateMypage(UserVO vo, Model model) {
		
		String id = "test";
		UserVO user = mypageService.selelctOneUser(id);
		model.addAttribute("user", user);
		
		return "/mypage/updateMyInfo";
		
	}

}
