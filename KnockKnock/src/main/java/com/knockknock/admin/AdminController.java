package com.knockknock.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	public AdminController() {
		System.out.println("==> AdminController() 객체 생성");
	}
	
	public String getUserList(UserVO vo, Model model) {
		System.out.println("유저 목록 보여주기");
		System.out.println("vo : " + vo);
		List<UserVO> userList = adminService.getUserList();
		model.addAttribute("userList",userList);
		return "admin/adminUser";
	}
}
