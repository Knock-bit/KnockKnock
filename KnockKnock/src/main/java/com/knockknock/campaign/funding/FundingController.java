package com.knockknock.campaign.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class FundingController {
	@Autowired
	private FundingService fundingService;
	
}
