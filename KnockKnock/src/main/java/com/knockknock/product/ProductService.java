package com.knockknock.product;

import java.util.List;


public interface ProductService {
	// 상품목록
	List<ProductVO> ProductList();
	// 카테고리만
	List<ProductVO> categoryProduct(ProductVO vo);
	
	// 상품정보 가져오기(임시
	ProductVO productDetail(int pIdx);

	// 상품 등록
	int insertProduct(ProductVO product);
	
	//판매자가 등록한 상품
	public List<ProductVO> manageMyproducts(int sIdx);

}
