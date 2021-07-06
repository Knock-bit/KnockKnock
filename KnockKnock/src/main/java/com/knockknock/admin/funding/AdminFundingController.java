package com.knockknock.admin.funding;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.knockknock.admin.proposal.AdminProposalVO;

@Controller
public class AdminFundingController {

	@GetMapping("createFunding.do")
	public String createFunding(AdminProposalVO vo, Model model) {
		
		return "/admin/adminFunding";
	}
	
}
