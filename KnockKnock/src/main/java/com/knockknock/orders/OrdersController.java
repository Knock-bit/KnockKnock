package com.knockknock.orders;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.seller.SellerVO;

@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	//판매자별 주문리스트 뽑기
	@GetMapping("/seller/sellerDashboard.do")
	public String sellerDashboard(HttpSession session, SellerVO seller, Model model, int sIdx) {
		System.out.println("DashBoard에 갈 select문 controller");
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

		model.addAttribute("number", number);
		model.addAttribute("list", list);
		model.addAttribute("avgTot", avgTot);
		model.addAttribute("dailySales", dailySales);
 		model.addAttribute("dailyTot", dailyTot);
		model.addAttribute("session", session);
		
		return "/seller/sellerDashboard";		
	}

	

}
