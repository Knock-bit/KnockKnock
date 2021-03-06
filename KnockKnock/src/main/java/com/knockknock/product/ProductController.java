package com.knockknock.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
@SessionAttributes("users")
public class ProductController {
   @Autowired
   private ProductService productService;
   private String uploadPath = "C:/knock2/product/";
   ProductVO product = new ProductVO();

   // SHOP메인페이지(전체품목 리스트로 가져오기)
//   @GetMapping("/productlist.do")
//   public String ProductList(Model model) {
//      List<ProductVO> plist = productService.ProductList();
//      model.addAttribute("plist", plist);
//      return "/product/productlist";
//   }
//   
   //카테고리별 리스트보기
   @RequestMapping(value ="/productlist.do", method=RequestMethod.GET)
    public String productCategory(Model model, ProductVO vo) {
      System.out.println("컨트롤러");
      List<ProductVO> plist = productService.categoryProduct(vo);
      
      model.addAttribute("plist", plist);
       
      return "product/productlist";
   }

   // 상품 목록(정보) 가져오기 - 임시
   @GetMapping("/productDetail.do")
   public String ProductDetail(Model model, int pIdx) {

      ProductVO pvo = productService.productDetail(pIdx);
      System.out.println("pvo : " + pvo);

      model.addAttribute("pvo", pvo);
      return "/product/productDetail";
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
         while (true) {
            if (count == 0) {
               filePath = onlyFileName + extension;
            } else {
               filePath = onlyFileName + "(" + count + ")" + extension;
            }
            System.out.println("파일 생성 ! ");
            File checkFile = new File(uploadPath + filePath);
            System.out.println("파일명 :" + filePath);
            if (!checkFile.exists()) {
               System.out.println("if문 안");
               break;
            }
            System.out.println("if문 지나오나?");
            count++;
         }
         file.transferTo(new File(uploadPath + filePath));
         product.setpImg(filePath + fileName);
      }
      System.out.println(product.getpImg());
      int result = productService.insertProduct(product);
      System.out.println(result + "건 제안서 제출. ");

      return "/seller/product/productDetail";
   }

   @GetMapping("/productForm.do")
   public String productForm() {
      return "seller/product/productForm";
   }

   @PostMapping("/productSummer.do")
   public String insertProposal(ProductVO product, MultipartFile file, Model model) throws IllegalStateException, IOException {
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
         while (true) {
            if (count == 0) {
               filePath = onlyFileName + extension;
            } else {
               filePath = onlyFileName + "(" + count + ")" + extension;
            }
            System.out.println("파일 생성 ! ");
            File checkFile = new File(uploadPath + filePath);
            System.out.println("파일명 :" + filePath);
            if (!checkFile.exists()) {
               System.out.println("if문 안");
               break;
            }
            System.out.println("if문 지나오나?");
            count++;
         }
         file.transferTo(new File(uploadPath + filePath));
         product.setpImg(filePath);
      }
      System.out.println(product.getpImg());
      int result = productService.insertProduct(product);
      System.out.println(result + "건 등록. ");
      
      int sIdx = product.getsIdx();
      List<ProductVO> myproducts = productService.manageMyproducts(sIdx);
      System.out.println("Myproduct = "+myproducts);
      model.addAttribute("myproducts", myproducts);
      
      return "/seller/product/productResult";
   }

   // 상품등록 - 써머노트
   /*
    * @PostMapping("/productSummer.do") public String insertProposal(ProductVO
    * product) { System.out.println(product); int result =
    * productService.insertProduct(product);
    * 
    * return "campaign/proposal/pResult"; }
    */

   @RequestMapping(value = "/uploadProductSummernoteImageFile.do", produces = "application/json; charset=utf8")
   @ResponseBody
   public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
         HttpServletRequest request) {
      JsonObject jsonObject = new JsonObject();

      String fileRoot = "C:/knock2/summer/"; // 외부경로로 저장을 희망할때.

      // 내부경로로 저장

      String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
      String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
      String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

      File targetFile = new File(fileRoot + savedFileName);
      try {
         InputStream fileStream = multipartFile.getInputStream();
         FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
         jsonObject.addProperty("url", "/img/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
         jsonObject.addProperty("responseCode", "success");
         jsonObject.addProperty("fileName", savedFileName);

      } catch (IOException e) {
         FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
         jsonObject.addProperty("responseCode", "error");
         e.printStackTrace();
      }
      String a = jsonObject.toString();
      System.out.println(a);
      return a;
   }
   
   @RequestMapping(value = "/seller/manageMyProducts.do", method = RequestMethod.GET)
   public String myProducts(HttpSession session, ProductVO vo, Model model, int sIdx){
      System.out.println("컨트롤러요");
      System.out.println("상품조회시 사용 sIdx="+sIdx);
      session.getAttribute("seller");
      List<ProductVO> myproducts = productService.manageMyproducts(sIdx);
      System.out.println("Myproduct = "+myproducts);
      model.addAttribute("myproducts", myproducts);
      return "/seller/product/productResult";
   }

}