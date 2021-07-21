package com.knockknock.campaign.campaign;

import java.util.HashMap;
import java.util.List;

public interface CampaignService {
	// 진행중인 캠페인 리스트 불러오기
	public List<CampaignVO> selectCampaignList();
	// 진행중인 캠페인 상세보기
	public CampaignVO selectOneCampaign(CampaignVO campaign);
	// 진행중인 캠페인 상세보기 by ciIdx
	public CampaignVO selectOneCampaign(int ciIdx);
	// 종료된 리스트 불러오기
	public List<CampaignVO> selectCampaignEdList();
	// 캠페인 참여자 리스트 불러오기
	public List<CampaignUserVO> selectAllCampaignUsers(int cIdx);
	// 종료시간 지난 캠페인 만료처리
	public int updateExpiredCampaign();
	// 캠페인 최신순 정렬
	public List<CampaignVO> selectCampaignListLatest();
	// 캠페인 참여자수순 정렬
	public List<CampaignVO> selectCampaignListUserCount();
	// 캠페인 등록
	public int insertCampaign(CampaignVO campaign);
	// 캠페인 랭킹 등록
	public int insertCampaignRank(int ciIdx);
	// 캠페인 포인트 업데이트
	public int updateCampaignPoint(int ciIdx);
	// 종료된 캠페인 선택
	public int selectExpiredCampaign();
	// 캠페인 유저 - 참여 or 미참여
	public CampaignUserVO selectCampaignUser(CampaignUserVO cUser);
	//캠페인 시작
	public int updateStartCampaign();
	// 캠페인 검색
	public List<CampaignVO> selectInputResult(String input);
	// 캠페인 참여에 따른 포인트 차감
	public int updateParticipatePoint(CampaignUserVO cUser);
	// 캠페인 유저에 등록
	public int insertCampaignUser(CampaignUserVO cUser);
	// 해쉬태그 사용, 비슷한 캠페인 목록 불러오기
	public List<CampaignVO> selectRecommendCampaign(CampaignVO campaign);
	// 조회기준 적용하여 캠페인 목록 불러오기
	public List<CampaignVO> selectCampaignListOrderBy(HashMap<String, String> orderBy);
}
