package com.knockknock.mypage.serviceimpl;

import java.util.List;
import java.util.Map;

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
	// 이메일 목록 가져오기
	public List<String> selectAllEmail(){
	
		List<String> list = mybatis.selectList("UserVO.getEamilList");
		System.out.println("list : " + list);
		return list;
	}
	
	
	// 비밀번호 수정
	public int updateMyPwd(UserVO vo) {
		
		int result = mybatis.update("UserVO.updateMyPwd", vo);
		System.out.println("dao result:" + result);
		
		return result;
	}
	
	// 유저의 엠블럼 목록 가져오기
	public List<Map<String, Object>> emblemList(UserVO vo){
		
		return mybatis.selectList("UserVO.userEmblemList",vo);
	}

}
