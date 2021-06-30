package com.knockknock.campaign.proposal.serviceImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.proposal.ProposalVO;

@Repository
public class ProposalDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public int insertProposal(ProposalVO proposalVO) {
		return mybatis.insert("campaign.insertProposal", proposalVO);
	}
}
