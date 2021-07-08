package com.knockknock.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return conditionMap;
	}
	
	// 캠페인 리스트 검색 
	@ModelAttribute("conditionMapUserCampaign")
	public Map<String, String> SearchConditionMapUserCampaign(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("제안자", "USER");
		
		return conditionMap;
	}
	
	// 제안서 검색
	@ModelAttribute("conditionMapProposal")
	public Map<String, String> SearchConditionMapProposal() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("제안자", "USER");

		return conditionMap;
	}
	

	
	@GetMapping("/adminMain.do")
	public String moveAdminMain() {
		return "/admin/adminMain";
	}

	// 유저 활성상태 변경
	@RequestMapping(value="/adminActive.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void updateUserActive(@RequestBody AdminUserVO vo) {
		System.out.println("유저 활성 상태 변경");
		System.out.println(vo);
		AdminUserVO user = adminService.getUser(vo);
		adminService.updateUserActive(user);
		System.out.println("uuuuu" + user);
	}
	 
	
	// 유저리스트
	@GetMapping("/adminUserList.do")
	public String getUserList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {
		int total = adminService.countUser();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword(),pvo.getSort());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getUserList(pvo));
		System.out.println(adminService.getUserList(pvo));
		System.out.println(pvo);
		return "/admin/adminUserList";
	}

	// 키워드 리스트
	@GetMapping("/adminKeywordList.do")
	public String getKeywordList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {

		int total = adminService.countKeyword();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword(),pvo.getSort());
		List<AdminKeywordVO> kvo = adminService.getKeywordList(pvo);
		System.out.println(kvo);
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", kvo);
		return "/admin/adminKeywordList";
	}
	
	// 캠페인 카테고리 리스트
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
	
	// 캠페인 리스트 가져오기 
	@GetMapping("/adminCampaignList.do")
	public String getCampaignList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = adminService.countCampaign();
		Map<String,String> map = pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignList(pvo));
		return "/admin/campaign/adminCampaignList";
	}
	
	// 캠페인 상세보기
	@GetMapping("/getCampaign.do")
	public String getCampaign(AdminCampaignVO vo, Model model) {
		AdminCampaignVO campaign = adminService.getCampaign(vo);
		System.out.println("VO :: : :: : :: : : " + campaign);
		model.addAttribute("campaign",campaign);
		return "/admin/campaign/adminCampaignDetail";
	}

}
