package com.knockknock.seller;

import com.knockknock.orders.OrdersVO;

public interface SellerService {
	public void sellerJoin(SellerVO seller);
	public void sellerJoin2(SellerVO seller);
	public SellerVO sellerLogin(SellerVO vo);
	public int saveOrderStatus(OrdersVO vo);
}
