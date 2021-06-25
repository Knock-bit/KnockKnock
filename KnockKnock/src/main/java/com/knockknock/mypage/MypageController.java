package com.knockknock.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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

}