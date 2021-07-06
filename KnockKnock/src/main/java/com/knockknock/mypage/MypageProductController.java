package com.knockknock.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.knockknock.orders.OrdersVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;
 
@Controller
@SessionAttributes("users")
public class MypageProductController {
	
	@Autowired
	private MypageProductService mypageProductService;
	
	
	
	// 상품 장바구니에 담기
	@RequestMapping(value="/addCart.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String addCart(@ModelAttribute("users")UserVO vo, int pIdx, int selectCnt) {
		
		// 상품 담기 전에 동일한 상품 번호 있는지 확인
		
		int result = mypageProductService.checkCart(pIdx);
		String result2 = String.valueOf(result);
		System.out.println("result2(장바구니에 동일상품 존재여부):" + result2);
		
		if(result == 0 ) {
			// 장바구니에 담기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("uIdx", vo.getuIdx());
			map.put("pIdx", pIdx);
			map.put("pCount", selectCnt);
			
			mypageProductService.addCart(map);
		}
		
		
		return result2;
	}
	
	// 장바구니로 이동
	@GetMapping("/moveCart.do")
	public String moveCart(@ModelAttribute("users")UserVO vo, Model model) {
		
		// 장바구니 리스트 불러오기
		List<ProductVO> cartList = mypageProductService.cartList(vo);
		System.out.println("cartList"+cartList);
		
		model.addAttribute("cartList", cartList);
		return "/mypage/cart/cart";
	}
	
	// 장바구니 상품 전체 삭제
	@PostMapping("/deleteCart.do")
	@ResponseBody
	public String deleteCart(@ModelAttribute("users")UserVO vo, Model model) {
		
		int result = mypageProductService.deleteCart(vo);
		String data =String.valueOf(result);
		
		System.out.println("data:" + data);
		
		
		return data;
	}

	// 장바구니 상품 하나 삭제
	@PostMapping("/deleteOne.do")
	@ResponseBody
	public String deleteOne(@ModelAttribute("users")UserVO vo, int pIdx) {
		
		int result = mypageProductService.deleteOne(pIdx);
		String data =String.valueOf(result);
		
		System.out.println("data:" + data);

		return data;
	}
	
	// 장바구니 상품 -> 주문(테이블)으로 이동
	@RequestMapping(value="/moveOrders.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String moveOrders(@RequestBody List<OrdersVO> olist) {
		System.out.println("장바구니 컨트롤러 실행");
		int rs = 0;
		System.out.println(olist);
		
		int deleteResult = 0;
		for (OrdersVO ovo : olist) {
			 rs = mypageProductService.insertOrders(ovo);
			 
			 int pIdx = ovo.getpIdx();
			 // insert성공하면 해당 상품 delete 실행
			 if(rs==1) {
				deleteResult = mypageProductService.deleteBuyProduct(pIdx);
				System.out.println("장바구니 아이템 삭제 : " + deleteResult);
			 }
		}
		
		String result = String.valueOf(deleteResult);
		System.out.println("delete까지 완료후:" + result);

		return result;
	}
	
	// 주문서로 이동
	@GetMapping("ordersList.do")
	public String ordersList(@ModelAttribute("users")UserVO vo) {
		
		// 주문서 가져오기
		List<OrdersVO> olist = mypageProductService.ordersList(vo);
		
		
		return "/mypage/orders/ordersList";
	}
}
