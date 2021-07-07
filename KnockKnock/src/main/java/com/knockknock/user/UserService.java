package com.knockknock.user;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface UserService { 

	public UserVO selectlogin(UserVO vo);
	public int idCheck(String id);
	public int emailCheck(String email);
	public int nickCheck(String nickname);
	public void join(UserVO vo);
	public UserVO kakaoLogin(UserVO vo);
	public UserVO googlelogin(UserVO vo);
	public void sendEmail(UserVO vo, String div) throws Exception;
	public void findPwd(HttpServletResponse resp, UserVO vo) throws Exception;
	public Map<String, String> readUserInfo(UserVO vo);
}