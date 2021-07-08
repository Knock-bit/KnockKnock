package com.knockknock.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;


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

	// 리스트들에서 검색하기위한 두 개의 데이터가 담겨져있는 Map를 반환하는 메소드
	@ModelAttribute("conditionMap")
	public Map<String, String> SearchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	// 키워드, 캠페인 카테고리 검색 
	@ModelAttribute("conditionMapOnlyContent")
	public Map<String, String> SearchConditionMapContent(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	// 유저 검색 
	@ModelAttribute("conditionMapUser")
	public Map<String, String> SearchConditionMapUser(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("이름", "NAME");
		conditionMap.put("닉네임", "NICKNAME");
		conditionMap.put("활성상태", "ACTIVE");
		
		return conditionMap;
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
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword());
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
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword());
		List<AdminKeywordVO> kvo = adminService.getKeywordList(pvo);
		System.out.println(kvo);
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", kvo);
		return "/admin/adminKeywordList";
	}
	
	@GetMapping("/adminCampaignCategory.do")
	public String getCampaignCategoryList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adminService.countCampaignCategory();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignCategoryList(pvo));
		return "/admin/adminCampaignCategory";
	}
	@GetMapping("/adminFunding.do")
	public String getFunding() {
		return "/admin/adminFunding";
	}
	
	
	@GetMapping("/adminCampaignList.do")
	public String getCampaignList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = adminService.countCampaign();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignList(pvo));
		return "/admin/campaign/adminCampaignList";
	}
	
	@GetMapping("/getCampaign.do")
	public String getCampaign(AdminCampaignVO vo, Model model) {
		AdminCampaignVO campaign = adminService.getCampaign(vo);
		System.out.println("VO :: : :: : :: : : " + campaign);
		model.addAttribute("campaign",campaign);
		return "/admin/campaign/adminCampaignDetail";
	}

}
