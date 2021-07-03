package com.knockknock.mypage;


import java.util.List;
import java.util.Map;

import com.knockknock.board.BoardVO;
import com.knockknock.campaign.campaign.CampaignVO;
import com.knockknock.contact.ContactVO;
import com.knockknock.user.UserVO;

public interface MypageService {
	
	// 유저 정보 임시로 가져오기
	UserVO selectOneUser(int uIdx);
	// 유저 정보 수정(업데이트)
	int updateMyInfo(UserVO vo);
	// 이메일 체크
	int emailCheck(String email);
	// 비밀번호 수정
	int updateMyPwd(UserVO vo);
	// 유저의 엠블럼 목록 가져오기
	List<String> emblemList(UserVO vo);
	// 유저의 진행중 캠페인 리스트 가져오기
	List<CampaignVO> campaigningList(UserVO vo);
	// 종료된 캠페인 리스트
	List<CampaignVO> endCampaignList(UserVO vo);
	// 내 문의내역 
	//List<ContactVO> myContactList(UserVO vo);
	// 문의내역 총 게시글 수
	int myCclistTot(UserVO vo);
	// 문의내역 총 게시글 수
	List<ContactVO> myContactList(Map<String, Integer> map);
	// 문의내역 상세보기
	ContactVO myQuestion(Map<String, Integer> map);
	// 나의 활동
	List<BoardVO> myActive(UserVO vo);
	

}
