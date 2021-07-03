package com.knockknock.seller.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.seller.SellerVO;

@Repository
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void sellerJoin(SellerVO vo) {
		System.out.println("사업자 회원가입시 받은 sellerJoin");
		mybatis.insert("Seller.sellerJoin", vo);
	}
	public void sellerJoin2(SellerVO vo) {
		System.out.println("개인 판매자 회원가입시 받은 sellerJoin");
		mybatis.insert("Seller.sellerJoin2", vo);
	}
	
	
}
