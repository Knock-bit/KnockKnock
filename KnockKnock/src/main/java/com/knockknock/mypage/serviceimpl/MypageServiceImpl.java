package com.knockknock.mypage.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.mypage.MypageService;
import com.knockknock.user.UserVO;

@Service("userService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	// 유저 정보 임시로 가져오기 
	@Override
	public UserVO selelctOneUser(String id) {
		
		return mypageDAO.selectOneUser(id);
	}

}
