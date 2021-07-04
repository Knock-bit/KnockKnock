package com.knockknock.campaign.funding;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.campaign.campaign.CampaignService;
import com.knockknock.user.UserVO;


@Controller
@SessionAttributes("users") // users 세션에 저장
public class FundingController {
	int cfPoint = 250;
	@Autowired
	private FundingService fundingService;
	@Autowired
	private CampaignService campaignService;

	@GetMapping("campaign/funding/list.do")
	public String list(Model model) {
		int result = fundingService.updateExpiredFunding();

		System.out.println(result + "개의 펀딩 종료처리 ");
		if (result > 0) {
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
	public String detail(@SessionAttribute(name = "users", required = false) UserVO user, FundingVO fundingVO,
			Model model) {
		System.out.println(">>> 펀딩중 캠페인 상세페이지로 이동!");
		int cfIdx = fundingVO.getCfIdx();
		if (user != null) {
			System.out.println("세션값 있음");
			int uIdx = user.getuIdx();

			FundingUserVO fUser = new FundingUserVO();
			fUser.setCfIdx(cfIdx);
			fUser.setuIdx(uIdx);

//			int check = 0;
			FundingUserVO fundingUser = fundingService.selectFundingUser(fUser);

			if (fundingUser != null) {
				model.addAttribute("fundingUser", fundingUser);
			}
			;

		}

		FundingVO funding = fundingService.selectOneFunding(fundingVO);
		List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
		System.out.println("funding 출력 : " + funding);
		model.addAttribute("funding", funding);
		model.addAttribute("userList", userList);
		return "campaign/funding/detail";
	}

	
	@RequestMapping(value = "campaign/funding/doAjaxFund.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int doAjaxFund(FundingUserVO fundingUser) {
		System.out.println(">>> 펀딩 vo : " + fundingUser);
		fundingUser.setCfPoint(cfPoint);
		System.out.println(fundingUser.getuIdx());
		System.out.println(fundingUser.getCfIdx());
		
		int result = fundingService.insertFundingUser(fundingUser);
		int pointResult = fundingService.updateFundingPoint(fundingUser);
		int userPointReuslt = fundingService.updateUserFundingPoint(fundingUser);
		System.out.println("result" + result);
		/*
		 * FundingVO funding = fundingService.selectOneFunding(fundingVO);
		 * List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
		 * System.out.println("funding 출력 : " + funding); model.addAttribute("funding",
		 * funding); model.addAttribute("userList", userList);
		 */
		return result;
	}

	/*
	 * @GetMapping("campaign/funding/fund.do") public String
	 * fund(@RequestParam("uIdx") int uIdx, @RequestParam("cfIdx") int cfIdx ,
	 * FundingUserVO fundingUser) { System.out.println(">>> 펀딩");
	 * System.out.println(uIdx); fundingUser.setCfPoint(cfPoint);
	 * 
	 * // fundingService.insertFundingUser(fundingUser);
	 * fundingService.updateFundingPoint(fundingUser);
	 * 
	 * 
	 * FundingVO funding = fundingService.selectOneFunding(fundingVO);
	 * List<FundingUserVO> userList = fundingService.selectAllFundingUsers(cfIdx);
	 * System.out.println("funding 출력 : " + funding); model.addAttribute("funding",
	 * funding); model.addAttribute("userList", userList);
	 * 
	 * return "campaign/funding/detail"; }
	 */

}
