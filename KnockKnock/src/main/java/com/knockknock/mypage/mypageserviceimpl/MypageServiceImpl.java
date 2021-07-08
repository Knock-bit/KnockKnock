
package com.knockknock.mypage.mypageserviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.board.BoardVO;
import com.knockknock.campaign.campaign.CampaignVO;
import com.knockknock.contact.ContactVO;
import com.knockknock.mypage.MypageService;
import com.knockknock.user.UserVO;
import com.knockknock.util.PointVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	// 정보가져오기(임시)
	@Override
	public UserVO selectOneUser(int uIdx) {
		
		return mypageDAO.selectOneUser(uIdx);
	}
	
	
	// 유저 정보 수정(업데이트)
	@Override
	public int updateMyInfo(UserVO vo) {

		return mypageDAO.updateMyInfo(vo);
	}
	// 이메일 중복검사
	@Override
	public int emailCheck(String email){
		
		return mypageDAO.emailCheck(email);
	}
	
	// 비밀번호 수정
	@Override
	public int updateMyPwd(UserVO vo) {
		
		return mypageDAO.updateMyPwd(vo);
	}
	
	// 유저의 엠블럼 목록 가져오기
	@Override
	public List<String> emblemList(UserVO vo){
		
		return mypageDAO.emblemList(vo);
	}
	
	// 유저의 진행중 캠페인 리스트 가져오기
	@Override
	public List<CampaignVO> campaigningList(UserVO vo){
		
		return mypageDAO.campaigningList(vo);
	}

	// 유저의 종료된 캠페인 리스트 가져오기
	@Override
	public List<CampaignVO> endCampaignList(UserVO vo){
		
		return mypageDAO.endCampaignList(vo);
	}
	
	// 나의 문의내역 페이지
	@Override
	  public List<ContactVO> myContactList(Map<String, Integer> map) {
	  
	  return mypageDAO.myContactList(map); 
	  };
		 
	
	// 내 문의내역 총 게시글 수
	@Override
	public int myCclistTot(UserVO vo) {
		
		return mypageDAO.myCclistTot(vo);
	}
	
	// 나의 문의내역 상세보기
	@Override
	public ContactVO myQuestion(Map<String, Integer> map) {
		
		return mypageDAO.myQuestion(map);	
	}
	
	// 나의 활동
	@Override
	public List<BoardVO> myActive(UserVO vo){
		
		return mypageDAO.myActive(vo);
	}
	
	// 나의 포인트 리스트
	@Override
	public List<PointVO> myPointList(UserVO vo){
		
		return mypageDAO.myPointList(vo);
	}

	// 회원 탈퇴
	@Override
	public int deleteUsers(int uIdx) {

		return mypageDAO.deleteUsers(uIdx);
	}
}
