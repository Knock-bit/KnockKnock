package com.knockknock.mypage.ordersList;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.UserOrderVO;

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
}
