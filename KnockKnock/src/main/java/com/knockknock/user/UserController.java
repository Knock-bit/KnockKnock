package com.knockknock.user;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.knockknock.user.impl.UserDAO;

@Controller
public class UserController {
   @Autowired
   private UserService userService;
   UserVO user = new UserVO();

   public UserController() {
      System.out.println("UserController생성자");
   }
   
   /*********창 이동하는 Controller**********/
   // 로그인하기로 이동
   @GetMapping("/user/login.do")
   public String moveLogin() {

      return "/user/login";
   }

   // 회원가입창으로 이동
   @GetMapping("/user/signup.do")
   public String moveSignup() {
      return "/user/signup";
   }

   //사업자로 회원가입창으로 이동
   @GetMapping("/user/signupseller.do")
   public String SellerSignup() {
      return "/user/signupseller";
   }
   
   //개인판매자 회원가입창으로 이동
   @GetMapping("/user/signupseller2.do")
   public String SellerSignup2() {
      return "/user/signupseller2";
   }

   // 회원가입 전 tnc로 이동
   @GetMapping("/user/tnc.do")
   public String tnc() {
      return "/user/tnc";
   }
   
   //sellerMain창이동
   @GetMapping("/user/sellerJoin.do")
   public String sellerJoin() {
      return "/user/sellerJoinMain";
   }
   // Seller tnc로 이동
   @GetMapping("/user/tncSeller.do")
   public String tncSeller() {
      return "/user/tncSeller";
   }
   
   // 네비바의 회원가입 버튼 눌렀을 때 이동하는 페이지
   @GetMapping("/user/signupNav.do")
   public String navSignup() {
      return "/user/NavBar-Join";
   }
   
   /*******기능구현 메서드********/
   // id중복체크
   @RequestMapping("/user/idCheck.do")
   @ResponseBody
   public int idCheck(String id) {
      UserVO vo = new UserVO();
      int result;
      result = userService.idCheck(id);
      return result;
   }

   // email중복체크
   @RequestMapping("/user/emailCheck.do")
   @ResponseBody
   public int emailCheck(String email) {
      UserVO vo = new UserVO();
      int result;
      result = userService.emailCheck(email);
      return result;
   }
   
   //닉네임 체크
   @RequestMapping("/user/nickCheck.do")
   @ResponseBody
   public int nickCheck(String nickname) {
      UserVO vo = new UserVO();
      int result;
      result = userService.nickCheck(nickname);
      return result;
   }

   // 로그인
   @RequestMapping(value ="/user/loginUser.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public UserVO loginUsers(@RequestBody UserVO vo, HttpSession session, String result) {      
      
      result = userService.checkApprLogin(vo);
      System.out.println("checkApprVO = "+result);
      UserVO user =  userService.selectlogin(vo);
      if (user != null) {
         System.out.println("로그인 성공");
         session.setAttribute("users", user);
      }
      
      System.out.println(user);

      return user; 
   }

   // 회원가입
   @PostMapping("/user/join.do")
   public String join(UserVO vo) throws Exception {
      System.out.println("회원가입 controller join()");
      System.out.println("vo: " + vo);
      vo.setuApprkey(create_key());
      System.out.println("APPRKEY="+vo.getuApprkey());
      userService.join(vo);
      userService.sendEmail(vo, "userApproval");
      
      return "/user/joinConfirm";
   }
   
   @RequestMapping(value = "/userApproval.do", method = RequestMethod.POST)
   public void userApproval(@ModelAttribute UserVO vo, HttpServletResponse response) throws Exception{
      userService.userApproval(vo, response);
   }

   public String create_key() throws Exception{
      String key="";
      Random random = new Random();
      
      for(int i=0; i<8; i++) {
         key+=random.nextInt(10);
      }
      return key;
   }
   
   // 로그아웃
   @RequestMapping("/user/logout.do")
   public ModelAndView logout(HttpSession session) {
      session.invalidate();
      ModelAndView mv = new ModelAndView("main/main");
      return mv;
   }
   
   //구글페이지 이동
   @GetMapping("/user/googleGo.do")
   public String googleGo() {
      return "/user/google";
   }
   
   //구글
   @RequestMapping(value="/user/googleLogin.do", method= {RequestMethod.POST, RequestMethod.GET})
   @ResponseBody
   public String googleLogin(String uEmail, HttpServletRequest request){
      UserVO vo = new UserVO();
      System.out.println("이메일: "+uEmail);      
      vo.setuEmail(uEmail);
      
      UserVO login = userService.googlelogin(vo);
      System.out.println(login);
       
      if(login==null) {
         System.out.println("아이디 없음");
         return "noid";
      }else {
         request.getSession().setAttribute("users", login);
         System.out.println("로그인 성공");
         return "idok";   
      }         
   } 
   
   // 카카오
   @RequestMapping(value = "/user/kakaologin.do", method = {RequestMethod.POST, RequestMethod.GET})
   @ResponseBody
   public String kakaologin(String uId, HttpServletRequest request, HttpSession session) {
      UserVO vo = new UserVO();
      System.out.println("1) 카카오톡 로그인 실행: " + uId);
      vo.setuEmail(uId);
      
      UserVO login = userService.kakaoLogin(vo);      
      if(login == null) {
         System.out.println("아이디가 없는 경우");
         return "noid";
      }else {
         request.getSession().setAttribute("users", login);
         System.out.println("로그인 성공");
         return "idok";
      }   
   } 
   
   //비밀번호 찾기
   @GetMapping("/user/findpwd.do")
   public String findpwd() {
      return "/user/findpwd";
   }
   
   @RequestMapping(value="/user/findpwdClick.do", method=RequestMethod.GET)
   public void findPwdGet() throws Exception{
      
   }
   @RequestMapping(value = "/user/findpwdClick.do", method = RequestMethod.POST)
   public void findPwPOST(@ModelAttribute UserVO userVO, HttpServletResponse resp) throws Exception{
      System.out.println("userVO = "+userVO);
      userService.findPwd(resp, userVO);
      
       
   }

}