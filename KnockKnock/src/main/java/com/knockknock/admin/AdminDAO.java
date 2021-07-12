package com.knockknock.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.admin.funding.AdminFundingVO;
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
	
	public List<AdminContactVO> getContactList(PagingVO pvo){
		return mybatis.selectList("Util.getContactList",pvo);
	}

	public int countContact() {
		return mybatis.selectOne("Util.countContact");
	}

	public AdminContactVO getContact(AdminContactVO vo) {
		return mybatis.selectOne("AdminDAO.getContact", vo);
	}

	public int insertComment(AdminContactCommentVO vo) {
		return mybatis.insert("insertComment", vo);
	}

	public int updateCtResp(AdminContactVO vo) {
		return mybatis.update("updateCtResp",vo);
	}

	public List<AdminContactCommentVO> getCommentList(AdminContactVO vo) {
		return mybatis.selectList("getCommentList",vo);
	}
	
	// 페이징 처리 하지않고 캠페인 리스트 가져오기
	public List<AdminCampaignVO> getCampaignList(){
		return mybatis.selectList("AdminDAO.getCampaignList");
	}
	
	// 캠페인 시작상태로 변경하기
	public int updateCampaignStatus(AdminCampaignVO vo) {
		return mybatis.update("AdminDAO.updateCampaignStatus", vo);
	}
	
	// 캠페인 종료상태로 변경하기 
	public int updateCampaignStatusEnd(AdminCampaignVO vo) {
		return mybatis.update("AdminDAO.updateCampaignStatusEnd",vo);
	}
	
	// 페이징 처리 하지 않고 펀딩 리스트 가져오기
	public List<AdminFundingVO> getFundingList(){
		return mybatis.selectList("AdminDAO.getFundingList");
	}
	// 펀딩 시작상태로 변경하기
	public int updateFundingStatusStart(AdminFundingVO vo) {
		return mybatis.update("AdminDAO.updateFundingStatusStart", vo);
	}
	// 펀딩 종료상태로 변경하기 
	public int updateFundingStatusEnd(AdminFundingVO vo) {
		return mybatis.update("AdminDAO.updateFundingStatusEnd",vo);
	}
	// 펀딩 완료상태로 변경하기
	public int updateFundingStatusSuccess(AdminFundingVO vo) {
		return mybatis.update("AdminDAO.updateFundingStatusSuccess",vo);
	}
}
