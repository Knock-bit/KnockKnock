package com.knockknock.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.seller.SellerVO;

@Controller
@SessionAttributes("seller")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	@GetMapping("/seller/sellerDashboard.do")

	public String sellerDashboard(@ModelAttribute("seller")SellerVO seller, Model model, int sIdx) {
		System.out.println("DashBoard에 갈 select문 controller");
		
		List<OrdersVO> list = ordersService.showOrderList(sIdx);
		
		System.out.println("확인해보기");
		model.addAttribute("list", list);
		return "/seller/sellerDashboard";		
	}
	
	

}
