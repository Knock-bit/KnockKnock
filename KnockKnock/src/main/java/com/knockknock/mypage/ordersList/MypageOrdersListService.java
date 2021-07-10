package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import com.knockknock.orders.OrdersListVO;
import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;
import com.knockknock.user.UserVO;

public interface MypageOrdersListService {
	// 주문서 업데이트(결제완료 후)
	int orderInfo(Map<String, Object> map);
	// 수령인 주소 입력
	int userOrder(UserOrderVO uovo);
	// 주문 임시 데이터
	int tempOrder(String nb);
	// 주문확인서 주문 정보
	List<OrdersVO> confirmationOrderInfo();
	// 주문확인서 상품 정보
	List<ProductVO> confirmationProductInfo();
	// 주문확인서 수령자 정보
	UserOrderVO confirmationUserOrderInfo();
	// 수령자정보에 들어갈 tempnum 가져오기
	String oTempnum();
	// 임시테이블 데이터 삭제
	int deleteOrderTemp();
	// 주문내역
	List<OrdersListVO> orderHistoryList(Map<String, Integer> map);
	// 임시테이블 데이터 삭제전 확인
	int deleteCheck();
	// 주문내역 총 페이지 수
	int orderHistoryListCount(UserVO vo);
	// 주문내역 기간별 조회
	List<OrdersListVO> orderHistorysearchList(Map<String, Object> map);
	// 주문내역 기간별 총 페이지 수
	int orderHistoryListCountDay(Map<String, Object> map);

}
