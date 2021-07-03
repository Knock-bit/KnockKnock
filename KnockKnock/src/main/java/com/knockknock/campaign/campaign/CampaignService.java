package com.knockknock.campaign.campaign;

import java.util.List;

public interface CampaignService {
	// 진행중인 캠페인 리스트 불러오기
	public List<CampaignVO> selectCampaignList();
	// 진행중인 캠페인 상세보기
	public CampaignVO selectOneCampaign(CampaignVO campaign);
	// 종료된 리스트 불러오기
	public List<CampaignVO> selectCampaignEdList();
	// 캠페인 참여자 리스트 불러오기
	public List<CampaignUserVO> selectAllCampaignUsers(int cIdx);
	// 종료시간 지난 캠페인 만료처리
	public int updateExpiredCampaign();
	public List<CampaignVO> selectCampaignListLatest();
	public List<CampaignVO> selectCampaignListUserCount();
	public int insertCampaign(CampaignVO campaign);
	public int insertCampaignRank(int ciIdx);
	public int updateCampaignPoint(int ciIdx);
	public int selectExpiredCampaign();
	
	
}
