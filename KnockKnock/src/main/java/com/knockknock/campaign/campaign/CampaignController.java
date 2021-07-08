package com.knockknock.campaign.campaign;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.knockknock.campaign.funding.FundingUserVO;
import com.knockknock.user.UserService;
import com.knockknock.user.UserVO;


@Controller
@RequestMapping("/campaign")
public class CampaignController {
	@Autowired
	private CampaignService campaignService;
	
	@GetMapping("/tempIndex.do")
	public String moveTemp() {
		System.out.println(">>> temp index로 이동");
		return "/campaign/tempIndex";
	}
	
	@GetMapping("/ing/list.do")
	public String ingList(Model model) {
		int start = campaignService.updateStartCampaign();
		int result = campaignService.updateExpiredCampaign();
		System.out.println(">>>" + result + "개의 캠페인 만료처리");
		if (result > 0) {
			// 포인트 분배 처리
			int ciIdx = campaignService.selectExpiredCampaign();
			campaignService.insertCampaignRank(ciIdx);
			int distResult = campaignService.updateCampaignPoint(ciIdx);
			System.out.println(">>> " + distResult + "개 캠페인 포인트 분배 완료");
		}
		
		
		// 캠페인 목록 불러옴
		List<CampaignVO> campaignList = campaignService.selectCampaignList();
		System.out.println("campaignList 출력:" + campaignList);
		if(campaignList !=null) {
			model.addAttribute("list", campaignList);
		}
		System.out.println(">>> 진행중인 캠페인으로 이동");
		return "/campaign/ing/list";
	}
	
	
	@GetMapping("/getIngList.do")
	public String getIngList(Model model) {
		List<CampaignVO> campaignIngList = campaignService.selectCampaignList();
		System.out.println("campaignIngList 출력:" + campaignIngList);
		if(campaignIngList !=null) {
			model.addAttribute("list", campaignIngList);
		}
		System.out.println(">>> 진행된 캠페인 출력");
		return "/campaign/ing/listContent";
	}
	
	@GetMapping("/getList.do")
	public String getList(Model model, HttpServletRequest request) {
		String order = request.getParameter("order");
		
		List<CampaignVO> campaignIngList = null;
		
		if (order.equals("latest")){
			campaignIngList = campaignService.selectCampaignListLatest();			
		} else if (order.equals("userCount")) {
			campaignIngList = campaignService.selectCampaignListUserCount();
		}
		System.out.println("campaignIngList 출력:" + campaignIngList);
		if(campaignIngList !=null) {
			model.addAttribute("list", campaignIngList);
		}
		System.out.println(">>> 진행된 캠페인 출력");
		return "/campaign/ing/listContent";
	}
	
	
	@GetMapping("/getEndList.do")
	public String getEndList(Model model) {
		List<CampaignVO> campaignEdList = campaignService.selectCampaignEdList();
		System.out.println("EdCampaignList 출력:" + campaignEdList);
		if(campaignEdList !=null) {
			model.addAttribute("list", campaignEdList);
		}
		System.out.println(">>> 종료된 캠페인 출력");
		return "/campaign/ing/listContent";
	}
	
	
	@GetMapping("/ed/list.do")
	public String edList(Model model) {
		List<CampaignVO> campaignEdList = campaignService.selectCampaignEdList();
		System.out.println("EdCampaignList 출력:" + campaignEdList);
		if(campaignEdList !=null) {
			model.addAttribute("list", campaignEdList);
		}
		System.out.println(">>> 종료된 캠페인으로 이동");
		return "/campaign/ed/list";
	}
	
	@GetMapping("/search.do")
	public String search(String input, Model model) {
		System.out.println("input값:" + input);
		List<CampaignVO> searchedList = campaignService.selectInputResult(input);
		if(searchedList !=null) {
			model.addAttribute("list", searchedList);
			model.addAttribute("input", input);
		}
		return "/campaign/ing/searched";
	}
	
	
	@GetMapping("/ing/detail.do")
	public String detail(@SessionAttribute(name = "users", required = false) UserVO user, CampaignVO campaignVO, Model model) {
		System.out.println(">>> 진행중 캠페인 상세페이지로 이동!");
		int ciIdx = campaignVO.getCiIdx();
		
		if (user != null) {
			System.out.println("세션값 있음");
			int uIdx = user.getuIdx();

			CampaignUserVO cUser = new CampaignUserVO();
			cUser.setCiIdx(ciIdx);
			cUser.setuIdx(uIdx);

			CampaignUserVO campaignUser = campaignService.selectCampaignUser(cUser);

			if (campaignUser != null) {
				model.addAttribute("campaignUser", campaignUser);
			}
			;

		}
		
		// 캠페인 참여
		// -> 차감할 포인트를 정하기 위해
		// 	  후기게시판으로 이동하기 전에 사용자 식별 필요.
		
			// 식별(1) 캠페인에 참여하였는가
			// -> 포인트 차감 0
		
			// 식별(2) 펀딩에 참여하였는가
			//		  -> 펀딩 참여시   0   포인트 차감 
			//		  -> 펀딩 미참여시  300 포인트 차감
			
			// 공통	 -> ESTIMATED POINT  +  10
		
		
		
		CampaignVO campaign = campaignService.selectOneCampaign(campaignVO);
		List<CampaignUserVO> userList = campaignService.selectAllCampaignUsers(ciIdx);
		/*
		 * for(CampaignUserVO users : userList) { System.out.println("userNickName : " +
		 * users.getNickname()); }
		 */
		model.addAttribute("campaign", campaign);
		model.addAttribute("userList", userList);
		return "/campaign/ing/detail";
	}
	
	@GetMapping("/getDetailContent.do")
	public String detailContent(CampaignVO campaignVO, Model model) {
		System.out.println(">>> 진행중 캠페인 content페이지 호출!");
		
		int ciIdx = campaignVO.getCiIdx();
		CampaignVO campaign = campaignService.selectOneCampaign(campaignVO);
		
		model.addAttribute("campaign", campaign);
		return "/campaign/ing/detailContent";
	}
	
	
	
	@GetMapping("/ed/detail.do")
	public String edDetail(CampaignVO campaignVO, Model model) {
		System.out.println(">>> 진행중 캠페인 상세페이지로 이동!");
		int ciIdx = campaignVO.getCiIdx();
		CampaignVO campaign = campaignService.selectOneCampaign(campaignVO);
		List<CampaignUserVO> userList = campaignService.selectAllCampaignUsers(ciIdx);
		for(CampaignUserVO user : userList) {
			System.out.println("userNickName : " + user.getNickname());
		}
		model.addAttribute("campaign", campaign);
		model.addAttribute("userList", userList);
		return "/campaign/ed/detail";
	}
	
	
	
}
