
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
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;
import com.knockknock.campaign.proposal.ProposalVO;
import com.google.gson.Gson;
import com.knockknock.board.BoardVO;
import com.knockknock.campaign.campaign.CampaignVO;
import com.knockknock.contact.ContactVO;
import com.knockknock.user.UserController;
import com.knockknock.user.UserVO;
import com.knockknock.util.PagingVO;
import com.knockknock.util.PointVO;

@Controller
//@SessionAttributes("users")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	// 마이페이지 임시 메인으로 이동
	/*
	 * @GetMapping("/myPage.do") public String moveMypage(Model model, HttpSession
	 * session) { int uIdx = 1; UserVO user = mypageService.selectOneUser(uIdx);
	 * session.setAttribute("users", user); return "/mypage/mypage"; }
	 */

	// 내 정보 수정으로 이동
	@GetMapping("/updateMyInfo.do")
	public String updateMypage(@ModelAttribute("users")UserVO vo, Model model, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("users");
		
		user = mypageService.selectOneUser(user.getuIdx());
		model.addAttribute("users",user);
		
		return "/mypage/mypageList/updateMyInfo";
	}
	// 이메일 중복 체크
	@GetMapping("emailCheck.do")
	@ResponseBody
	public int emailCheck(String email) {
		
		int result = mypageService.emailCheck(email);
		
		return result;
	}

	// 내 정보 수정 정보 받아오기
	@PostMapping("/updateMyInfoBtn.do")
	public String updateMyInfo(UserVO vo, MultipartFile file, HttpServletRequest request, HttpSession session) {
		// 파일처리
		if (file.isEmpty()) {

		} else {
			// 저장경로 지정
			String savePath = request.getSession().getServletContext().getRealPath("/resource/img/upload/");
			// 실제 파일명
			String fileName = file.getOriginalFilename();
			System.out.println("savepath : " + savePath);
			System.out.println("filename : " + fileName);

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
		UserVO userVO = (UserVO) session.getAttribute("users");
		int idx = userVO.getuIdx();
		vo.setuIdx(idx);
		int result = mypageService.updateMyInfo(vo);

		userVO = mypageService.selectOneUser(idx);
		

		session.setAttribute("users", userVO);
		return "/mypage/mypageList/updateMyInfo";
	}

	// 비밀번호 변경 페이지로 이동
	@GetMapping("/updatePwd.do")
	public String updatePwd(HttpSession session) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		session.setAttribute("users", vo);
		
		return "/mypage/mypageList/updatePwd";
	}

	// 비밀번호 변경
	// @RequestMapping(value ="/updateMyPwd.do", method=RequestMethod.POST, produces
	// = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping("/updateMyPwd.do")
	@ResponseBody
	public String updateMyPwd(UserVO vo, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("users");
		int uIdx = user.getuIdx();
		vo.setuIdx(uIdx);
		mypageService.updateMyPwd(vo);

		return "users";
	}
	
	
	// 포인트현황 페이지로 이동
	@GetMapping("/myPoint.do")
	public String myPointPage(UserVO vo, Model model, HttpSession session) {
		
		// 유저 정보 가져오기
		UserVO user = (UserVO) session.getAttribute("users");
		user = mypageService.selectOneUser(user.getuIdx());
		
		
		// 해당 유저의 STATUS가 1인 엠블럼 이미지 가져오기
		List<String> emImgList = mypageService.emblemList(vo);

		// 나의 포인트 내역 가져오기
		vo.setuIdx(user.getuIdx());
		List<PointVO> pointList = mypageService.myPointList(vo);
		System.out.println("pointList : " + pointList);
		
		model.addAttribute("users",user);
		model.addAttribute("pointList", pointList);
		model.addAttribute("emImgList", emImgList);
		return "/mypage/mypageList/myPointPage";
	}
	
	
	// 현재 참여중인 캠페인으로 이동
	@GetMapping("/myCampaignPage.do")
	public String myCampainging( Model model, HttpSession session) {
		// 유저의 캠페인 리스트 가져오기
		
		UserVO vo = (UserVO) session.getAttribute("users");
		
		List<CampaignVO> clist = mypageService.campaigningList(vo);
		System.out.println("clist:"+clist);
		System.out.println("vo: " + vo);
		
		model.addAttribute("users", vo);
		model.addAttribute("clist",clist);
		return "/mypage/mypageList/mycaming";
	}
	
	// 종료된 캠페인 리스트
	@GetMapping("/myCampaignList.do")
	public String myEndCampaignList( Model model ,HttpSession session) {
		// 유저의 종료된 캠페인 리스트 가져오기
		UserVO vo = (UserVO) session.getAttribute("users");
		
		List<CampaignVO> endlist = mypageService.endCampaignList(vo);
		
		
		model.addAttribute("users", vo);
		model.addAttribute("endlist",endlist);
		return "/mypage/mypageList/myCampaignList";
	}

	
	// 나의 문의내역
	@GetMapping("/myContactList.do")
	public String myContactList(HttpSession session ,Model model, 
				@RequestParam(value="nowPage", required=false)String nowPage,
				@RequestParam(value="cntPerPage", required=false)String cntPerPage,
				@RequestParam(value="pnowPage", required=false)String pnowPage,
				@RequestParam(value="pcntPerPage", required=false)String pcntPerPage) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		
		PagingVO pvo = new PagingVO();
		// 문의내역 전체 게시물 수 구하기
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
		pvo = new  PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		Map<String, Integer> map = new HashMap<>();
		int start = pvo.getStart();
		int end = pvo.getEnd();
		int uIdx = vo.getuIdx();
		map.put("start", start);
		map.put("end", end);
		map.put("uIdx", uIdx);
		// 나의 문의내역
		List<ContactVO> contactList = mypageService.myContactList(map);

		

		// ======================
		// 제안글 전체 게시물 수 구하기
		PagingVO ppvo = new PagingVO();
		ppvo.setTotal(mypageService.myplistTot(vo));
		int ptotal = ppvo.getTotal();

		// 페이지당 글 갯수
		ppvo.setCntPerPage(5);

		// 현재 페이지 구하기
		if(pnowPage==null && pcntPerPage==null) {
			pnowPage = "1";
			pcntPerPage = "5";
		} else if(pnowPage == null) {
			pnowPage = "1";
		} else if (cntPerPage == null) {
			pcntPerPage ="5";
		}

		ppvo = new  PagingVO(ptotal, Integer.parseInt(pnowPage), Integer.parseInt(pcntPerPage));
		
		Map<String, Integer> pmap = new HashMap<>();
		int pstart = ppvo.getStart();
		int pend = ppvo.getEnd();
		int puIdx = vo.getuIdx();
		pmap.put("start", pstart);
		pmap.put("end", pend);
		pmap.put("uIdx", puIdx);

		// 나의 제안글
		List<ProposalVO> proposalList = mypageService.myProposalList(pmap);
		System.out.println("prolist:"+proposalList);
		
		
		model.addAttribute("users", vo);
		// 나의 문의내역
		model.addAttribute("pvo", pvo);
		model.addAttribute("contactList",contactList);
		// 나의 제안글
		model.addAttribute("ppvo", ppvo);
		model.addAttribute("proposalList",proposalList);
		return "/mypage/mypageList/myContactList";
	}
	
	// 내 문의내역 창으로 이동(상세글보기)
	@GetMapping("myQuestion.do")
	public String myQuestion (HttpSession session ,Model model,
			@RequestParam(value="ctIdx", required=false)String ctIdx) {
		UserVO vo = (UserVO) session.getAttribute("users");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// 해당 캠페인 idx랑 유저 idx 넣어주기
		int ctIdx2 = Integer.parseInt(ctIdx);
		int uIdx = vo.getuIdx();
		map.put("ctIdx", ctIdx2);
		map.put("uIdx", uIdx);
		
		ContactVO cvo = mypageService.myQuestion(map);
		
		model.addAttribute("users", vo);
		model.addAttribute("cvo", cvo);
		return "/mypage/mypageList/myContact";
	}
	
	// 나의 활동으로 이동
	@GetMapping("myActive.do")
	public String myActive(HttpSession session ,Model model) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		//List<BoardVO> bvo = mypageService.myActive(vo);
		model.addAttribute("users", vo);	
		return "/mypage/mypageList/myDiary";
	}
	// 내 캘린더 ajax
	@RequestMapping(value ="/myCal.do", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String selectEventList(HttpSession session ,Model model) {
		
		UserVO vo = (UserVO) session.getAttribute("users");
		List<BoardVO> bvo = mypageService.myActive(vo);

		
		 return new Gson().toJson(bvo);
	}
	
	// 회원탈퇴
	@GetMapping("deleteUsers.do")
	public ModelAndView deleteUsers(int uIdx, HttpSession session) {
		
		int result = mypageService.deleteUsers(uIdx);
		
		//UserController uc = new UserController();
		//uc.logout(session);
		
		
		session.invalidate();
		ModelAndView mv = new ModelAndView("main/main");
		
		return mv;
	}
}