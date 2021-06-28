package com.knockknock.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.knockknock.util.PagingVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	public AdminController() {
		System.out.println("==> AdminController() 객체 생성");
	}

	@GetMapping("/adminMain.do")
	public String moveAdminMain() {
		return "/admin/adminMain";
	}

	@GetMapping("/adminActive.do")
	public String updateUserActive(AdminUserVO vo) {
		System.out.println("유저 활성 상태 변경");
		AdminUserVO user = adminService.getUser(vo);
		adminService.updateUserActive(user);
		System.out.println(user);
		return "redirect:admin.do";
	}

	@GetMapping("/adminUserList.do")
	public String getUserList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = adminService.countUser();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "3";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "3";
		}
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getUserList(pvo));
		System.out.println(adminService.getUserList(pvo));
		System.out.println(pvo);
		return "/admin/adminUserList";
	}

	@GetMapping("/adminKeywordList.do")
	public String getKeywordList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = adminService.countKeyword();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",pvo);
		model.addAttribute("viewAll", adminService.getKeywordList(pvo));
		return "/admin/adminKeywordList";
	}
	

}
