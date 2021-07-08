package com.knockknock.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.knockknock.util.PagingVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	public AdminController() {
		System.out.println("==> AdminController() 객체 생성");
	}
	// 페이지 셋팅부분
	public static Map<String ,String> pageSet(String nowPage, String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		Map<String, String> ncPage = new HashMap<String, String>();
		ncPage.put("nowPage", nowPage);
		ncPage.put("cntPerPage", cntPerPage);
		return ncPage;
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

		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getKeywordList(pvo));
		return "/admin/adminKeywordList";
	}
	// 캠페인 카테고리 -> 아직 view 미완성
	@GetMapping("/adminCampaignCategory.do")
	public String getCampaignCategoryList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adminService.countCampaignCategory();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignCategoryList(pvo));
		return "/admin/adminCampaignCategory";
	}
	@GetMapping("/adminFunding.do")
	public String getFunding() {
		return "/admin/adminFunding";
	}
	

}
