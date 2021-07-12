package com.knockknock.mypage.ordersList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.orders.OrdersListVO;
import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;
import com.knockknock.user.UserVO;

@Service("mypageOrdersListService")
public class MypageOrdersListServiceImpl implements MypageOrdersListService {
	@Autowired
	private MypageOrdersListDAO ordersListDAO;

	// 주문서 업데이트(결제완료 후)
	@Override
	public int orderInfo(Map<String, Object> map) {

		return ordersListDAO.orderInfo(map);
	}
	
	// 수령인 주소 입력(데이터 insert)
	@Override
	public int userOrder(UserOrderVO uovo) {
		
		return ordersListDAO.userOrder(uovo);
	}

	// 주문 임시 데이터
	@Override
	public int tempOrder(String nb) {
		
		return ordersListDAO.tempOrder(nb);
	}
	// 주문확인서 주문자 정보
	@Override
	public List<OrdersVO> confirmationOrderInfo() {
		
		return ordersListDAO.confirmationOrderInfo();
	}
	// 주문확인서 상품 정보
	@Override
	public List<ProductVO> confirmationProductInfo() {

		return ordersListDAO.confirmationProductInfo();
	}
	// 주문확인서 수령자 정보
	@Override
	public UserOrderVO confirmationUserOrderInfo() {
		
		return ordersListDAO.confirmationUserOrderInfo();
	}
	// 수령자 정보에 들어갈 tempnum 가져오기
	@Override
	public String oTempnum() {
		
		return  ordersListDAO.oTempnum();
	}
	// 임시테이블 데이터 삭제
	@Override
	public int deleteOrderTemp() {
		// TODO Auto-generated method stub
		return ordersListDAO.deleteOrderTemp();
	}
	// 주문내역
	@Override
	public List<OrdersListVO> orderHistoryList(Map<String, Integer> map) {
		
		return ordersListDAO.orderHistoryList(map);
	}
	// 임시테이블 데이터 삭제 전 데이터 확인
	@Override
	public int deleteCheck() {
		// TODO Auto-generated method stub
		return ordersListDAO.deleteCheck();
	}
	// 주문내역 총 페이지 수
	@Override
	public int orderHistoryListCount(UserVO vo) {
		// TODO Auto-generated method stub
		return ordersListDAO.orderHistoryListCount(vo);
	}
	// 주문내역 기간별 조회
	@Override
	public List<OrdersListVO> orderHistorysearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ordersListDAO.orderHistorysearchList(map);
	}
	// 주문내역 기간별 총 페이지 수
	@Override
	public int orderHistoryListCountDay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ordersListDAO.orderHistoryListCountDay(map);
	}
}
