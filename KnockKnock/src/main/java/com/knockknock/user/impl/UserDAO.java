package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.knockknock.user.UserVO;

public class UserDAO {
	private SqlSessionTemplate mybatis;
	
	public int selectlogin(String uId) {
		
		return mybatis.selectOne("UserVO.selectOneUser", uId);
	}
}
