package com.knockknock.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.knockknock.user.UserVO;

public class UserDAO {
	private SqlSessionTemplate mybatis;
	
	public UserVO selectlogin(String uId, String uPwd) {
		System.out.println("BoardDAO mybatis() 생성");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("uId", uId);
		map.put("uPwd", uPwd);
		
		System.out.println("map: "+map);
		
		return mybatis.selectOne("UserVO.selectOneUser", map);
		
	}
}
