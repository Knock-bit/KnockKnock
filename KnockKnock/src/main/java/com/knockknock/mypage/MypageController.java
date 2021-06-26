package com.knockknock.mypage;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	public String updateMyInfo(@ModelAttribute("users") UserVO vo, MultipartFile file, HttpServletRequest request) {
		System.out.println("내 정보 업데이트");
		System.out.println("vo: " + vo);

		// 파일처리
		if (file.isEmpty()) {

		} else {
			// 저장경로 지정
			String savePath = request.getSession().getServletContext().getRealPath("/resource/img/upload/");
			// 실제 파일명
			String fileName = file.getOriginalFilename();

			// 업로드한 파일명을 마지막 . 기준으로 분리 ex) img.png -> img/ .png
			// indexOf : .위치 추출 / subString : begin ~ end 까지 자르기
			String onlyFileName = fileName.substring(0, fileName.indexOf(".")); // img자르기
			String extention = fileName.substring(fileName.indexOf(".")); // .png 자르기
			String filePath = null;

			// 중복 파일명 확인
			while (true) {
				int count = 0;

				if (count == 0) {
					filePath = onlyFileName + extention;
				} else {
					filePath = onlyFileName + "(" + count + ")" + extention;

				}
				File checkFile = new File(savePath + filePath); // 경로 + 파일명
				// 중복이 아닌 경우 break;
				if (!checkFile.exists()) {
					break;
				}
				// 파일 복사
		  try {
			  file.transferTo(checkFile);
		  }catch (Exception e) {
			  
			  
		  }
				count++;
			}

			vo.setuImg(fileName);
			vo.setuImgPath(filePath);

			System.out.println("fileName : " + fileName);
			System.out.println("filePath : " + filePath);

			try {
				// 스트림 생성
				FileOutputStream fos = new FileOutputStream(new File(savePath + filePath)); // 경로 + 파일명
				// 속도개선 보조 스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				// bos -> byte타입 변환
				byte[] bytes = file.getBytes(); // try/catch 추가 설정
				bos.write(bytes);
				bos.close();

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		int result = mypageService.updateMyInfo(vo);

		System.out.println("result : " + result);

		return "/mypage/mypageList/updateMyInfo";
	}

	// 비밀번호 변경 페이지로 이동
	@GetMapping("/updatePwd.do")
	public String updatePwd(@ModelAttribute("users") UserVO vo) {

		return "/mypage/mypageList/updatePwd";
	}

	// 비밀번호 변경
	// @RequestMapping(value ="/updateMyPwd.do", method=RequestMethod.POST, produces
	// = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping("/updateMyPwd.do")
	@ResponseBody
	public String updateMyPwd(UserVO vo) {
		System.out.println("비밀번호 변경");

		mypageService.updateMyPwd(vo);

		return "users";
	}

}