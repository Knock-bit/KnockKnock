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
	
	public int updateMyInfo(UserVO vo) {
		
		return mybatis.update("UserVO.updateMyInfo", vo);
	}

}
