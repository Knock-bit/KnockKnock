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
	
	// 유저 활성상태 변경 
	public void updateUserActive(AdminUserVO vo) {
		System.out.println("AdminDAO > updateUserActive(UserVO vo)실행");
		mybatis.update("AdminDAO.updateUserActive", vo);
	}
	
	// 페이징 처리, USERS 컬럼 갯수 출력
	public int countUser() {
		System.out.println("AdminDAO > countUser()");
		return mybatis.selectOne("Util.countUser");
	}
	
	
	// 페이징 처리한 유저 수 출력
	public List<AdminUserVO> getUserList(PagingVO pvo){
		System.out.println("AdminDAO > getUserList(PagingVO vo)");
		return mybatis.selectList("Util.getUserList",pvo);
	}
	
	// 페이징처리, keyword 컬럼 갯수 출력
	public int countKeyword() {
		System.out.println("AdminDAO > countKeyword()");
		return mybatis.selectOne("Util.countKeyword");
	}
	
	// 키워드 리스트 출력
	public List<AdminKeywordVO> getKeywordList(PagingVO pvo){
		System.out.println("AdminDAO > getKeywordList()");
		return mybatis.selectList("Util.getKeywordList",pvo);
	}
}
