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
	// 펀딩 유저 선택
	FundingUserVO selectFundingUser(FundingUserVO fundingUser);
	// 펀딩 유저 테이블에 등록
	int insertFundingUser(FundingUserVO fundingUser);
	// 펀딩의 collected point 연산 
	int updateFundingPoint(FundingUserVO fundingUser);
	// User table의 usedPoint 업데이트
	int updateUserFundingPoint(FundingUserVO fundingUser);
	// ---- 펀딩 취소 ----
	// 펀딩 유저 테이블에서 삭제
	int deleteFundingUser(FundingUserVO fundingUser);
	// 펀딩의 collected point 연산
	int updateFundingPointMinus(FundingUserVO fundingUser);
	// User table usedPoint 업데이트 
	int updateUserFundingPointMinus(FundingUserVO fundingUser);
	
	// 펀딩 성공 --> status 변경
	int updateSuccessFunding();
	int updateStartFunding();
}