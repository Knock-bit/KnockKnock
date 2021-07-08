package com.knockknock.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.orders.OrdersService;
import com.knockknock.orders.OrdersVO;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDAO ordersDAO;

	@Override
	public List<OrdersVO> showOrderList(int sIdx) {
		System.out.println("여기는 Service "+sIdx);
		return ordersDAO.showOrderList(sIdx);
	}


}