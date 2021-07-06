package com.knockknock.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
public class SellerController {
	@Autowired
	private SellerService sellerService;
	SellerVO seller = new SellerVO();
	
	public SellerController() {
		
	}
	
	// 사업자판매자 회원가입
	@PostMapping("/user/sellerJoinConfirm.do")
	public String sellerJoin(SellerVO seller) {
		System.out.println("판매자 회원가입 vo = " + seller);
		sellerService.sellerJoin(seller);
		return "/user/joinconfirm";
	}

	// 개인판매자 회원가입
	@PostMapping("/user/sellerJoinConfirm2.do")
	public String sellerJoin2(SellerVO seller) {
		System.out.println("판매자 회원가입 vo = " + seller);
		sellerService.sellerJoin(seller);
		return "/user/joinconfirm";
	}
	

}
