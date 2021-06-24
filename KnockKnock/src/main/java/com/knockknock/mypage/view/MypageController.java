package com.knockknock.mypage.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.knockknock.mypage.service.MypageService;
import com.knockknock.user.UserVO;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	// 내 정보 수정으로 이동(임시)
	public String updateMypage(UserVO vo, Model model) {
		
		String id = "test";
		UserVO user = mypageService.selelctOneUser(id);
		model.addAttribute("user", user);
		
		return null;
		
	}

}
