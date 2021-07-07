package com.knockknock.campaign.funding.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.funding.FundingUserVO;

@Repository
public class FundingUserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<FundingUserVO> selectAllCampaignUsers(int cfIdx){
		System.out.println("cfIdx:" + cfIdx);
		return mybatis.selectList("campaign.selectAllFundingUsers", cfIdx);
	}

	public int insertFundingUser(FundingUserVO fundingUser) {
		return mybatis.insert("campaign.insertFundingUser", fundingUser);
	}

	public FundingUserVO selectFundingUser(FundingUserVO fundingUser) {
		return mybatis.selectOne("campaign.selectFundingUser", fundingUser);
	}

	public int updateUserFundingPoint(FundingUserVO fundingUser) {
		mybatis.insert("campaign.updateUserPlusPointDetail", fundingUser);
		return mybatis.update("campaign.updateUserFundingPoint", fundingUser);
	}

	public int deleteFundingUser(FundingUserVO fundingUser) {
		return mybatis.delete("campaign.deleteFundingUser", fundingUser);
	}

	public int updateFundingPointMinus(FundingUserVO fundingUser) {
		return mybatis.insert("campaign.updateFundingPointMinus", fundingUser);
	}

	public int updateUserFundingPointMinus(FundingUserVO fundingUser) {
		mybatis.insert("campaign.updateUserMinusPointDetail", fundingUser);
		return mybatis.insert("campaign.updateUserFundingPointMinus", fundingUser);
	}

	public int updateSuccessFunding() {
		return mybatis.update("campaign.updateSuccessFunding");
	}
}
