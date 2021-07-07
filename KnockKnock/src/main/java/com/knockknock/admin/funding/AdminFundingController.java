package com.knockknock.admin.funding;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		model.addAttribute("campaignCategory",campaignCategory);
		System.out.println(proposal);
		return "/admin/funding/adminFunding";
	}

	@PostMapping("insertFunding.do")
	public String insertFunding(AdminFundingVO vo) {
		int result = adminFudingService.insertFunding(vo);
		if(result !=0) {
//			cpActive 1로 변경해야함. 테스트 위해 주석처리
//			adminFudingService.updateCpActive(vo);
		}

		return "redirect:getFundingList.do";
	}
	
	@GetMapping("getFundingList.do")
	public String getFundingList(AdminFundingVO vo, PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = adminFudingService.countFunding();
		Map<String,String> map = UtilClass.pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminFudingService.getFundingList(pvo));
		System.out.println("funding>> " + adminFudingService.getFundingList(pvo));
		return "/admin/funding/adminFundingList";
	}
	
	@GetMapping("getFunding.do")
	public String getFundingDetail(AdminFundingVO vo, Model model) {
		AdminFundingVO funding = adminFudingService.getFunding(vo);
		System.out.println(funding);
		model.addAttribute("funding",funding);
		return "/admin/funding/adminFundingDetail";
	}
	
	// 펀딩 start Ajax
	@ResponseBody
	@RequestMapping(value="/startFunding.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int startFunding(@RequestBody AdminFundingVO vo) {
		System.out.println("Ajax funding Start"); 
		int result = adminFudingService.updateCfStatus(vo);
		return result;
	}

}
