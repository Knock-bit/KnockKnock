package com.knockknock.admin;

import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.admin.funding.AdminCampaignCategoryVO;
import com.knockknock.user.UserVO;
import com.knockknock.user.impl.UserPwdEmail;
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
	public List<AdminContactVO> getContactList(PagingVO pvo) {
		return adminDAO.getContactList(pvo);
	}

	@Override
	public int countContact() {
		return adminDAO.countContact();
	}

	@Override
	public AdminContactVO getContactDetail(AdminContactVO vo) {
		return adminDAO.getContact(vo);
	}

	@Override
	public void sendEmail(AdminContactVO vo, String content) throws Exception {
		System.out.println("sendEmail content >> " + content);
		// Mail Server 설정
		UserPwdEmail email1 = new UserPwdEmail();
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = email1.hostSMTPid;
		String hostSMTPpwd = email1.hostSMTPpwd;
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "knockadmin@knock.com";
		String fromName = "Knock!Knock!";
		String subject = "[綠!Knock!] 문의하신 내역에 대한 답변입니다.";
		String msg = "";

		msg += "<div align='center' style='border:1px solid rgb(184, 180, 180); font-family: Noto Sans KR'>";
		msg += "<h1 style='color: rgb(10, 61, 14);'>綠!Knock! "  +vo.getuNickname()+"님이 문의하신 내용에 답변이 달렸습니다.</h1>";
		msg += "  <table>\n"
				+ "    <tr>\n"
				+ "    	<td style='font-weight:bold'>문의 내용 : </td>\n"
				+ "      	<td>" +vo.getCtContent() +"</td>\n"
				+ "    </tr>\n"
				+ "        <tr>\n"
				+ "    	<td style='font-weight:bold'>답변 : </td>\n"
				+ "      	<td>" + content + "</td>\n"
				+ "    </tr>\n"
				+ "    \n"
				+ "  </table>";
		msg += "항상 저희 [綠!Knock!]을 이용해주셔서 감사합니다.<br></div>";

		// 받는 사람 E-Mail 주소
		String mail = vo.getuEmail();
		System.out.println("받는사람 이메일주소 = " + mail);
		System.out.println("hostSMTP = " + hostSMTP);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public int insertComment(AdminContactCommentVO vo) {
		return adminDAO.insertComment(vo);
	}

	@Override
	public int updateCtResp(AdminContactVO vo) {
		return adminDAO.updateCtResp(vo);
	}

	@Override
	public List<AdminContactCommentVO> getCommentList(AdminContactVO vo) {
		return adminDAO.getCommentList(vo);
	}
}
