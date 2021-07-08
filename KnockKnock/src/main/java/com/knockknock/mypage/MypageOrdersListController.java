package com.knockknock.mypage;

import java.util.HashMap;
import java.util.Map;

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

import com.knockknock.mypage.ordersList.MypageOrdersListService;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.user.UserVO;

@Controller
public class MypageOrdersListController {
	@Autowired
	private MypageOrdersListService ordersListService;
	
	// 주문서(DB에 데이터 저장) - ORDERS 테이블에
	@RequestMapping(value="/orderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String orderInfo(HttpSession session, String payData) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		int paIdx = Integer.parseInt(payData);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uIdx", vo.getuIdx());
		map.put("paIdx", paIdx);
		
		int result = ordersListService.orderInfo(map);

		String data = "";
		if(result==0) {
			data = "0";
		} else {
			data = "1";
		}
		
		return data;
	}
	
	// 수령인 정보 INSERT
	@RequestMapping(value="/userOrder.do", method=RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String userOrder(@RequestBody UserOrderVO vo, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("users");
		vo.setuIdx(user.getuIdx());
		System.out.println("수령인 정보 : " + vo);
		int result = ordersListService.userOrder(vo);

		String data = "";
		if(result==0) {
			data = "0";
		} else {
			data = "1";
		}
		
		return data;
	}
	
	// 주문확인서로 이동
	@GetMapping("orderConfirm.do")
	public String orderConfirmList(HttpSession session, Model model) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		
		
		
		
		model.addAttribute("users", vo);
		return "/mypage/orders/orderconfirmation";
	}

}
