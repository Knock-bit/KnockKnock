package com.knockknock.seller.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.OrdersVO;
import com.knockknock.product.ProductVO;
import com.knockknock.seller.SellerVO;

@Repository
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void sellerJoin(SellerVO vo) {
		System.out.println("사업자 회원가입시 받은 sellerJoin");
		mybatis.insert("seller.sellerJoin", vo);
	}
	public void sellerJoin2(SellerVO vo) {
		System.out.println("개인 판매자 회원가입시 받은 sellerJoin");
		mybatis.insert("seller.sellerJoin2", vo);
	}
	
	public SellerVO sellerLogin(SellerVO vo) {
		vo = mybatis.selectOne("seller.sellerLogin", vo);
		System.out.println("판매자 로그인 vo : " + vo);
		return vo;
	}
	public List<ProductVO> manageMyproducts(int sIdx) {
		return mybatis.selectList("seller.manageMyproducts", sIdx);
	}
	  
	public int saveOrderStatus(OrdersVO vo) {
		System.out.println("**DAO**"+vo);
		int result = mybatis.update("seller.updateOrderStatus", vo);
		System.out.println(result);
		return result;
	}
	
}
