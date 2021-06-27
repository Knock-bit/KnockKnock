package com.knockknock.campaign;

import java.util.List;

public interface CampaignService {
	// 진행중인 캠페인 리스트 불러오기
	List<CampaignVO> selectCampaignList();
	// 진행중인 캠페인 상세보기
	CampaignVO selectOneCampaign(CampaignVO campaign);
	// 캠페인 참여자 리스트 불러오기
	CampaignUserVO selectCampaignUserList(int cIdx);
	
	
	
}
