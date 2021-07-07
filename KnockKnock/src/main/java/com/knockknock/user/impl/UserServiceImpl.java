package com.knockknock.user.impl;

import java.io.PrintWriter;
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
	public void join(UserVO vo) throws Exception {
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
			msg += "<div align='center' style='border:1px solid rgb(184, 180, 180); font-family: Noto Sans KR'>";
			msg += "<h1 style='color: rgb(10, 61, 14);'>綠!Knock! 비밀번호 찾기</h1>";
			msg += "<h3>";
			msg += vo.getuId() + "님의 임시 비밀번호를 보내드립니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getuPwd() + "</p>";
			msg += "로그인 하신 후 마이페이지에서 비밀번호를 변경해주시기 바랍니다.<br></div>";
			
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
		}else {
			// 회원가입 메일 내용
			subject = "綠!Knock! 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid rgb(184, 180, 180);font-family: Noto Sans KR'>";
			msg += "<h1 style='color: rgb(10, 61, 14);'>綠!Knock! 회원가입을 축하드립니다.</h1>"; 
			msg += "<h3>";
			msg += vo.getuId() + "님 회원가입을 환영합니다.</h3>";
			msg += "<form><div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='POST' action='http://localhost:8080/userApproval.do'>";
			msg += "<input type='hidden' name='uEmail' value='" + vo.getuEmail()+ "'>";
			msg += "<input type='hidden' name='uApprkey' value='" + vo.getuApprkey() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
			System.out.println("인증메일 클릭시 이메일 = "+vo.getuEmail());
			System.out.println("인증메일 클릭시 APPRKEY = "+ vo.getuApprkey());

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

	@Override
	public void userApproval(UserVO vo, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		System.out.println(userDAO.userApproval(vo));
		PrintWriter out = resp.getWriter();
		if (userDAO.userApproval(vo) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='/main.do';");
			out.println("</script>");
			out.close();
		}		
	}
 

}