package com.knockknock.product.impl;

import java.util.List;

import com.knockknock.product.ProductService;
import com.knockknock.product.ProductVO;

public class ProductServiceImpl implements ProductService{

	@Override
	public List<ProductVO> selectProductList() {
		// TODO Auto-generated method stub
		return null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.product.ProductService;
import com.knockknock.util.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> ProductList() {
		return productDAO.ProductList();
	}
}
