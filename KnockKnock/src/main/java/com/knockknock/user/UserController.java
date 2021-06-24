package com.knockknock.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/user/*")
public class UserController {
	@Inject
	private UserService service;
	
	private static final Logger l = LoggerFactory.getLogger(UserController.class);
	
	@ResponseBody
	//회원가입: localhost:8080/biz/join
	@RequestMapping(value="/loginGoogle", method = RequestMethod.POST)
	public String loginGoogle(UserVO vo, HttpSession session, RedirectAttributes attr, UserVO userVO) {
		UserVO returnVO = service.loginMemberByGoogle(vo);
		String userVO_ajaxid = userVO.getuId();
		System.out.println("구글 포스트 db에서 가져온VO = "+vo);
		System.out.println("구글 포스트 ajax에서 가져온VO = "+vo);
		
		if(returnVO==null) {//아이디가 DB에 없을 때
			service.joinMemberByGoogle(vo);
			returnVO = service.loginMemberByGoogle(vo);
			session.setAttribute("uId", returnVO.getuId());
			attr.addFlashAttribute("userVO", returnVO);
		}
		
		return null;
		
	}
	
	
}
