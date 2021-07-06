package com.knockknock.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.knockknock.user.UserVO;
import com.google.gson.JsonObject;
import com.knockknock.product.ProductVO;

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
	
	
	// 상품 등록(일반)
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
	
	@GetMapping("/productForm.do")
	public String productForm() {
		return "product/productForm";
	}
	
	@PostMapping("/productSummer.do")
	public String insertProposal(ProductVO product, MultipartFile file) throws IllegalStateException, IOException {
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
		System.out.println(result + "건 등록. ");
		
		
		return "/product/productResult";
	}
	
	
	
	
	// 상품등록 - 써머노트
	/*
	 * @PostMapping("/productSummer.do") public String insertProposal(ProductVO
	 * product) { System.out.println(product); int result =
	 * productService.insertProduct(product);
	 * 
	 * return "campaign/proposal/pResult"; }
	 */
	
	@RequestMapping(value="/uploadProductSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();

        
		 String fileRoot = "C:/knock2/summer/"; // 외부경로로 저장을 희망할때.
		 
		
		// 내부경로로 저장
		 
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/img/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("fileName", savedFileName);
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}
	
	
	
	


}
