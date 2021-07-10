package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.orders.OrdersListVO;
import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;
import com.knockknock.user.UserVO;

@Repository
public class MypageOrdersListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 주문서 업데이트(결제완료 후)
	public int orderInfo(Map<String, Object> map) {
		
		return mybatis.update("Orders.orderInfo", map);
	}

	// 수령인 데이터 입력(insert)
	public int userOrder(UserOrderVO uovo) {

		return mybatis.insert("Orders.userOrder", uovo);
	}
	// 주문 임시 데이터
	public int tempOrder(String nb) {
		
		return mybatis.insert("Orders.tempOrder", nb);
	}
	// 주문확인서 주문자 정보
	public List<OrdersVO> confirmationOrderInfo() {

		return mybatis.selectList("Orders.confirmationOrderInfo");
	}
	// 주문확인서 상품 정보
	public List<ProductVO> confirmationProductInfo() {
		
		return mybatis.selectList("Orders.confirmationProductInfo");
	}
	// 주문확인서 수령자 정보
	public UserOrderVO confirmationUserOrderInfo() {
		
		return mybatis.selectOne("Orders.confirmationUserOrderInfo");
	}
	// 수령자 정보에 들어갈 tempnu 가져오기
	public String oTempnum() {
		
		return mybatis.selectOne("Orders.oTempnum");
	}
	// 임시데이터 삭제
	public int deleteOrderTemp() {
		
		return mybatis.delete("Orders.deleteOrderTemp");
	}
	// 주문내역
	public List<OrdersListVO> orderHistoryList(Map<String, Integer> map) {
		
		return mybatis.selectList("Orders.orderHistoryList", map);
	}
	// 임시테이블 데이터 삭제 전 데이터 확인
	public int deleteCheck() {
		
		List<String> list = mybatis.selectList("Orders.deleteCheck");
		
		int result = 0;
		if(list.size()>0) {
			result = 1;
		} else {
			result = 0;
		}
		// TODO Auto-generated method stub
		return result;
	}
	// 주문내역 총 페이지 수
	public int orderHistoryListCount(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Orders.orderHistoryListCount", vo);
	}
	// 주문내역 기간별 조회
	public List<OrdersListVO> orderHistorysearchList(Map<String, Object> map) {
		System.out.println(map);
		
		return mybatis.selectList("Orders.orderHistorysearchList", map);
	}
	// 주문내역 기간별 총 페이지 수
	public int orderHistoryListCountDay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Orders.orderHistoryListCountDay", map);
	}
}
