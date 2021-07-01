package com.knockknock.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.util.PagingVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	
	public AdminServiceImpl() {
		System.out.println(">> AdmainServiceImpl() 객체 생성");
	}

	@Override
	public List<AdminUserVO> getUserList() {
		System.out.println("getUserListImpl");
		return adminDAO.getUserList();
	}

	@Override
	public void getUserList(AdminUserVO vo) {
		System.out.println(">> Impl : getUserList(UserVO vo)");		
	}

	@Override
	public AdminUserVO getUser(AdminUserVO vo) {
		System.out.println(">> Impl : getUser(UserVO vo)");
		return adminDAO.getUser(vo);
		
	}

	@Override
	public void updateUserActive(AdminUserVO vo) {
		System.out.println(">> Impl : updateUserActive");
		adminDAO.updateUserActive(vo);
	}

	@Override
	public int countUser() {
		return adminDAO.countUser();
	}

	@Override
	public List<AdminUserVO> getUserList(PagingVO pvo) {
		return adminDAO.getUserList(pvo);
	}

	@Override
	public int countKeyword() {
		return adminDAO.countKeyword();
	}

	@Override
	public List<AdminKeywordVO> getKeywordList(PagingVO pvo) {
		return adminDAO.getKeywordList(pvo);
	}

	@Override
	public int insertKeyword(AdminKeywordVO kvo) {
		return adminDAO.insertKeyword(kvo);
	}

	@Override
	public int checkKeyword(AdminKeywordVO kvo) {
		System.out.println(">> Impl : checkKeyword");

		return adminDAO.checkKeyword(kvo);
	}

	@Override
	public int deleteKeyword(List<String> content) {
		return adminDAO.deleteKeyword(content);
	}

	@Override
	public int insertSummer(AdminSummerVO vo) {
		return adminDAO.insertSummber(vo);
	}

}
