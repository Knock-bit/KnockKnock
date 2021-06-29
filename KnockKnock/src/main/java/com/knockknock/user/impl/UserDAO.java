package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	//로그인
	public UserVO selectlogin(UserVO vo) {
		vo = mybatis.selectOne("UserVO.selectlogin", vo);
		return vo;		
	}
	//아이디 중복체크
	public int idCheck(String id) {
		String uId = mybatis.selectOne("UserVO.idCheck", id);
		int result;
		if(uId==null) {
			result = 1; //아이디 사용가능
		}else {
			result = 0; //아이디 사용불가
		}
		return result;		
	}
	//이메일 중복체크
	public int emailCheck(String email) {
		String uEmail = mybatis.selectOne("UserVO.emailCheck", email);
		
		int result;
		if(uEmail==null) {
			result=1;  //이메일 사용가능
		}else {
			result=0; //이메일 사용불가(중복)
		}
		return result;
	}
	//회원가입
	public void join(UserVO vo) {
		mybatis.insert("UserVO.join", vo);
	}
}
