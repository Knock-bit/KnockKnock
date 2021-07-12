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
	
	//shop 메인페이지(상품정보 리스트 보여주기)
	public List<ProductVO> ProductList() {
 		return productDAO.ProductList();
	}
	// 카테고리별
	@Override
	public List<ProductVO> categoryProduct(ProductVO vo) {
		
		return productDAO.categoryProduct(vo);
	} 
	
	// 상품정보 가져오기 (임시)
	@Override
	public ProductVO productDetail(int pIdx) {
		return productDAO.productDetail(pIdx);
	}

	// 상품 등록
	@Override
	public int insertProduct(ProductVO product) {
		return productDAO.insertProduct(product);
	}
	@Override
	public List<ProductVO> manageMyproducts(int sIdx) {
		return productDAO.manageMyProducts(sIdx);
	}	
}
