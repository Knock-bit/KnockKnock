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
		vo = mybatis.selectOne("UserVO.selectlogin", vo);
		System.out.println(vo);
		return vo;		
	}
	
//	public int idCheck(String uId) {
//		uId = mybatis.selectOne("vo.idCheck", uId);
//		int result;
//		if(uId==null) {
//			result = 1;
//			System.out.println("아이디 없음");
//		}else {
//			result = -1;
//			System.out.println("아이디 있음->사용불가");
//		}
//		System.out.println("U");
//		return result;
//		
//	}
}
