package com.knockknock.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;
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
		
		// 주문정보 임시 데이터에 저장할 난수 생성
		Random rd = new Random();
		int number = rd.nextInt(99999999);
		String nb = String.format("%08d", number);
		System.out.println("난수 : " + nb);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uIdx", vo.getuIdx());
		map.put("paIdx", paIdx);
		map.put("oTempnum", nb);
		
		
		int result = ordersListService.orderInfo(map);
		
		int tempResult = ordersListService.tempOrder(nb); // 임시데이터
		System.out.println("데이터 성공 : " + tempResult);

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
		System.out.println("주문 확인서 실행");
		UserVO vo = (UserVO) session.getAttribute("users");
		
		// 주문정보 가져오기
		List<OrdersVO> ovo = ordersListService.confirmationOrderInfo();
		model.addAttribute("ovo", ovo);
		System.out.println("ovo:"+ovo);
		// 상품 목록 가져오기
		List<ProductVO> plist = ordersListService.confirmationProductInfo();
		model.addAttribute("plist", plist);
		System.out.println("plist:"+plist);
		// 수령자 정보 가져오기
		UserOrderVO uovo  = ordersListService.confirmationUserOrderInfo();
		model.addAttribute("uovo", uovo);
		System.out.println("uovo:"+uovo);
		
		
		
		model.addAttribute("users", vo);
		return "/mypage/orders/orderconfirmation";
	}

}
