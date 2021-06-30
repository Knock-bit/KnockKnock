package com.knockknock.user;

public interface UserService {

	public UserVO selectlogin(UserVO vo);
	public int idCheck(String id);
	public int emailCheck(String email);
	public int nickCheck(String nickname);
	public void join(UserVO vo);

	public UserVO kakaoLogin(UserVO vo);
}