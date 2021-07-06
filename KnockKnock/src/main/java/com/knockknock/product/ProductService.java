package com.knockknock.product;

import java.util.List;


public interface ProductService {
	// 상품목록
	List<ProductVO> ProductList();

	// 상품정보 가져오기(임시
	ProductVO productDetail(int pIdx);

	// 상품 등록
	int insertProduct(ProductVO product);
}
