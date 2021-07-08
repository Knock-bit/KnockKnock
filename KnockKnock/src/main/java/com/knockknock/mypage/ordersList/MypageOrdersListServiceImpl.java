package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;

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

	// 주문 임시 데이터
	@Override
	public int tempOrder(String nb) {
		
		return ordersListDAO.tempOrder(nb);
	}
	// 주문확인서 주문자 정보
	@Override
	public List<OrdersVO> confirmationOrderInfo() {
		
		return ordersListDAO.confirmationOrderInfo();
	}
	// 주문확인서 상품 정보
	@Override
	public List<ProductVO> confirmationProductInfo() {

		return ordersListDAO.confirmationProductInfo();
	}
	// 주문확인서 수령자 정보
	@Override
	public UserOrderVO confirmationUserOrderInfo() {
		
		return ordersListDAO.confirmationUserOrderInfo();
	}
}
