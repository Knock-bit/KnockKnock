package com.knockknock.orders;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.knockknock.seller.SellerVO;

@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	//판매자별 주문리스트 뽑기
	@GetMapping("/seller/sellerDashboard.do")
	public String sellerDashboard(HttpSession session, SellerVO seller, Model model, int sIdx) {
		session.getAttribute("seller");
		//주문내역
		List<OrdersVO> list = ordersService.showOrderList(sIdx);
		//누적주문건수
		int number = ordersService.countOrders(sIdx);
		//주문건당 평균 결제금액
		int avgTot = ordersService.avgTot(sIdx);
		//일간매출
		List<OrdersVO> dailySales = ordersService.selectDailySales(sIdx);
		//일주일간 총매출액 합계
		int dailyTot = ordersService.selectDailyTot(sIdx);
		//주문건이 많은 고객보기
		List<OrdersVO> orderGuests = ordersService.countGuest(sIdx);
		//1주전 주문건수
		List<OrdersVO> countWeeklySales = ordersService.countWeeklySales(sIdx);
		//2주전 주문건수
		List<OrdersVO> countWeeklySales2 = ordersService.countWeeklySales2(sIdx);
		//판매순위뽑기
		List<OrdersVO> rank = ordersService.sellerRank(sIdx);
		//판매자등록일
		String regdate = ordersService.sellerRegdate(sIdx);
		//누적 매출
		int revenue = ordersService.totalRevenue(sIdx);
		
		model.addAttribute("number", number);
		model.addAttribute("list", list);
		model.addAttribute("avgTot", avgTot);
		model.addAttribute("dailySales", dailySales);
 		model.addAttribute("dailyTot", dailyTot);
 		model.addAttribute("orderGuests", orderGuests);
		model.addAttribute("countWeeklySales", countWeeklySales);
		model.addAttribute("countWeeklySales2", countWeeklySales2);
		model.addAttribute("rank", rank);
		model.addAttribute("regdate", regdate);
		model.addAttribute("revenue", revenue);
 		model.addAttribute("session", session);
		
		return "/seller/sellerDashboard";		
	}
	
	@GetMapping("/seller/orderstatus.do")
	public String changeOrderStatus(HttpSession session, SellerVO seller, Model model, int sIdx) {
		session.getAttribute("seller");
		
		List<OrdersVO> list = ordersService.showOrderAll(sIdx);
		
		model.addAttribute("list", list);
		
		return "/seller/sellerorderstatus";
	}



	

	

}
