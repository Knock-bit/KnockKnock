package com.knockknock.campaign.funding.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.funding.FundingVO;

@Repository
public class FundingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FundingVO selectOneFunding(FundingVO funding) {
		return mybatis.selectOne("campaign.selectOneFunding", funding);
	}
	
	public List<FundingVO> selectAllFunding(){
		return mybatis.selectList("campaign.selectAllFunding");
	}

	
}
