package com.knockknock.campaign.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FundingController {
	@Autowired
	private FundingService fundingService;
	
	@GetMapping("campaign/funding/list.do")
	public String list(Model model) {
		List<FundingVO> fundingList = fundingService.selectAllFunding();
		System.out.println("fundingList 출력: " + fundingList);
		model.addAttribute("fundingList", fundingList);
		return "campaign/funding/list";
	}
	
	
	@GetMapping("campaign/funding/detail.do")
	public String detail(FundingVO fundingVO, Model model) {
		System.out.println(">>> 펀딩중 캠페인 상세페이지로 이동!");
		int cfIdx = fundingVO.getCfIdx();
		FundingVO funding = fundingService.selectOneFunding(fundingVO);
		List<FundingVO> fundingList = fundingService.selectAllFunding();
		List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
		System.out.println("fundingList 출력: " + fundingList);
		model.addAttribute("fundingList", fundingList);
		return "campaign/funding/detail";
	}
	
}
