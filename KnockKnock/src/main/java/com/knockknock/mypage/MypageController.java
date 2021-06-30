package com.knockknock.mypage;

import java.io.BufferedOutputStream; 
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.knockknock.campaign.ing.CampaignVO;
import com.knockknock.contact.ContactVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.PagingVO;

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

		/* => 아작스로 처리하기
		 * // 저장된 이메일(전체 유저 정보) 목록가져오기 List<String> emailList =
		 * mypageService.selectAllEmail(); System.out.println("emailList: " +
		 * emailList); model.addAttribute(emailList);
		 */
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
			int count = 0;
			
			// 중복 파일명 확인
			while (true) {
				

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

				count++;
			}

			vo.setuImg(fileName);
			vo.setuImgPath(filePath);

			System.out.println("fileName : " + fileName);
			System.out.println("filePath : " + filePath);

			// 파일 서버내 폴더로 복사
			try {
				// 스트림 생성
				FileOutputStream fos = new FileOutputStream(savePath + filePath); // 경로 + 파일명
				// 속도개선 보조 스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				// bos -> byte타입 변환
				byte[] bytes = file.getBytes(); // try/catch 추가 설정
				bos.write(bytes);
				bos.close();
				System.out.println("완료");

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
		System.out.println("vo :" + vo);
		return "/mypage/mypageList/updatePwd";
	}

	// 비밀번호 변경
	// @RequestMapping(value ="/updateMyPwd.do", method=RequestMethod.POST, produces
	// = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping("/updateMyPwd.do")
	@ResponseBody
	public String updateMyPwd(@ModelAttribute("users") UserVO vo) {
		System.out.println("비밀번호 변경");
		
		mypageService.updateMyPwd(vo);

		return "users";
	}
	
	
	// 포인트현황 페이지로 이동
	@GetMapping("/myPoint.do")
	public String myPointPage(@ModelAttribute("users")UserVO vo, Model model) {
		
		// 해당 유저의 STATUS가 1인 엠블럼 이미지 가져오기
		List<String> emImgList = mypageService.emblemList(vo);
		System.out.println("emImgList:" + emImgList);
		System.out.println("userVO : " + vo);
		model.addAttribute("emImgList", emImgList);
		return "/mypage/mypageList/myPointPage";
	}
	
	
	// 현재 참여중인 캠페인으로 이동
	@GetMapping("/myCampaignPage.do")
	public String myCampainging(@ModelAttribute("users")UserVO vo, Model model) {
		// 유저의 캠페인 리스트 가져오기
		List<CampaignVO> clist = mypageService.campaigningList(vo);
		System.out.println("clist:" + clist);
		
		
		model.addAttribute("clist",clist);
		return "/mypage/mypageList/mycaming";
	}
	
	// 종료된 캠페인 리스트
	@GetMapping("/myCampaignList.do")
	public String myEndCampaignList(@ModelAttribute("users")UserVO vo, Model model) {
		// 유저의 종료된 캠페인 리스트 가져오기
		List<CampaignVO> endlist = mypageService.endCampaignList(vo);
		System.out.println("endList:" + endlist);
		
		model.addAttribute("endlist",endlist);
		return "/mypage/mypageList/myCampaignList";
	}

	
	// 나의 문의내역
	@GetMapping("/myContactList.do")
	public String myContactList(@ModelAttribute("users")UserVO vo ,Model model, 
				@RequestParam(value="nowPage", required=false)String nowPage,
				@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		PagingVO pvo = new PagingVO();
		// 전체 게시물 수 구하기
		pvo.setTotal(mypageService.myCclistTot(vo));
		int total = pvo.getTotal();
		
		// 페이지당 글 갯수
		pvo.setCntPerPage(5);
		
		// 현재 페이지 구하기
		if(nowPage==null && cntPerPage==null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage ="5";
		}
		System.out.println("cntPerPage : " +cntPerPage);
		pvo = new  PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		Map<String, Integer> map = new HashMap<>();
		int start = pvo.getStart();
		int end = pvo.getEnd();
		int uIdx = vo.getuIdx();
		map.put("start", start);
		map.put("end", end);
		map.put("uIdx", uIdx);
		
		List<ContactVO> contactList = mypageService.myContactList(map);

		System.out.println("contactList : " + contactList);
		System.out.println("pvo : " + pvo);
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("contactList",contactList);
		return "/mypage/mypageList/myContactList";
	}
	
	// 내 문의내역 창으로 이동(상세글보기)
	@GetMapping("myQuestion.do")
	public String myQuestion (@ModelAttribute("users")UserVO vo ,Model model,
			@RequestParam(value="CT_IDX", required=false)String CT_IDX) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// 해당 캠페인 idx랑 유저 idx 넣어주기
		int ctIdx = Integer.parseInt(CT_IDX);
		int uIdx = vo.getuIdx();
		map.put("ctIdx", ctIdx);
		map.put("uIdx", uIdx);
		
		
		ContactVO cvo = mypageService.myQuestion(map);
		
		
		model.addAttribute("cvo", cvo);
		return "/mypage/mypageList/myContact";
	}
	
}