package com.knockknock.mypage.ordersList;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.orders.UserOrderVO;

@Service("mypageOrdersListService")
public class MypageOrdersListServiceImpl implements MypageOrdersListService {
	@Autowired
	private MypageOrdersListDAO ordersListDAO;

	// 주문서 업데이트(결제완료 후)
	@Override
	public int orderInfo(Map<String, Object> map) {

		return ordersListDAO.orderInfo(map);
	}
	
	// 수령인 주소 입력(데이터 insert)
	@Override
	public int userOrder(UserOrderVO uovo) {
		
		return ordersListDAO.userOrder(uovo);
	}
}
