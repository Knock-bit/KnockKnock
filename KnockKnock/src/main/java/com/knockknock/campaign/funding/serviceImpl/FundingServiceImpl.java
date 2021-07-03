package com.knockknock.campaign.funding.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.funding.FundingService;
import com.knockknock.campaign.funding.FundingUserVO;
import com.knockknock.campaign.funding.FundingVO;

@Service("fundingService")
public class FundingServiceImpl implements FundingService{
	@Autowired
	private FundingDAO fundingDAO;
	@Autowired
	private FundingUserDAO fundingUserDAO;

	@Override
	public List<FundingVO> selectAllFunding() {
		System.out.println("serviceImpl>> selectAllFunding");
		return fundingDAO.selectAllFunding();
	}

	@Override
	public FundingVO selectOneFunding(FundingVO funding) {
		System.out.println("serviceImpl>> selectAllFunding");
		return fundingDAO.selectOneFunding(funding);
	}

	@Override
	public int updateExpiredFunding() {
		return fundingDAO.updateExpiredFunding();
	}

	@Override
	public List<FundingUserVO> selectAllFundingUsers(int cfIdx) {
		return fundingUserDAO.selectAllCampaignUsers(cfIdx);
	}

	@Override
	public int insertFundingUser(FundingUserVO fundingUser) {
		return fundingUserDAO.insertFundingUser(fundingUser);
	}

	@Override
	public int updateFundingPoint(FundingUserVO fundingUser) {
		return fundingDAO.updateFundingPoint(fundingUser);
	}

	@Override
	public FundingUserVO selectFundingUser(FundingUserVO fundingUser) {
		return fundingUserDAO.selectFundingUser(fundingUser);
	}
	
}
