package com.knockknock.admin.proposal.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;
import com.knockknock.admin.proposal.AdminProposalService;

@Service("adminProposalService")
public class AdminProposalServiceImpl implements AdminProposalService {

	@Autowired
	AdminProposalDAO adminProposalDAO;

	@Override
	public int countProposal() {
		return adminProposalDAO.countProposal();
	}


	@Override
	public List<AdminProposalVO> getProposalList(PagingVO pvo) {
		return adminProposalDAO.getProposalList(pvo);
	}


	@Override
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return adminProposalDAO.getProposal(vo);
	}
	
}
