package com.knockknock.campaign.funding;

import java.util.List;

public interface FundingService {
	// 펀딩중인 캠페인 리스트 불러오기
	List<FundingVO> selectAllFunding();
	// 펀딩중인 캠페인 상세보기
	FundingVO selectOneFunding(FundingVO funding);
	// 펀딩중인 캠페인 참여자 목록 보기
	List<FundingUserVO> selectAllFundingUsers(int cfIdx);
	// 종료시간 지난 펀딩 만료처리
	int updateExpiredFunding();
	int insertFundingUser(FundingUserVO fundingUser);
	int updateFundingPoint(FundingUserVO fundingUser);
	FundingUserVO selectFundingUser(FundingUserVO fundingUser);
}
