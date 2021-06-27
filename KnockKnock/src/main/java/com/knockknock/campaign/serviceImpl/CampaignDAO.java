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

	public CampaignVO selectOneCampaign(CampaignVO campaign) {
		return mybatis.selectOne("campaign.selectOneCampaign", campaign.getcIdx());
	}
	
	public List<CampaignVO> selectAllCampaign() {
		System.out.println("CampaignDAO - selectAllCampaign 실행 >> ");
		return mybatis.selectList("campaign.selectAllCampaign");
	}
	
	public List<CampaignUserVO> selectAllUsers(){
		return mybatis.selectList("campaign.selectAllusers");
	}
	
	public int updateExpiredCampaign() {
		return mybatis.update("campaign.updateExpiredCampaign");
	}
}
