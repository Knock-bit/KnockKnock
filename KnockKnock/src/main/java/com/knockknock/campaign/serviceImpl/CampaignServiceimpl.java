package com.knockknock.campaign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.CampaignService;
import com.knockknock.campaign.CampaignUserVO;
import com.knockknock.campaign.CampaignVO;

@Service("campaignService")
public class CampaignServiceimpl implements CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
	
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
	public CampaignUserVO selectCampaignUserList(int cIdx) {
		// TODO Auto-generated method stub
		return null;
	}

}
