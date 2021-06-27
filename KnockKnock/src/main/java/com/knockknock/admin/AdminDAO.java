package com.knockknock.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.util.PagingVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminDAO() {
		System.out.println("AdminDAO 생성자 추가 ");
	}
	
	public List<AdminUserVO> getUserList(AdminUserVO vo){
		System.out.println("AdminDAO getUserList(UserVO) 실행");
		return mybatis.selectList("AdminDAO.getUserList",vo);
	}
	
	public List<AdminUserVO> getUserList(){
		System.out.println("AdminDAO getUserList() 실행");
		return mybatis.selectList("AdminDAO.getUserList");
	}
	
	public AdminUserVO getUser(AdminUserVO vo) {
		System.out.println("AdminDAO > getUser(UserVO vo) 실행 ");
		return mybatis.selectOne("AdminDAO.getUser", vo);
	}
	
	public void updateUserActive(AdminUserVO vo) {
		System.out.println("AdminDAO > updateUserActive(UserVO vo)실행");
		mybatis.update("AdminDAO.updateUserActive", vo);
	}
	
	public int countUser() {
		System.out.println("AdminDAO > countUser()");
		return mybatis.selectOne("Util.countUser");
	}
	
	public List<AdminUserVO> getUserList(PagingVO pvo){
		System.out.println("AdminDAO > getUserList(PagingVO vo)");
		return mybatis.selectList("Util.getUserList",pvo);
	}
}
