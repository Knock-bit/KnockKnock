package com.knockknock.product;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@SessionAttributes("users")
public class ProductController {
	@Autowired
	private ProductService productService;
	private String uploadPath = "C:/knock2/product/";
	
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
	
	@PostMapping("/productRegister.do")
	public String productRegister(ProductVO product, MultipartFile file) throws IllegalStateException, IOException {
		System.out.println(">>>Controller");
		
		System.out.println(product);
		if (file.isEmpty()) {
			
		} else {
			// 저장경로 지정
			String fileName = file.getOriginalFilename();
			String onlyFileName = fileName.substring(0, fileName.indexOf("."));
			String extension = fileName.substring(fileName.indexOf("."));
			String filePath = null;
			int count = 0;
			
	 		// 중복 파일명 확인
			while(true) {
				if(count == 0) {
					filePath = onlyFileName + extension;
				} else { 
					filePath = onlyFileName + "(" + count + ")" + extension;
				}
				System.out.println("파일 생성 ! ");
				File checkFile = new File(uploadPath + filePath);
				System.out.println("파일명 :" + filePath);
				if(!checkFile.exists()) {
					System.out.println("if문 안");
					break;
				}
				System.out.println("if문 지나오나?");
				count ++;
			}
			file.transferTo(new File(uploadPath + filePath));
			product.setpImg(filePath + fileName);
		}
		System.out.println(product.getpImg());
		int result = productService.insertProduct(product);
		System.out.println(result + "건 제안서 제출. ");
		
		
		return "/product/productDetail";
	}


}
