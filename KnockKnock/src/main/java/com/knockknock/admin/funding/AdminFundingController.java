package com.knockknock.admin.funding;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.knockknock.admin.AdminKeywordVO;
import com.knockknock.admin.AdminService;
import com.knockknock.admin.proposal.AdminProposalVO;

@Controller
public class AdminFundingController {

	@Autowired
	private AdminFundingService adminFudingService;
	@Autowired
	private AdminService adminService;

	@GetMapping("createFunding.do")
	public String createFunding(AdminProposalVO vo, Model model, @RequestParam(value = "proposalIdx", defaultValue = "", required = false) int cpIdx) 
	{
		System.out.println(cpIdx);
		vo.setCpIdx(cpIdx);
		AdminProposalVO proposal = adminFudingService.getProposal(vo);
		List<AdminKeywordVO> keyword = adminService.getKeywordAll();
		model.addAttribute("proposal",proposal);
		model.addAttribute("keyword",keyword);
		System.out.println(proposal);
		return "/admin/adminFunding";
	}
	
	@GetMapping("insertFunding.do")
	public String insertFunding() {
		return null;
	}
	
}
