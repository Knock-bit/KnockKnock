package com.knockknock.user.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.knockknock.user.UserService;
import com.knockknock.user.UserVO;

public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
 

	@Override
	public UserVO selectOneMember(UserVO vo) {
		//selectOneMember작성하기.
		return null;
	}
}