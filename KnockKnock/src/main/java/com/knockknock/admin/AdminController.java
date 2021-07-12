package com.knockknock.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.admin.funding.AdminFundingService;
import com.knockknock.admin.funding.AdminFundingVO;
import com.knockknock.orders.OrdersVO;
import com.knockknock.seller.SellerVO;
import com.knockknock.util.PagingVO;

@Controller
@SessionAttributes({ "contact", "funding" })
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminFundingService adminFundingService;

	public AdminController() {
		System.out.println("==> AdminController() 객체 생성");
	}

	// 페이지 셋팅부분
	public static Map<String, String> pageSet(String nowPage, String cntPerPage) {
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
	public Map<String, String> SearchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");

		return conditionMap;
	}

	// 키워드, 캠페인 카테고리 검색
	@ModelAttribute("conditionMapOnlyContent")
	public Map<String, String> SearchConditionMapContent() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");

		return conditionMap;
	}

	// 유저 검색
	@ModelAttribute("conditionMapUser")
	public Map<String, String> SearchConditionMapUser() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("이름", "NAME");
		conditionMap.put("닉네임", "NICKNAME");

		return conditionMap;
	}

	// 캠페인 리스트 검색
	@ModelAttribute("conditionMapUserCampaign")
	public Map<String, String> SearchConditionMapUserCampaign() {
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

	// 문의사항 검색
	@ModelAttribute("conditionMapContact")
	public Map<String, String> SearchConditionMapContact() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("작성자", "USER");

		return conditionMap;
	}

	@GetMapping("/adminMain.do")
	public String moveAdminMain() {
		return "/admin/adminMain";
	}

	// 유저 활성상태 변경
	@RequestMapping(value = "/adminActive.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
		Map<String, String> map = pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
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
		Map<String, String> map = pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
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
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {
		int total = adminService.countCampaignCategory();
		Map<String, String> map = pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignCategoryList(pvo));
		return "/admin/adminCampaignCategory";
	}

//	@GetMapping("/adminFunding.do")
//	public String getFunding() {
//		return "/admin/funding/adminFunding";
//	}

	// 펀딩에서 캠페인 등록하기 전단계 -> 데이터 불러오기
	@PostMapping("/adminCampaign.do")
	public String createCampaign(@ModelAttribute("funding") AdminFundingVO vo, Model model) {
		List<AdminKeywordVO> keyword = adminService.getKeywordAll();
		List<AdminCampaignCategoryVO> campaignCategory = adminFundingService.getCategoryList();
		model.addAttribute("keyword", keyword);
		model.addAttribute("campaignCategory", campaignCategory);
		model.addAttribute("funding", vo);
		System.out.println(vo);
		return "/admin/campaign/adminCreateCampaign";
	}

	@PostMapping("/insertCampaign.do")
	public String insertCampaign(@ModelAttribute("funding") AdminFundingVO fvo, AdminCampaignVO vo) {
		vo.setCfIdx(fvo.getCfIdx());
		System.out.println("dfsfsdfsdfsdfs" + vo);
		int result = adminService.insertCampaign(vo);
		System.out.println("캠페인추가 : " + result);
		return null;
	}

	// 캠페인 리스트 가져오기
	@GetMapping("/adminCampaignList.do")
	public String getCampaignList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {

		int total = adminService.countCampaign();
		Map<String, String> map = pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getCampaignList(pvo));
		return "/admin/campaign/adminCampaignList";
	}

	// 캠페인 상세보기
	@GetMapping("/getCampaign.do")
	public String getCampaign(AdminCampaignVO vo, Model model) {
		AdminCampaignVO campaign = adminService.getCampaign(vo);
		System.out.println("VO :: : :: : :: : : " + campaign);
		model.addAttribute("campaign", campaign);
		return "/admin/campaign/adminCampaignDetail";
	}

	// 문의사항 리스트 보기
	@GetMapping("/getContactList.do")
	public String getContactList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {
		int total = adminService.countContact();
		Map<String, String> map = pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
		System.out.println(pvo);
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminService.getContactList(pvo));
		return "/admin/contact/adminContactList";
	}

	// 문의사항 상세보기
	@GetMapping("/getContactDetail.do")
	public String getContactDetail(AdminContactVO vo, Model model) {
		AdminContactVO contact = adminService.getContactDetail(vo);
		List<AdminContactCommentVO> comment = adminService.getCommentList(vo);
		System.out.println(contact);
		model.addAttribute("contact", contact);
		model.addAttribute("comment", comment);
		return "/admin/contact/adminContactDetail";
	}

	@PostMapping("/insertContactComment.do")
	public String insertContactComment(@ModelAttribute("contact") AdminContactVO vo, AdminContactCommentVO cmvo,
			HttpServletRequest request) throws Exception {
		System.out.println(vo);
		System.out.println(cmvo);
		adminService.sendEmail(vo, cmvo.getCmContent());
		cmvo.setCtIdx(vo.getCtIdx());
		cmvo.setuIdx(vo.getuIdx());
		adminService.insertComment(cmvo);
		String referer = request.getHeader("Referer");
		adminService.updateCtResp(vo);
		return "redirect:" + referer;
	}

}