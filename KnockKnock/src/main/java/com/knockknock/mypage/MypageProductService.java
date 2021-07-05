package com.knockknock.mypage;

import java.util.List;
import java.util.Map;

import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

public interface MypageProductService {
	// 상품 목록으로 이동
	List<ProductVO> ProductList();
	
	// 상품정보 가져오기(임시
	ProductVO productDetail(int pIdx);
	
	// 장바구니에 상품 담기 전 동일한 상품번호 있는지 확인
	int checkCart(int pIdx);

	// 장바구니에 상품 담기
	int addCart(Map<String, Object> map);

	// 나의 장바구니 목록
	List<ProductVO> cartList(UserVO vo);
	
	// 나의 장바구니 목록 전체 삭제
	int deleteCart(UserVO vo);
	
	// 장바구니에서 상품 하나 삭제
	int deleteOne(int pIdx);

	

	

}
