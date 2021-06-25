package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.knockknock.user.UserVO;

public class UserDAO {
	private SqlSessionTemplate mybatis;
	
	public int joinMember(UserVO vo) {
		
		return mybatis.insert("UserDAO.joinMember", vo);
	}
}
