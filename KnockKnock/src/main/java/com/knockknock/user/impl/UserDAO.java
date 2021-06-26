package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.knockknock.user.UserVO;

public class UserDAO {
	private SqlSessionTemplate mybatis;
	
	public UserVO selectlogin(UserVO vo) {
		System.out.println("BoardDAO mybatis() 생성");
		
		return mybatis.selectOne("UserVO.selectOneUser", vo);
		
	}
}
