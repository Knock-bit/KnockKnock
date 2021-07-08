package com.knockknock.campaign.campaign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.campaign.CampaignService;
import com.knockknock.campaign.campaign.CampaignUserVO;
import com.knockknock.campaign.campaign.CampaignVO;

@Service("campaignService")
public class CampaignServiceimpl implements CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
	@Autowired
	private CampaignUserDAO campaignUserDAO;
	
	
	@Override
	public List<CampaignVO> selectCampaignList() {
		System.out.println("campaignServiceImpl 실행");
		return campaignDAO.selectAllCampaign();
	}

	@Override
	public CampaignVO selectOneCampaign(CampaignVO campaign) {
		System.out.println("serviceImpl>> selectOneCampaign실행");
		return campaignDAO.selectOneCampaign(campaign);
	}

	@Override
	public List<CampaignUserVO> selectAllCampaignUsers(int ciIdx) {
		System.out.println("serviceImpl>> selectAllCampaignUsers실행");		
		return campaignUserDAO.selectAllCampaignUsers(ciIdx);
	}

	@Override
	public int updateExpiredCampaign() {
		return campaignDAO.updateExpiredCampaign();
	}

	@Override
	public List<CampaignVO> selectCampaignEdList() {
		return campaignDAO.selectAllEdCampaign();
	}

	@Override
	public List<CampaignVO> selectCampaignListLatest() {
		return campaignDAO.selectCampaignListLatest();
	}

	@Override
	public List<CampaignVO> selectCampaignListUserCount() {
		return campaignDAO.selectCampaignListUserCount();
	}

	@Override
	public int insertCampaign(CampaignVO campaign) {
		return campaignDAO.insertCampaign(campaign);
	}

	

	@Override
	public int selectExpiredCampaign() {
		return campaignDAO.selectExpiredCampaign();
	}

	@Override
	public int insertCampaignRank(int ciIdx) {
		return campaignDAO.insertCampaignRank(ciIdx);
	}

	@Override
	public int updateCampaignPoint(int ciIdx) {
		return campaignDAO.updateCampaignPoint(ciIdx);
	}

	@Override
	public CampaignUserVO selectCampaignUser(CampaignUserVO cUser) {
		return campaignDAO.selectCampaignUser(cUser);
	}

	@Override
	public int updateStartCampaign() {
		return campaignDAO.updateStartCampaign();
	}

	@Override
	public List<CampaignVO> selectInputResult(String input) {
		return campaignDAO.selectInputResult(input);
	}

}
