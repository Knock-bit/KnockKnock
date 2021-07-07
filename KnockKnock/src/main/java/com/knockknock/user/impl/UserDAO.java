package com.knockknock.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.user.UserVO;
    
@Repository
public class UserDAO {
   @Autowired
   private SqlSessionTemplate mybatis;
   
   //로그인
   public UserVO selectlogin(UserVO vo) {
      System.out.println("로그인 mybatis "+mybatis);
      vo = mybatis.selectOne("UserVO.selectlogin", vo);
      //System.out.println("DAO = " +vo);
      return vo;      
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
   public UserVO readUserInfo(UserVO vo) throws Exception {
      UserVO userVO = mybatis.selectOne("UserVO.readUserInfo", vo);
      System.out.println(mybatis);
      System.out.println("DAO의 리턴값은 = "+userVO);
 
      System.out.println("받은 이메일 값: " +userVO.getuEmail());
      System.out.println("받은 아이디 값: "+userVO.getuId());
      
      //DAO
      return userVO;
   }
   
   
   
   
   
}