package com.knockknock.mypage.mypageproductimpl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.util.ProductVO;

@Repository
public class MypageProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 상품 정보 가져오기(임시)
	public ProductVO productDetail() {

		return mybatis.selectOne("UserVO.productDetail");
	}
	// 장바구니에 상품 담기 전 동일한 상품 있는지 확인
	public int checkCart(int pIdx) {
		System.out.println("pIdx : " + pIdx);
		
		String rt = mybatis.selectOne("UserVO.checkCart", pIdx);
		System.out.println("상품존재여부 : " + rt);
		
		int result;
		if(rt == null ) {
			result = 0; // 장바구니에 동일한 상품 없음
		} else {
			result = 1; // 동일한 상품 있음
		}
		return result;
	}
	
	// 장바구니에 상품 담기
	public int addCart(Map<String, Object> map) {
		
		return mybatis.insert("UserVO.addCart", map);
	}
	

}
