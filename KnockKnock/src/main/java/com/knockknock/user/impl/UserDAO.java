package com.knockknock.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.knockknock.user.UserVO;
    
@Repository
public class UserDAO {
   @Autowired
   private SqlSessionTemplate mybatis;
   
   //로그인
   public UserVO selectlogin(UserVO vo) {
      return mybatis.selectOne("UserVO.selectlogin", vo);      
   }
   
   public UserVO checkApprLogin(UserVO vo) {
	   return mybatis.selectOne("UserVO.checkApprLogin", vo);
   }
  
   //아이디 중복체크
   public int idCheck(String id) {
      String uId = mybatis.selectOne("UserVO.idCheck", id);

      int result;
      if(uId==null) {
         result = 1; //아이디 사용가능
      }else {
         result = 0; //아이디 사용불가
      }
      return result;      
   }
   //이메일 중복체크
   public int emailCheck(String email) {
      String uEmail = mybatis.selectOne("UserVO.emailCheck", email);
      
      int result;
      if(uEmail==null) {
         result=1;  //이메일 사용가능
      }else {
         result=0; //이메일 사용불가(중복)
      }
      return result;
   }
   //닉네임 중복체크
   public int nickCheck(String nickname) {
      String nickName = mybatis.selectOne("UserVO.nickCheck", nickname);
      int result;
      if(nickName==null) {
         result=1;//닉네임 사용 가능
      }else {
         result=0;//닉네임 사용불가(중복)
      }
      return result;
      
   }
   //회원가입
   public void join(UserVO vo) {
       mybatis.insert("UserVO.join", vo);
   }   
   
   //카카오
   public UserVO kakaologin(UserVO vo) {
      return mybatis.selectOne("UserVO.kakaologin", vo);
   }
   
   //구글
   public UserVO googlelogin(UserVO vo) {
      return mybatis.selectOne("UserVO.kakaologin", vo);
   } 
   
   //이메일찾기
   public int updatePw(UserVO vo) throws Exception {
      return mybatis.update("UserVO.updatePwd", vo);
   }
   
   //아이디에 해당하는 회원정보 가져오기
   public Map<String, String> readUserInfo(UserVO vo) throws Exception {
      UserVO userVO = mybatis.selectOne("UserVO.readUserInfo", vo);
      System.out.println(mybatis);
      System.out.println("DAO의 리턴값은 = "+userVO);      
      Map<String, String> map = new HashMap<String, String>();
      System.out.println(map.isEmpty());
      if(userVO==null) {
         return null;  
      }else {
         String uEmail = userVO.getuEmail();
         String uId = userVO.getuId();
         map.put("uId", uId);
         map.put("uEmail", uEmail);

         return map;
      }
       
   } 
   
   //회원 인증 이메일
   @Transactional
   public int userApproval(UserVO vo) throws Exception {
	   System.out.println("회원인증중 DAO= "+mybatis.update("UserVO.userApproval", vo));
	   return mybatis.update("UserVO.userApproval", vo);
   }
   
   
   
   
}