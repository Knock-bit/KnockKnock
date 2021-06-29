package com.knockknock.campaign.ing.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.ing.CampaignService;
import com.knockknock.campaign.ing.CampaignUserVO;
import com.knockknock.campaign.ing.CampaignVO;

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
	public void updateExpiredCampaign() {
		campaignDAO.updateExpiredCampaign();
	}

}
