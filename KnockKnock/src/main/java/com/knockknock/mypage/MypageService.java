package com.knockknock.mypage;

import java.util.List;

import com.knockknock.user.UserVO;

public interface MypageService {
	
	// 유저 정보 임시로 가져오기
	UserVO selectOneUser(int uIdx);
	// 유저 정보 수정(업데이트)
	int updateMyInfo(UserVO vo);
	// 이메일 목록 가져오기
	List<UserVO> selectAllEmail();
	// 비밀번호 수정
	int updateMyPwd(UserVO vo);

}
