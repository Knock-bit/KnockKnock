package com.knockknock.campaign.funding.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.funding.FundingService;
import com.knockknock.campaign.funding.FundingVO;

@Service("fundingService")
public class FundingServiceImpl implements FundingService{
	@Autowired
	private FundingDAO fundingDAO;

	@Override
	public List<FundingVO> selectAllFunding() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FundingVO selectOneFunding(FundingVO funding) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateExpiredFunding() {
		// TODO Auto-generated method stub
		
	}
	
}
