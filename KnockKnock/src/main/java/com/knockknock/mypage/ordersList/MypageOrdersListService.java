package com.knockknock.mypage.ordersList;

import java.util.Map;

import com.knockknock.orders.UserOrderVO;

public interface MypageOrdersListService {
	// 주문서 업데이트(결제완료 후)
	int orderInfo(Map<String, Object> map);
	// 수령인 주소 입력
	int userOrder(UserOrderVO uovo);

}
