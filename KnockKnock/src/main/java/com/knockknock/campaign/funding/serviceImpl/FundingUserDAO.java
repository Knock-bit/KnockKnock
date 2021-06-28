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
}
