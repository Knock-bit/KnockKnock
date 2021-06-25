package com.knockknock.mypage.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void updateMyInfo(UserVO vo) {
		
		mypageDAO.updateMyInfo(vo);
	}
	
	
	// 비밀번호 수정
	@Override
	public void updateMyPwd(UserVO vo) {
		
		mypageDAO.updateMyPwd(vo);
	}

}
