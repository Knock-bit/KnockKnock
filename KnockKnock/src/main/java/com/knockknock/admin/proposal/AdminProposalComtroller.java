package com.knockknock.admin.proposal;

import java.io.File;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.knockknock.admin.proposal.serviceImpl.AdminProposalServiceImpl;
import com.knockknock.util.PagingVO;
import com.knockknock.util.UtilClass;

@Controller
public class AdminProposalComtroller {
	
	@Autowired
	AdminProposalServiceImpl adminProposalService;
	
	// 리스트들에서 검색하기위한 두 개의 데이터가 담겨져있는 Map를 반환하는 메소드
	@ModelAttribute("conditionMapFunding")
	public Map<String, String> SearchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("제안자", "USER");

		return conditionMap;
	}
	
	
	@GetMapping("/adminProposalList.do")
	public String getKeywordList(PagingVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "sort" , required=false) String sort) {

		int total = adminProposalService.countProposal();
		Map<String,String> map = UtilClass.pageSet(nowPage,cntPerPage);
		nowPage = map.get("nowPage");
		cntPerPage=map.get("cntPerPage");
		pvo.setSort(sort);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),pvo.getSearchCondition(),pvo.getSearchKeyword(), pvo.getSort());
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
