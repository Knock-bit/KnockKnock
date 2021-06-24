package com.knockknock.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;

@Controller
@SessionAttributes("user")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	// 내 정보 수정으로 이동(임시)
	@GetMapping("/mypage.do")
	public String updateMypage(UserVO vo, Model model) {
		
		String id = "test";
		UserVO user = mypageService.selelctOneUser(id);
		model.addAttribute("user", user);
		
		return "updateMyInfo";
		
	}

}
