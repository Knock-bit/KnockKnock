package com.knockknock.orders;

import java.util.List;

public interface OrdersService {
	public List<OrdersVO> showOrderList(int sIdx);
	
	public List<OrdersVO> showOrderAll(int sIdx);

	
	public int countOrders(int sIdx);
	
	public int avgTot(int sIdx);

	public List<OrdersVO> selectDailySales(int sIdx);

	public int selectDailyTot(int sIdx);
	
	public List<OrdersVO> countGuest(int sIdx);

	public List<OrdersVO> countWeeklySales(int sIdx);
	
	public List<OrdersVO> countWeeklySales2(int sIdx);

	public List<OrdersVO> sellerRank(int sIdx);

	public String sellerRegdate(int sIdx);

	public int totalRevenue(int sIdx);

}