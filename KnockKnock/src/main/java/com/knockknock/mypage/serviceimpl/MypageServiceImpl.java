package com.knockknock.mypage.serviceimpl;

import java.util.List;  
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.campaign.ing.CampaignVO;
import com.knockknock.mypage.MypageService;
import com.knockknock.user.UserVO;

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
	// 이메일 목록 가져오기
	@Override
	public List<String> selectAllEmail(){
		
		return mypageDAO.selectAllEmail();
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
	public List<CampaignVO> campaigningList(UserVO vo){
		
		return mypageDAO.campaigningList(vo);
	}

}
