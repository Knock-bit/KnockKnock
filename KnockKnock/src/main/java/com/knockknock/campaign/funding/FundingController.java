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
		int result = fundingService.updateExpiredFunding();
		
		System.out.println(result + "개의 펀딩 종료처리 ");
		if(result > 0) {
			// 펀딩 종료 = >
			// 캠페인으로 바로 등록 ? 
			// 
			
			
		}
		
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
		List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
		System.out.println("funding 출력 : " + funding);
		model.addAttribute("funding", funding);
		model.addAttribute("userList", userList);
		return "campaign/funding/detail";
	}
	
}
