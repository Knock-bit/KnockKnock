package com.knockknock.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.knockknock.mypage.ordersList.MypageOrdersListService;
import com.knockknock.orders.OrdersListVO;
import com.knockknock.orders.OrdersVO;
import com.knockknock.orders.UserOrderVO;
import com.knockknock.product.ProductVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.PagingVO;

@Controller
public class MypageOrdersListController {
	@Autowired
	private MypageOrdersListService ordersListService;
	
	// 주문정보 임시 데이터에 저장할 난수 생성
	
	
	
	// 주문서(DB에 데이터 저장) - ORDERS 테이블에
	@RequestMapping(value="/orderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String orderInfo(HttpSession session, String payData, String otempnum) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		int paIdx = Integer.parseInt(payData);
		
		System.out.println("주문번호 " + otempnum);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uIdx", vo.getuIdx());
		map.put("paIdx", paIdx);
		map.put("oTempnum", otempnum);
		
		
		int result = ordersListService.orderInfo(map);
		
		int tempResult = ordersListService.tempOrder(otempnum); // 임시데이터
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
		
		// tempnum 가져오기
		String oTempnum = ordersListService.oTempnum();
		vo.setoTempnum(oTempnum);
		System.out.println("oTempNum : " + oTempnum);
		
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
	
	// 나의 주문내역으로 이동
	@GetMapping("/orderHistory.do")
	public String orderHistory(HttpSession session, Model model, HttpServletRequest request,
							@RequestParam(value="nowPage", required=false)String nowPage,
							@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		
		// 주문내역 가져오기 (페이징)
		PagingVO pvo = new PagingVO();
		// 주문내역 전체 게시물 수 구하기
		pvo.setTotal(ordersListService.orderHistoryListCount(vo));
		int total = pvo.getTotal();
		
		// 페이지당 글 갯수
		pvo.setCntPerPage(6);
		
		// 현재 페이지 구하기
		if(nowPage==null && cntPerPage==null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage ="6";
		}
		pvo = new  PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		Map<String, Integer> map = new HashMap<>();
		int start = pvo.getStart();
		int end = pvo.getEnd();
		int uIdx = vo.getuIdx();
		map.put("start", start);
		map.put("end", end);
		map.put("uIdx", uIdx);
		System.out.println("map:"+map);
		List<OrdersListVO> ohList = ordersListService.orderHistoryList(map);
		
		 
		System.out.println("주문내역 : " + ohList);
		 
		// 임시 테이블 데이터 확인
		int result = ordersListService.deleteCheck();
		if(result == 1) {
			ordersListService.deleteOrderTemp();
		} 
		model.addAttribute("pvo", pvo);
		model.addAttribute("ohList", ohList);
		model.addAttribute("users", vo);
		
		return "/mypage/orders/orderHistory";
	}
	
	
	// 나의 주문내역으로 이동
	@GetMapping("/orderHistoryCal.do")
	public String orderHistoryCal(HttpSession session, Model model,
							@RequestParam(value="nowPage", required=false)String nowPage,
							@RequestParam(value="cntPerPage", required=false)String cntPerPage,
							@RequestParam(value="cal1", required=false)String cal1,
							@RequestParam(value="cal2", required=false)String cal2) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		Map<String, Object> map = new HashMap<>();
		int uIdx = vo.getuIdx();
		map.put("cal1",cal1);
		map.put("cal2",cal2);
		map.put("uIdx", uIdx);
		// 주문내역 가져오기 (페이징)
		PagingVO pvo = new PagingVO();
		// 주문내역 전체 게시물 수 구하기
		pvo.setTotal(ordersListService.orderHistoryListCountDay(map));
		int total = pvo.getTotal();
		System.out.println("전체 게시물 수 : " + total);
		// 페이지당 글 갯수
		pvo.setCntPerPage(6);
		
		// 현재 페이지 구하기
		if(nowPage==null && cntPerPage==null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage ="6";
		}
		pvo = new  PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		
		int start = pvo.getStart();
		int end = pvo.getEnd();
	
		map.put("start", start);
		map.put("end", end);
		
		

		System.out.println("cal1:"+cal1 +", cal2 :" + cal2);
		
		map.put("cal1",cal1);
		map.put("cal2",cal2);
		
		List<OrdersListVO> ohList = ordersListService.orderHistorysearchList(map);
		 
		
		System.out.println("주문내역 : " + ohList);
		
		 // 임시 테이블 데이터 확인
		int result = ordersListService.deleteCheck(); 
		if(result ==1) { ordersListService.deleteOrderTemp(); } 
		model.addAttribute("pvo", pvo);
		model.addAttribute("ohList", ohList); model.addAttribute("users", vo);
			 
		return "/mypage/orders/orderHistory";
	}

}
