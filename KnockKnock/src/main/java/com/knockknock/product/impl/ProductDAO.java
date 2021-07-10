package com.knockknock.product.impl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.product.ProductVO;
@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// SHOP 메인페이지 - 전체리스트 보기
	public List<ProductVO> ProductList() {
		System.out.println("DAO"+ mybatis.selectList("UserVO.productList"));
		return mybatis.selectList("UserVO.productList");
	}

	//카테고리별 상품 보기
 	public List<ProductVO> categoryProduct(ProductVO vo) {
		System.out.println("DAO에서 받은 pcIdx = "+vo); 
		return mybatis.selectList("Product.selectCategory", vo);
	}
		
	// 상품 정보 가져오기(임시)
	public ProductVO productDetail(int pIdx) {
		return mybatis.selectOne("UserVO.productDetail", pIdx);
	}
	// 상품 등록
	public int insertProduct(ProductVO product) {
		return mybatis.insert("Product.insertProduct", product);
	}



}
