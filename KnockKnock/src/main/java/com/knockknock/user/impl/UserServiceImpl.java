package com.knockknock.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.user.UserService;
import com.knockknock.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO selectlogin(UserVO vo) {
		System.out.println("selectlogin 시작()");
		return userDAO.selectlogin(vo);
	}
}