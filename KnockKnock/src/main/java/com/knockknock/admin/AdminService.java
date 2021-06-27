package com.knockknock.admin;

import java.util.List;

import com.knockknock.util.PagingVO;

public interface AdminService {
	// 기능 구현 메소드 정의
	List<AdminUserVO> getUserList();
	// UserVO에 searchKeyword(검색조건용 필드) 추가해서 사용할 경우 vo를 받는다.
	void getUserList(AdminUserVO vo);  
	AdminUserVO getUser(AdminUserVO vo);
	void updateUserActive(AdminUserVO vo);
	// user count 가져오기
	public int countUser();
	// 페이징 처리 user조회
	public List<AdminUserVO> getUserList(PagingVO pvo);
}
