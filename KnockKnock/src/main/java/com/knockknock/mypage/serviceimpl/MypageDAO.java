package com.knockknock.mypage.serviceimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;

@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 정보 가져오기(임시)
	public UserVO selectOneUser(int uIdx) {
		
		return mybatis.selectOne("UserVO.selectOneUser", uIdx);
	}
	// 내 정보 수정(업데이트)
	public int updateMyInfo(UserVO vo) {
		
		return mybatis.update("UserVO.updateMyInfo", vo);
	}
	
	// 비밀번호 수정
	public int updateMyPwd(UserVO vo) {
		System.out.println("uPwd: " + vo.getuPwd());
		
		int result = mybatis.update("UserVO.updateMyPwd", vo);
		System.out.println("dao result:" + result);
		
		return result;
	}

}
