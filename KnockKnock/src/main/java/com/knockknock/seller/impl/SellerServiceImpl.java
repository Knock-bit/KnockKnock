package com.knockknock.seller.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.orders.OrdersVO;
import com.knockknock.seller.SellerService;
import com.knockknock.seller.SellerVO;

@Service("sellerService")
public class SellerServiceImpl implements SellerService{
	@Autowired
	private SellerDAO sellerDAO;
	
	@Override
	public void sellerJoin(SellerVO seller) {
		sellerDAO.sellerJoin(seller);
	}

	@Override
	public void sellerJoin2(SellerVO seller) {
		sellerDAO.sellerJoin2(seller);
		
	}

	@Override
	public SellerVO sellerLogin(SellerVO vo) {
		return sellerDAO.sellerLogin(vo);
	}

	@Override
	public int saveOrderStatus(OrdersVO vo) {
		System.out.println("DAO실행?");
 		return sellerDAO.saveOrderStatus(vo);
	}

		
}
