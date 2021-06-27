package com.knockknock.campaign.funding;

import java.util.List;

public interface FundingService {
	// 펀딩중인 캠페인 리스트 불러오기
	List<FundingVO> selectFundingList();
	// 펀딩중인 캠페인 상세보기
	FundingVO selectOneFunding(FundingVO funding);
	// 종료시간 지난 펀딩 만료처리
	void updateExpiredFunding();
}
