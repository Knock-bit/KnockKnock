package com.knockknock.mypage.serviceimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;

@Repository
public class MypageDAO {
	
	private SqlSessionTemplate mybatis;
	
	// 유저 정보 임시로 가져오기 
	public UserVO selectOneUser(String id) {
		
		return mybatis.selectOne("MYPAGE.selectOneUser", id);
		
	}

}
