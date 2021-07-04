package com.knockknock.mypage;

import java.util.Map;

import com.knockknock.util.ProductVO;

public interface MypageProductService {
	// 상품정보 가져오기(임시
	ProductVO productDetail();
	
	// 장바구니에 상품 담기 전 동일한 상품번호 있는지 확인
	int checkCart(int pIdx);

	// 장바구니에 상품 담기
	int addCart(Map<String, Object> map);

	

}
