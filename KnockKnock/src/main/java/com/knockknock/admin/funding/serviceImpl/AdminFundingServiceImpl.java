package com.knockknock.admin.funding.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.admin.funding.AdminFundingService;
import com.knockknock.admin.proposal.AdminProposalVO;

@Service("adminFudingService")
public class AdminFundingServiceImpl implements AdminFundingService {

	
	@Autowired
	AdminFundingDAO adminFundingDAO;

	@Override
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return adminFundingDAO.getProposal(vo);
	}
}
