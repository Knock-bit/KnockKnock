package com.knockknock.product;

import java.util.List; 


import com.knockknock.product.ProductVO;

import com.knockknock.util.ProductVO;


public interface ProductService {
	// 상품목록
	List<ProductVO> ProductList();

	// 상품정보 가져오기(임시
	ProductVO productDetail(int pIdx);
}
