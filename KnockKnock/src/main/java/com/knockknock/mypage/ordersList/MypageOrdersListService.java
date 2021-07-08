package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;

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

}
