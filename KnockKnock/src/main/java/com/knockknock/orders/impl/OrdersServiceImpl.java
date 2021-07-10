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
		return ordersDAO.showOrderList(sIdx);
	}

	@Override
	public int countOrders(int sIdx) {		
		return ordersDAO.countOrders(sIdx);
	}

	@Override
	public int avgTot(int sIdx) {
		return ordersDAO.avgTot(sIdx);
	}

	@Override
	public List<OrdersVO> selectDailySales(int sIdx) {
		//일주일간 daily 매출		
		return ordersDAO.showDailySales(sIdx);
	}

	@Override
	public int selectDailyTot(int sIdx) {
 		return ordersDAO.selectDailyTot(sIdx);
	}


}