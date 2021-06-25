package com.knockknock.admin;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	private AdminDAO adminDAO;
	
	@Override
	public List<UserVO> getUserList() {
		System.out.println("getUserListImpl");
		return adminDAO.getUserList();
	}

	@Override
	public void getUserList(UserVO vo) {
		System.out.println(">> Impl : getUserList(UserVO vo)");		
	}

}
