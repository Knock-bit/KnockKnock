package com.knockknock.campaign.proposal.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.proposal.ProposalService;
import com.knockknock.campaign.proposal.ProposalVO;

@Service("proposalService")
public class ProposalServiceImpl implements ProposalService {
	@Autowired
	private ProposalDAO proposalDAO;
	
	@Override
	public int insertProposal(ProposalVO proposal) {
		
		return proposalDAO.insertProposal(proposal);
	}

}
