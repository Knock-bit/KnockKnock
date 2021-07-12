package com.knockknock.mypage;

import java.util.List;
import java.util.Map;

import com.knockknock.orders.OrdersVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

public interface MypageProductService {

	
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

	// 장바구니에서 주문하기로 이동
	int insertOrders(OrdersVO ovo);
	
	// 주문된 상품 장바구니에서 삭제
	int deleteBuyProduct(int pIdx);
	
	// 주문서 가져오기
	List<OrdersVO> ordersList(UserVO vo);
	
	// 주문 취소
	int deleteOrders(OrdersVO vo);

	

	

}
