package com.knockknock.campaign.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.CampaignUserVO;
import com.knockknock.campaign.CampaignVO;

@Repository
public class CampaignDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public CampaignVO selectOneCampaign(int cIdx) {
		return mybatis.selectOne("campaign.selectOneCampaign", cIdx);
	}
	
	public List<CampaignVO> selectAllCampaign() {
		return mybatis.selectList("campaign.selectAllCampaign");
	}
	
	public List<CampaignUserVO> selectAllUsers(){
		return mybatis.selectList("campaign.selectAllusers");
	}
}
