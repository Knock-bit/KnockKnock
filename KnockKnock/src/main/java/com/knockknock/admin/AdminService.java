package com.knockknock.admin;

import java.util.List;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.PagingVO;

public interface AdminService {
	// 기능 구현 메소드 정의
	List<AdminUserVO> getUserList();
	// UserVO에 searchKeyword(검색조건용 필드) 추가해서 사용할 경우 vo를 받는다.
	void getUserList(AdminUserVO vo);  
	AdminUserVO getUser(AdminUserVO vo);
	public void updateUserActive(AdminUserVO vo);
	public int countUser();  	// user count 가져오기
	public List<AdminUserVO> getUserList(PagingVO pvo); 	// 페이징 처리 user조회
	public int countKeyword();  // keyword count 가져오기 
	public List<AdminKeywordVO> getKeywordList(PagingVO pvo);	// 페이징 처리 keyword 조회
	public int insertKeyword(AdminKeywordVO kvo);  // keyword 추가
	public int checkKeyword(AdminKeywordVO kvo);   // 이미 존재하는 키워드인지 확인 
	public int deleteKeyword(List<String> content);  // 키워드 삭제 
	public List<AdminKeywordVO> getKeywordAll();  // 모든 키워드 불러오기
	public int countCampaignCategory();  // 캠페인 카테고리 count 가져오기
	public List<AdminCampaignCategoryVO> getCampaignCategoryList(PagingVO pvo);  // 페이징처리 캠페인 카테고리 조회
	public int insertCampaign(AdminCampaignVO vo); // 펀딩에서 캠페인 추가
	public int insertCampaignCategory(AdminCampaignCategoryVO vo);	// 캠페인 카테고리 추가 
	public int checkCampaignCategory(AdminCampaignCategoryVO vo);	// 캠페인 카테고리 중복 체
	public int deleteCampaingCategory(List<String> content);	// 캠페인 카테고리 제거
	public List<AdminCampaignVO> getCampaignList(PagingVO pvo);
	public int countCampaign();
	public AdminCampaignVO getCampaign(AdminCampaignVO vo);
	
	// ========= contact ==========
	public List<AdminContactVO> getContactList(PagingVO pvo);
	public int countContact();
	public AdminContactVO getContactDetail(AdminContactVO vo);
	public void sendEmail(AdminContactVO vo, String content) throws Exception;
	public int insertComment(AdminContactCommentVO vo);
	public int updateCtResp(AdminContactVO vo);
	public List<AdminContactCommentVO> getCommentList(AdminContactVO vo);
	
	// ========= 스케쥴러 사용한 캠페인 시작 =============
	public void campaignStartEnd();
	public void fundingStartEnd();
}
