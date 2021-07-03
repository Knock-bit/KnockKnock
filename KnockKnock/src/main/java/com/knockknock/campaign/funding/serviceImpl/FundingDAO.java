package com.knockknock.campaign.funding.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.funding.FundingUserVO;
import com.knockknock.campaign.funding.FundingVO;

@Repository
public class FundingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FundingVO selectOneFunding(FundingVO funding) {
		return mybatis.selectOne("campaign.selectOneFunding", funding.getCfIdx());
	}
	
	public List<FundingVO> selectAllFunding(){
		System.out.println("select All funding() DAO ");
		return mybatis.selectList("campaign.selectAllFunding");
	}

	public int updateExpiredFunding() {
		return mybatis.update("campaign.updateExpiredFunding");
	}

	public int updateFundingPoint(FundingUserVO fundingUser) {
		return mybatis.update("campaign.updateFundingPoint", fundingUser);
	}


	
}
