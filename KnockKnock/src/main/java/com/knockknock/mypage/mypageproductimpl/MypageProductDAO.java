package com.knockknock.mypage.mypageproductimpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

@Repository
public class MypageProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 상품 목록으로 이동(임시)
	public List<ProductVO> ProductList() {

		return mybatis.selectList("UserVO.productList");
	}

	// 상품 정보 가져오기(임시)
	public ProductVO productDetail(int pIdx) {

		return mybatis.selectOne("UserVO.productDetail", pIdx);
	}
	// 장바구니에 상품 담기 전 동일한 상품 있는지 확인
	public int checkCart(int pIdx) {
		System.out.println("pIdx : " + pIdx);
		
		String rt = mybatis.selectOne("UserVO.checkCart", pIdx);
		System.out.println("상품존재여부 : " + rt);
		
		int result;
		if(rt == null ) {
			result = 0; // 장바구니에 동일한 상품 없음
		} else {
			result = 1; // 동일한 상품 있음
		}
		return result;
	}
	
	// 장바구니에 상품 담기
	public int addCart(Map<String, Object> map) {
		
		return mybatis.insert("UserVO.addCart", map);
	}
	
	// 나의 장바구니 목록
	public List<ProductVO> cartList(UserVO vo) {

		return mybatis.selectList("UserVO.cartList", vo);
	}
	
	// 장바구니 상품 전체 삭제
	public int deleteCart(UserVO vo) {
		
		String rt = mybatis.selectOne("UserVO.deleteCart", vo);
		System.out.println("dao result : " + rt);
		
		int result;
		
		if(rt == null ) {
			result = 1; // 삭제완료
		} else {
			result = 0; // 에러..?
		}
		return result;
	}
	
	

}
