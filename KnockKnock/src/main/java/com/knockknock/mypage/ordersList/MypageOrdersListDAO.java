package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;

@Repository
public class MypageOrdersListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 주문서 업데이트(결제완료 후)
	public int orderInfo(Map<String, Object> map) {
		
		return mybatis.update("Orders.orderInfo", map);
	}

	// 수령인 데이터 입력(insert)
	public int userOrder(UserOrderVO uovo) {

		return mybatis.insert("Orders.userOrder", uovo);
	}
	// 주문 임시 데이터
	public int tempOrder(String nb) {
		
		return mybatis.insert("Orders.tempOrder", nb);
	}
	// 주문확인서 주문자 정보
	public List<OrdersVO> confirmationOrderInfo() {

		return mybatis.selectList("Orders.confirmationOrderInfo");
	}
	// 주문확인서 상품 정보
	public List<ProductVO> confirmationProductInfo() {
		
		return mybatis.selectList("Orders.confirmationProductInfo");
	}
	// 주문확인서 수령자 정보
	public UserOrderVO confirmationUserOrderInfo() {
		
		return mybatis.selectOne("Orders.confirmationUserOrderInfo");
	}
}
