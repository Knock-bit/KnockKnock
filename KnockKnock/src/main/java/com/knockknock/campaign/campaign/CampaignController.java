package com.knockknock.campaign.campaign;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
		// 종료일 지난 캠페인 만료시킴
		int result = campaignService.updateExpiredCampaign();
		System.out.println(">>>" + result + "개의 캠페인 만료처리");
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
	
	
	@GetMapping("/ing/detail.do")
	public String detail(CampaignVO campaignVO, Model model) {
		System.out.println(">>> 진행중 캠페인 상세페이지로 이동!");
		int ciIdx = campaignVO.getCiIdx();
		CampaignVO campaign = campaignService.selectOneCampaign(campaignVO);
		List<CampaignUserVO> userList = campaignService.selectAllCampaignUsers(ciIdx);
		for(CampaignUserVO user : userList) {
			System.out.println("userNickName : " + user.getNickname());
		}
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
