package com.knockknock.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.user.UserService;
import com.knockknock.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO selectlogin(UserVO vo) {
		return userDAO.selectlogin(vo);
	}

	@Override
	public int idCheck(String id) {
		return userDAO.idCheck(id);
	}

	@Override
	public int nickCheck(String nickname) {
		return userDAO.nickCheck(nickname);
	}

	@Override
	public int emailCheck(String email) {
		return userDAO.emailCheck(email);
	}

	@Override
	public void join(UserVO vo) {
		userDAO.join(vo);
	}

	@Override
	public UserVO kakaoLogin(UserVO vo) {
		System.out.println("UserServiceImpl에 받은 값: "+userDAO.kakaologin(vo));
		return userDAO.kakaologin(vo);
	}

}