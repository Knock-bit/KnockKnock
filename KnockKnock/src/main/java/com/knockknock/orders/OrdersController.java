package com.knockknock.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("seller")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	@GetMapping("seller/sellerDashboard.do")
	public String sellerDashboard(@ModelAttribute("seller") Model model) {
		
		List<OrdersVO> orders = ordersService.showOrderList();
		model.addAttribute("orders", orders);
		return "/seller/sellerDashboard";
		
	}
	
	 

}
