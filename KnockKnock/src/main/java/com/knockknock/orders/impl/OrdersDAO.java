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

	public List<OrdersVO> showOrderList(){
		return mybatis.selectList("Orders.selectOrderList");
	}
}