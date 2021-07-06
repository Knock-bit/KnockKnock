package com.knockknock.admin.funding.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.admin.funding.AdminFundingVO;
import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;

@Repository
public class AdminFundingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return mybatis.selectOne("AdminDAO.getProposal", vo);
	}


	public List<AdminCampaignCategoryVO> getCategoryList() {
		return mybatis.selectList("AdminDAO.getCategoryList");
	}
	
	public int insertFunding(AdminFundingVO vo) {
		return mybatis.insert("AdminDAO.insertFunding",vo);
	}


	public void updateCpActive(AdminFundingVO vo) {
		mybatis.update("AdminDAO.updateCpActive",vo);
	}


	public List<AdminFundingVO> getFundingList(PagingVO pvo) {
		return mybatis.selectList("Util.getFundingList",pvo);
	}


	public int countFunding() {
		return mybatis.selectOne("Util.countFunding");
	}
}
