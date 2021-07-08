package com.knockknock.campaign.campaign.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.campaign.CampaignUserVO;
import com.knockknock.campaign.campaign.CampaignVO;

@Repository
public class CampaignDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public CampaignVO selectOneCampaign(CampaignVO campaign) {
		return mybatis.selectOne("campaign.selectOneCampaign", campaign.getCiIdx());
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

	public List<CampaignVO> selectAllEdCampaign() {
		return mybatis.selectList("campaign.selectAllEdCampaign");
	}

	public List<CampaignVO> selectCampaignListLatest() {
		return mybatis.selectList("campaign.selectCampaignListLatest");
	}
	
	public List<CampaignVO> selectCampaignListUserCount() {
		return mybatis.selectList("campaign.selectCampaignListUserCount");
	}

	public int insertCampaign(CampaignVO campaign) {
		return mybatis.insert("campaign.insertCampaign", campaign);
	}

	public int insertCampaignRank(int ciIdx) {
		return mybatis.insert("campaign.insertCampaignRank", ciIdx);
	}

	public int updateCampaignPoint(int ciIdx) {
		mybatis.update("campaign.updateCampaignPointFirst", ciIdx);
		mybatis.update("campaign.updateCampaignPointSecond", ciIdx);
		mybatis.update("campaign.updateCampaignPointThird", ciIdx);
		mybatis.update("campaign.updateCampaignPointRest", ciIdx);
		return mybatis.update("campaign.updateCampaignDistributed", ciIdx);
	
	}

	public int selectExpiredCampaign() {
		return mybatis.selectOne("campaign.selectExpiredCampaign");
	}

	public CampaignUserVO selectCampaignUser(CampaignUserVO cUser) {
		return mybatis.selectOne("campaign.selectCampaignUser");
	}

	public int updateStartCampaign() {
		return mybatis.update("campaign.updateStartCampaign");
	}

	public List<CampaignVO> selectInputResult(String input) {
		return  mybatis.selectList("campaign.selectInputResult", input);
	}
}
