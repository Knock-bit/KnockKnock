package com.knockknock.mypage.mypageproductimpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.OrdersVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

@Repository
public class MypageProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

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

	// 장바구니 상품 하나 삭제
	public int deleteOne(int pIdx) {
		
		String rt = mybatis.selectOne("UserVO.deleteOne", pIdx);
		int result;
		
		if(rt == null ) {
			result = 1; // 삭제완료
		} else {
			result = 0; // 에러..?
		}
		return result;
	}
	
	// 장바구니에서 주문하기로 이동
	public int insertOrders(OrdersVO ovo) {

		return mybatis.insert("UserVO.insertOrders", ovo);
	}
	// 주문된 상품 장바구니에서 삭제
	public int deleteBuyProduct(int pIdx) {

		return mybatis.insert("UserVO.deleteBuyProduct", pIdx);
	}
	// 주문서 가져오기
	public List<OrdersVO> ordersList(UserVO vo) {

		return mybatis.selectList("UserVO.ordersList", vo);
	}
	
	

}
