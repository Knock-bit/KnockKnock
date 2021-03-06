package com.knockknock.admin.funding;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

import com.knockknock.admin.AdminKeywordVO;
import com.knockknock.admin.AdminService;
import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;
import com.knockknock.util.UtilClass;

@Controller
public class AdminFundingController {

	@Autowired
	private AdminFundingService adminFudingService;
	@Autowired
	private AdminService adminService;

	// 리스트들에서 검색하기위한 두 개의 데이터가 담겨져있는 Map를 반환하는 메소드
	@ModelAttribute("conditionMapFunding")
	public Map<String, String> SearchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");

		return conditionMap;
	}

	@GetMapping("createFunding.do")
	public String createFunding(AdminProposalVO vo, Model model,
			@RequestParam(value = "proposalIdx", defaultValue = "", required = false) int cpIdx) {
		System.out.println(cpIdx);
		vo.setCpIdx(cpIdx);
		AdminProposalVO proposal = adminFudingService.getProposal(vo);
		List<AdminKeywordVO> keyword = adminService.getKeywordAll();
		List<AdminCampaignCategoryVO> campaignCategory = adminFudingService.getCategoryList();
		model.addAttribute("proposal", proposal);
		model.addAttribute("keyword", keyword);
		model.addAttribute("campaignCategory", campaignCategory);
		System.out.println(proposal);
		return "/admin/funding/adminFunding";
	}

	@PostMapping("insertFunding.do")
	public String insertFunding(AdminFundingVO vo) {
		int result = adminFudingService.insertFunding(vo);
		if (result != 0) {
//			cpActive 1로 변경해야함. 테스트 위해 주석처리, 주석처리해제
			adminFudingService.updateCpActive(vo);
		}

		return "redirect:getFundingList.do";
	}

	// 펀딩 리스트 가져오기
	@GetMapping("getFundingList.do")
	public String getFundingList(AdminFundingVO vo, PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort", required = false) String sort) {
		int total = adminFudingService.countFunding();
		Map<String, String> map = UtilClass.pageSet(nowPage, cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage = map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getSearchCondition(),
				pvo.getSearchKeyword(), pvo.getSort());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminFudingService.getFundingList(pvo));
		System.out.println("funding>> " + adminFudingService.getFundingList(pvo));
		return "/admin/funding/adminFundingList";
	}

	@GetMapping("getFunding.do")
	public String getFundingDetail(AdminFundingVO vo, Model model) {
		AdminFundingVO funding = adminFudingService.getFunding(vo);
		System.out.println(funding);
		model.addAttribute("funding", funding);
		return "/admin/funding/adminFundingDetail";
	}

	// 펀딩 start Ajax
	@ResponseBody
	@RequestMapping(value = "/startFunding.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int startFunding(@RequestBody AdminFundingVO vo) {
		System.out.println("Ajax funding Start");
		int result = adminFudingService.updateCfStatus(vo);
		return result;
	}

}
