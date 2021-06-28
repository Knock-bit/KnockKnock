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
	public String list(Model model) {
		List<CampaignVO> campaignList = campaignService.selectCampaignList();
		System.out.println("campaignList 출력:" + campaignList);
		if(campaignList !=null) {
			model.addAttribute("list", campaignList);
		}
		System.out.println(">>> 진행중인 캠페인으로 이동");
		return "/campaign/ing/list";
	}
	
	@GetMapping("/campaign/ing/detail.do")
	public String detail(CampaignVO campaignVO, Model model) {
		System.out.println(">>> 진행중 캠페인 상세페이지로 이동!");
		CampaignVO campaign = campaignService.selectOneCampaign(campaignVO);
		model.addAttribute("campaign", campaign);
		return "/campaign/ing/detail";
	}
	
	
	
}
