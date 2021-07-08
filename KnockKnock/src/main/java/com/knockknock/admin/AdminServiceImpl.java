package com.knockknock.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.util.PagingVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

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
	public List<AdminKeywordVO> getKeywordAll() {
		return adminDAO.getKeywordAll();
	}

	@Override
	public int countCampaignCategory() {
		return adminDAO.countCampaignCategory();
	}

	@Override
	public List<AdminCampaignCategoryVO> getCampaignCategoryList(PagingVO pvo) {
		return adminDAO.getCampaignCategoryList(pvo);
	}

	@Override
	public int insertCampaignCategory(AdminCampaignCategoryVO vo) {
		return adminDAO.insertCampaignCategory(vo);
	}

	@Override
	public int checkCampaignCategory(AdminCampaignCategoryVO vo) {
		return adminDAO.checkCampaignCategory(vo);
	}

	@Override
	public int deleteCampaingCategory(List<String> content) {
		return adminDAO.deleteCampaingCategory(content);
	}

	@Override
	public List<AdminCampaignVO> getCampaignList(PagingVO pvo) {
		return adminDAO.getCampaignList(pvo);
	}

	@Override
	public int countCampaign() {
		return adminDAO.countCampaign();
	}

	@Override
	public AdminCampaignVO getCampaign(AdminCampaignVO vo) {
		return adminDAO.getCampaign(vo);
	}

	@Override
	public List<AdminContactCategory> getContactCategory(PagingVO pvo) {
		return adminDAO.getContactCategory(pvo);
	}

}
