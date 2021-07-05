package com.knockknock.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("seller")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	@GetMapping("seller/sellerDashboard.do")
	public String sellerDashboard(Model model) {
		
		List<OrdersVO> list = ordersService.showOrderList();
		
		model.addAttribute("list", list);
		return "/seller/sellerDashboard";
		
	}

}
