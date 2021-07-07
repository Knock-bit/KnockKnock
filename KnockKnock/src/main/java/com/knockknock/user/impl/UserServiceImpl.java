package com.knockknock.user.impl;

import java.io.PrintWriter;

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
		System.out.println("UserServiceImpl에 받은 값: "+userDAO.kakaologin(vo));
		return userDAO.kakaologin(vo);
	}

	@Override
	public UserVO googlelogin(UserVO vo) {
		System.out.println("UserServiceImpl에 받은 값: "+userDAO.kakaologin(vo));
		return userDAO.googlelogin(vo);
	}

	@Override
	public void sendEmail(UserVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "綠!Knock!의 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getuId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getuPwd()+ "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getuEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

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
		
		System.out.println("ServiceImpl" + vo);
		resp.setContentType("text/html;charset=utf-8");
		UserVO check = userDAO.readUserInfo(vo);
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if(check.getuId()==null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getuEmail().equals(check.getuEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setuPwd(pw);
			// 비밀번호 변경
			userDAO.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}

	@Override
	public UserVO readUserInfo(UserVO vo) {

		try {
			userDAO.readUserInfo(vo);
			System.out.println("로그인 정보 리턴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

}