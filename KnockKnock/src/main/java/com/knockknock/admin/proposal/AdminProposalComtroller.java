package com.knockknock.admin.proposal;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.knockknock.admin.proposal.serviceImpl.AdminProposalServiceImpl;
import com.knockknock.util.PagingVO;
import com.knockknock.util.UtilClass;

@Controller
public class AdminProposalComtroller {
	
	@Autowired
	AdminProposalServiceImpl adminProposalService;
	@GetMapping("/adminProposalList.do")
	public String getKeywordList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = adminProposalService.countProposal();
		Map<String,String> map = UtilClass.pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", adminProposalService.getProposalList(pvo));
		System.out.println(adminProposalService.getProposalList(pvo));
		System.out.println(pvo);
		return "admin/proposal/adminProposal";
	}
	
	@GetMapping("/getProposal.do")
	public String getProposal(AdminProposalVO vo, Model model) {
		AdminProposalVO proposal = adminProposalService.getProposal(vo);
		model.addAttribute("proposal",proposal);
		return "admin/proposal/adminDetailProposal";
	}
}
