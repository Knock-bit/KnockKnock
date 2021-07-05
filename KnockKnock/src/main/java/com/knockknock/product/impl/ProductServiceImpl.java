package com.knockknock.product.impl;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.product.ProductService;
import com.knockknock.product.ProductVO;


@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<com.knockknock.util.ProductVO> ProductList() {
 		return productDAO.ProductList();
	}

	
	// 상품정보 가져오기 (임시)
	@Override
	public ProductVO productDetail(int pIdx) {
		
		return productDAO.productDetail(pIdx);
	}
}
