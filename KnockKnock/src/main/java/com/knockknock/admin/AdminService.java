package com.knockknock.admin;

import java.util.List;

public interface AdminService {
	// 기능 구현 메소드 정의
	List<UserVO> getUserList();
	// UserVO에 searchKeyword(검색조건용 필드) 추가해서 사용할 경우 vo를 받는다.
	void getUserList(UserVO vo);  
}
