package com.knockknock.product.impl;


import java.util.List; 

public class ProductDAO {
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.product.ProductVO;
@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> ProductList() {

		return mybatis.selectList("UserVO.productList");
	}

	
	// 상품 정보 가져오기(임시)
	public ProductVO productDetail(int pIdx) {

		return mybatis.selectOne("UserVO.productDetail", pIdx);
	}

=======

}
