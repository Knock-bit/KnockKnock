package com.knockknock.orders;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;

@Controller
@SessionAttributes("seller")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	OrdersVO order = new OrdersVO();
	
	@GetMapping("seller/sellerDashboard.do")

	public String sellerDashboard(Model model) {
		System.out.println("DashBoard에 갈 select문 controller");
		
		List<OrdersVO> list = ordersService.showOrderList();
		
		System.out.println("확인해보기");
		model.addAttribute("list", list);
		return "/seller/sellerDashboard";		
	}
	
	

}
