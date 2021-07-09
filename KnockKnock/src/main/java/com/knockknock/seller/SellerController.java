package com.knockknock.seller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellerController {
	@Autowired
	private SellerService sellerService;
	SellerVO seller = new SellerVO();

	public SellerController() {

	}

	@GetMapping("/user/sellerPage.do")
	public String moveSellerPage() {
		return "/seller/sellerLogin";
	}

	// 사업자판매자 회원가입

	@PostMapping("/user/sellerJoinConfirm.do")
	public String sellerJoin(SellerVO seller) {
		System.out.println("판매자 회원가입 vo = " + seller);
		sellerService.sellerJoin(seller);
		return "/user/joinConfirm";

	}

	// 개인판매자 회원가입 **return값 추후에 다시 바꿔야함 이메일인증하는걸로
	@PostMapping("/user/sellerJoinConfirm2.do")
	public String sellerJoin2(SellerVO seller) {
		System.out.println("판매자 회원가입 vo = " + seller);
		sellerService.sellerJoin(seller);
		return "/user/joinConfirm";

	}

	// 판매자로그인
	@RequestMapping(value = "/seller/sellerLogin.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public SellerVO loginSellers(@RequestBody SellerVO vo, HttpSession session) {
		System.out.println("로그인 seller = " + vo);

		SellerVO seller = sellerService.sellerLogin(vo);
		if (seller != null) {
			System.out.println("로그인 성공");
			session.setAttribute("seller", seller);
		}

		System.out.println("전달할 seller: " + seller);

		return seller;
	}

	// 판매자 로그아웃
	@RequestMapping("/seller/sellerLogout.do")
	public ModelAndView sellerLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("main/main");
		return mv;
	}

}
