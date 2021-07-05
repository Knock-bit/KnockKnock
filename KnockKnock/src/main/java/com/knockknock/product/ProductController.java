package com.knockknock.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;
import com.knockknock.product.ProductVO;

@Controller
@SessionAttributes("users")
public class ProductController {
	@Autowired
	private ProductService productService;
	ProductVO product = new ProductVO();
	
	// 상품 리스트
	@GetMapping("/productlist.do")
	public String ProductList(Model model) {
		
		List<ProductVO> plist = productService.ProductList();
		
		model.addAttribute("plist", plist);
		return "/product/productlist";
	}
	
	// 상품 목록(정보) 가져오기 - 임시
	@GetMapping("/productDetail.do")
	public String ProductDetail(Model model, int pIdx) {
		
		ProductVO pvo = productService.productDetail(pIdx);
		System.out.println("pvo : " + pvo);
		
		model.addAttribute("pvo", pvo);
		return "/mypage/cart/tempProduct";
	}

	

}
