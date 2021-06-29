package com.knockknock.user;

public interface UserService {

	public UserVO selectlogin(UserVO vo);
	public int idCheck(String id);
	public int emailCheck(String email);
	public void join(UserVO vo);
	
}