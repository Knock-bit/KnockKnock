package com.knockknock.admin.funding;

import java.util.List;

import com.knockknock.admin.proposal.AdminProposalVO;
import com.knockknock.util.PagingVO;

public interface AdminFundingService {
	public AdminProposalVO getProposal(AdminProposalVO vo);
	public List<AdminCampaignCategoryVO> getCategoryList();
	public int insertFunding(AdminFundingVO vo);
	public void updateCpActive(AdminFundingVO vo);
	public List<AdminFundingVO> getFundingList(PagingVO pvo);
	public int countFunding();
}
