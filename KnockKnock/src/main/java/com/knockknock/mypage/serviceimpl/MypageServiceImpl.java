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

}
