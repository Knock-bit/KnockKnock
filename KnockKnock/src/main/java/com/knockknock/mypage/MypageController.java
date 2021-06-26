package com.knockknock.mypage;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.knockknock.user.UserVO;

@Controller
@SessionAttributes("users")
public class MypageController {
  
   @Autowired
   private MypageService mypageService;
   
   // 마이페이지 임시 메인으로 이동
   @GetMapping("/myPage.do")
   public String moveMypage(Model model) {
      int uIdx = 1;
      UserVO user = mypageService.selectOneUser(uIdx);
      model.addAttribute("users", user);
      return "/mypage/mypage";
   }
   
   // 내 정보 수정으로 이동
   @GetMapping("/updateMyInfo.do")
   public String updateMypage(UserVO vo, Model model) {
      
      model.addAttribute("users");
      return "/mypage/mypageList/updateMyInfo";
   }
   
   // 내 정보 수정 정보 받아오기
   @PostMapping("/updateMyInfoBtn.do")
   public String updateMyInfo(@ModelAttribute("users") UserVO vo, MultipartFile uImg) {
	  System.out.println("내 정보 업데이트");
	  System.out.println("vo: " + vo);
	  mypageService.updateMyInfo(vo);
	   
	   
	  return "/mypage/mypageList/updateMyInfo";
   }
 

   // 비밀번호 변경 페이지로 이동
   @GetMapping("/updatePwd.do")
   public String updatePwd(@ModelAttribute("users") UserVO vo) {
	   
	  return "/mypage/mypageList/updatePwd";
   }
   
   // 비밀번호 변경
   //@RequestMapping(value ="/updateMyPwd.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @PostMapping("/updateMyPwd.do")
   @ResponseBody
   public String updateMyPwd(UserVO vo) {
	   System.out.println("비밀번호 변경");

	   mypageService.updateMyPwd(vo);
	   
	   return "users";
   }
   
   
   
   
   
   
   
   
   
}