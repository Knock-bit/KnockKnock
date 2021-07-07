
package com.knockknock.mypage.mypageserviceimpl;

import java.util.List; 
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.board.BoardVO;
import com.knockknock.campaign.campaign.CampaignVO;
import com.knockknock.campaign.funding.FundingVO;
import com.knockknock.campaign.proposal.ProposalVO;
import com.knockknock.contact.ContactVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.PointVO;

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
	// 이메일 중복검사
	public int emailCheck(String email) {
			System.out.println("받아오는 값 : " + email);
			String uEmail = mybatis.selectOne("UserVO.emailCheck", email);
			System.out.println("uEmail : " + uEmail);
			int result;
			if(uEmail==null) {
				result=1;  //이메일 사용가능
			}else {
				result=0; //이메일 사용불가(중복)
			}
			
			return result;
		}
	
	
	// 비밀번호 수정
	public int updateMyPwd(UserVO vo) {
		
		int result = mybatis.update("UserVO.updateMyPwd", vo);
		System.out.println("dao result:" + result);
		
		return result;
	}
	
	// 유저의 엠블럼 목록 가져오기
	public List<String> emblemList(UserVO vo){
		
		return mybatis.selectList("UserVO.userEmblemList",vo);
	}
	// 유저으 ㅣ진행중인 캠페인 리스트 가져오기
	public List<CampaignVO> campaigningList(UserVO vo) {
		
		
		return mybatis.selectList("UserVO.userCamingList",vo);
	}
	
	// 유저의 종료된 캠페인 리스트 가져오기
	public List<CampaignVO> endCampaignList(UserVO vo) {
		
		
		return mybatis.selectList("UserVO.endCampaignList",vo);
	}
	
	// 내 문의내역 페이지
	 public List<ContactVO> myContactList(Map<String, Integer> map){
		 List<ContactVO> list = mybatis.selectList("UserVO.myCcList", map);
		 System.out.println("list: " + list); System.out.println("map : " + map);
	 return list; 
	 }
	 
	
	// 내 문의내역 총 게시글 수
	public int myCclistTot(UserVO vo) {
		
		return mybatis.selectOne("UserVO.myCcListTotalCount", vo);
	}
	
	// 내 문의내역 상세보기
	public ContactVO myQuestion(Map<String, Integer> map) {
		
		return mybatis.selectOne("UserVO.myQuestionPage", map);
	}
	
	// 나의 활동일지
	public List<BoardVO> myActive(UserVO vo) {

		return mybatis.selectList("UserVO.myActive", vo);
	}
	// 나의 포인트 내역
	public List<PointVO> myPointList(UserVO vo) {

		return mybatis.selectList("UserVO.myPointList", vo);
	}
	// 회원 탈퇴
	public int deleteUsers(int uIdx) {

		return mybatis.delete("UserVO.deleteUsers", uIdx);
	}
	
	// 나의 제안글 총 글 갯수
	public int myplistTot(UserVO vo) {

		return mybatis.selectOne("UserVO.myPcListTotalCount", vo);
	}
	// 나의 제안글 리스트
	public List<ProposalVO> myProposalList(Map<String, Integer> map) {
		List<ProposalVO> list = mybatis.selectList("UserVO.mypList", map);
		
	 return list;
	}
	

}
