package com.knockknock.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.knockknock.user.UserVO;
import com.knockknock.util.ProductVO;

@Controller
@SessionAttributes("users")

public class ProductController {
	@Autowired
	private ProductService productService;
	ProductVO product = new ProductVO();
	@GetMapping("/productlist.do")
	public String ProductList(UserVO vo, Model model) {
		
		List<ProductVO> plist = productService.ProductList();
		
		model.addAttribute("plist", plist);
		return "/product/productlist";
	}
	

}
