package com.knockknock.seller.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		
}
