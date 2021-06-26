package com.knockknock.campaign;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CampaignController {
	
	
	@GetMapping("/campaign/tempIndex.do")
	public String moveTemp() {
		System.out.println(">>> temp index로 이동");
		return "/campaign/tempIndex";
	}
	
	@GetMapping("/campaign/ing/list.do")
	public String list() {
		System.out.println(">>> 진행중인 캠페인으로 이동");
		return "/campaign/ing/list";
	}
	
	@GetMapping("/campaign/ing/detail.do")
	public String detail() {
		System.out.println(">>> 진행중 캠페인 상세페이지로 이동합니다.");
		return "/campaign/ing/detail";
	}
	
	
	
}
