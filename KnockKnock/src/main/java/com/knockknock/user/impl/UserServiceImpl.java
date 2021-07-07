package com.knockknock.user.impl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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
		System.out.println("UserServiceImpl에 받은 값: " + userDAO.kakaologin(vo));
		return userDAO.kakaologin(vo);
	}

	@Override
	public UserVO googlelogin(UserVO vo) {
		System.out.println("UserServiceImpl에 받은 값: " + userDAO.kakaologin(vo));
		return userDAO.googlelogin(vo);
	}

	@Override
	public void sendEmail(UserVO vo, String div) throws Exception {
		System.out.println("div "+div);
		// Mail Server 설정
		UserPwdEmail email1 = new UserPwdEmail();
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = email1.hostSMTPid;
		String hostSMTPpwd = email1.hostSMTPpwd;
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "knockadmin@knock.com";
		String fromName = "Knock!Knock!";
		String subject = "[綠!Knock!] 임시 비밀번호 발급 이메일입니다.";
		String msg = "";

		if (div.equals("findpwd")) { 
			subject = "綠!Knock!의 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getuId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getuPwd() + "</p>";
			msg += "로그인 하신 후 마이페이지에서 비밀번호를 변경해주시기 바랍니다.<br></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getuEmail();
		System.out.println("받는사람 이메일주소 = " +mail);
		System.out.println("hostSMTP = "+hostSMTP);
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
	public void findPwd(HttpServletResponse resp, UserVO vo) throws Exception {
		Map<String, String> userVO = userDAO.readUserInfo(vo);
		System.out.println("서비스임플의 DAO =" + userVO); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		System.out.println(userVO);
		if(userVO==null) {
			out.print("등록되지 않은 정보입니다.\n아이디와 이메일을 다시 확인해주세요.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setuPwd(pw);
		}
		userDAO.updatePw(vo);
		sendEmail(vo, "findpwd");
		out.print("이메일로 임시 비밀번호를 발송하였습니다.\n이메일을 확인하여 주세요.");
		out.close();
 
	}

	@Override
	public Map<String, String> readUserInfo(UserVO vo) {
		Map<String, String> map = null;

		try {
			map = userDAO.readUserInfo(vo);
			System.out.println("로그인 정보 리턴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}