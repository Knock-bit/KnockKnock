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
		List<OrdersVO> list = ordersService.showOrderList(sIdx);		
		int number = ordersService.countOrders(sIdx);
		int avgTot = ordersService.avgTot(sIdx);
		System.out.println(number);
		model.addAttribute("number", number);
		model.addAttribute("list", list);
		model.addAttribute("avgTot", avgTot);

		model.addAttribute("session", session);
		return "/seller/sellerDashboard";		
	}
 
	

}
