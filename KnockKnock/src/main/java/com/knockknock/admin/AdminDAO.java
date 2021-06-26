package com.knockknock.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminDAO() {
		System.out.println("AdminDAO 생성자 추가 ");
	}
	
	public List<UserVO> getUserList(UserVO vo){
		System.out.println("AdminDAO getUserList(UserVO) 실행");
		return mybatis.selectList("AdminDAO.getUserList",vo);
	}
	
	public List<UserVO> getUserList(){
		System.out.println("AdminDAO getUserList() 실행");
		return mybatis.selectList("AdminDAO.getUserList");
	}
}
