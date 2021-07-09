package com.knockknock.orders;

import java.util.List;

public interface OrdersService {
	public List<OrdersVO> showOrderList(int sIdx);
	
	public int countOrders(int sIdx);
	
	public int avgTot(int sIdx);
}