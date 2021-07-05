package com.knockknock.admin.funding.serviceImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.admin.funding.AdminFundingVO;
import com.knockknock.admin.proposal.AdminProposalVO;

@Repository
public class AdminFundingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return mybatis.selectOne("AdminDAO.getProposal", vo);
	}
}
