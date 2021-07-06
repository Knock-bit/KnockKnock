package com.knockknock.admin.funding.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.admin.funding.AdminFundingService;
import com.knockknock.admin.funding.AdminFundingVO;
import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;

@Service("adminFudingService")
public class AdminFundingServiceImpl implements AdminFundingService {

	
	@Autowired
	AdminFundingDAO adminFundingDAO;

	@Override
	public AdminProposalVO getProposal(AdminProposalVO vo) {
		return adminFundingDAO.getProposal(vo);
	}

	@Override
	public List<AdminCampaignCategoryVO> getCategoryList() {
		return adminFundingDAO.getCategoryList();
	}

	@Override
	public int insertFunding(AdminFundingVO vo) {
		return adminFundingDAO.insertFunding(vo);
	}

	@Override
	public void updateCpActive(AdminFundingVO vo) {
		adminFundingDAO.updateCpActive(vo);
	}

	@Override
	public List<AdminFundingVO> getFundingList(PagingVO pvo) {
		return adminFundingDAO.getFundingList(pvo);
	}

	@Override
	public int countFunding() {
		return adminFundingDAO.countFunding();
	}

	@Override
	public AdminFundingVO getFunding(AdminFundingVO vo) {
		return adminFundingDAO.getFunding(vo);
	}
}
