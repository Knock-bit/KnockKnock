package com.knockknock.campaign.ing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CampaignController {
	@Autowired
	private CampaignService campaignService;
	
	@GetMapping("/campaign/tempIndex.do")
	public String moveTemp() {
		System.out.println(">>> temp index로 이동");
		return "/campaign/tempIndex";
	}
	
	@GetMapping("/campaign/ing/list.do")
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
	
	@GetMapping("/campaign/ed/list.do")
	public String edList(Model model) {
		List<CampaignVO> campaignEdList = campaignService.selectCampaignEdList();
		System.out.println("EdCampaignList 출력:" + campaignEdList);
		if(campaignEdList !=null) {
			model.addAttribute("list", campaignEdList);
		}
		System.out.println(">>> 종료된 캠페인으로 이동");
		return "/campaign/ed/list";
	}
	
	
	@GetMapping("/campaign/ing/detail.do")
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
	
	@GetMapping("/campaign/ed/detail.do")
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