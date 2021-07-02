package com.knockknock.campaign.funding;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;

@Controller
@SessionAttributes("users") // users 세션에 저장
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
	
	@GetMapping("campaign/funding/fund.do")
	public String fund(UserVO users, Model model) {
		System.out.println(">>> 펀딩");
		System.out.println(users.getuIdx());
		
		/*
		 * FundingVO funding = fundingService.selectOneFunding(fundingVO);
		 * List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
		 * System.out.println("funding 출력 : " + funding); model.addAttribute("funding",
		 * funding); model.addAttribute("userList", userList);
		 */
		return "campaign/funding/detail";
	}
	
	
	
}
