package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO selectlogin(UserVO vo) {
		System.out.println("BoardDAO mybatis() 생성");
		vo = mybatis.selectOne("UserVO.selectlogin", vo);
		System.out.println(vo);
		return vo;		
	}
}
