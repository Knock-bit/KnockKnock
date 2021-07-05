package com.knockknock.product.impl;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.util.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ProductVO> ProductList() {

		return mybatis.selectList("UserVO.productList");
	}
}
