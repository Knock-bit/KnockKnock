package com.knockknock.orders.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.OrdersVO;

@Repository
public class OrdersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<OrdersVO> showOrderList(int sIdx){
		System.out.println("sIdx는 "+sIdx);
		List<OrdersVO> vo = mybatis.selectList("Orders.selectOrderList", sIdx); 
		return vo;
	}
	
	public int countOrders(int sIdx) {
		return mybatis.selectOne("Orders.countOrders", sIdx);
	}
	
	public int avgTot(int sIdx) {
		return mybatis.selectOne("Orders.avgTot", sIdx);
	}
	
	public List<OrdersVO> showDailySales(int sIdx){
		return mybatis.selectList("Orders.selectDailySales", sIdx);
	}
	
	public int selectDailyTot(int sIdx) {
		return mybatis.selectOne("Orders.selectDailyTot", sIdx);
	}
}