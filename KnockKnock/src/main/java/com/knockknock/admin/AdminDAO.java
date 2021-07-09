package com.knockknock.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
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
	
	// 키워드 추가 
	public int insertKeyword(AdminKeywordVO kvo) {
		System.out.println("AdminDAO > insertKeyword()");
		return mybatis.insert("AdminDAO.insertKeyword",kvo);
	}
	
	// 키워드 중복 검색
	public int checkKeyword(AdminKeywordVO kvo) {
		System.out.println("AdminDAO > checkKeyword");
		return mybatis.selectOne("AdminDAO.checkKeyword",kvo);
	}
	
	// 키워드 삭제
	public int deleteKeyword(List<String> content) {
		System.out.println("DAO" + content);
		return mybatis.delete("AdminDAO.deleteKeyword", content);
	}
	// 키워드 전체 가져오기 
	public List<AdminKeywordVO> getKeywordAll() {
		return mybatis.selectList("AdminDAO.getKeywordAll");
	}

	public int countCampaignCategory() {
		return mybatis.selectOne("Util.countCampaignCategory");
	}

	public List<AdminCampaignCategoryVO> getCampaignCategoryList(PagingVO pvo) {
		return mybatis.selectList("Util.getCampaignCategoryList",pvo);
	}

	public int insertCampaignCategory(AdminCampaignCategoryVO vo) {
		return mybatis.insert("AdminDAO.addCampaignCategory", vo);
	}

	public int checkCampaignCategory(AdminCampaignCategoryVO vo) {
		return mybatis.selectOne("AdminDAO.checkCampaignCategory", vo);
	}

	public int deleteCampaingCategory(List<String> content) {
		return mybatis.delete("AdminDAO.deleteCampaignCategory", content);
	}

	public List<AdminCampaignVO> getCampaignList(PagingVO pvo) {
		return mybatis.selectList("Util.getCampaignList", pvo);
	}

	public int countCampaign() {
		return mybatis.selectOne("Util.countCampaign");
		}

	public AdminCampaignVO getCampaign(AdminCampaignVO vo) {
		return mybatis.selectOne("AdminDAO.getCampaign",vo);
	}
	
	public List<AdminContactCategory> getContactCategory(PagingVO pvo){
		return mybatis.selectList("Util.getCampaignList",pvo);
	}
}
