package com.knockknock.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.knockknock.campaign.campaign.CampaignService;
import com.knockknock.campaign.campaign.CampaignUserVO;
import com.knockknock.campaign.campaign.CampaignVO;
import com.knockknock.campaign.funding.FundingService;
import com.knockknock.campaign.funding.FundingUserVO;
import com.knockknock.user.UserVO;
import com.knockknock.util.PagingVO;

@Controller
public class BoardController {

	private String uploadPath = "C:/Mystudy/";

	@Autowired
	private BoardService boardService;
	@Autowired
	private CampaignService campaignService;
	@Autowired
	private FundingService fundingService;

	@RequestMapping("/board/getBoardList.do")
	public String getBoardList( 
			int ciIdx, BoardVO vo, Model model, PagingVO pvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		System.out.println("getBoardList 실행");
		System.out.println(ciIdx);
//		int total = boardService.countBoard();
		int total = boardService.countCampaignBoard(ciIdx);
		
		// 현재 페이지 구하기
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),String.valueOf(ciIdx));
		
		model.addAttribute("ciIdx", ciIdx);
		model.addAttribute("paging", pvo);
		/* model.addAttribute("getBoardList", boardService.getBoardList(pvo)); */
		/* List<BoardVO> boardList = boardService.getBoardList(pvo); */
		List<BoardVO> boardList = boardService.getCampaignBoardList(pvo);
		System.out.println(boardList);
		model.addAttribute("getBoardList", boardList);

		return "board/getBoardList";
	}

	@GetMapping("/board/moveInsert.do")
	public String moveInsert(int ciIdx, int cfIdx, Model model) {
		System.out.println("moveInsert! ciIdx:" + ciIdx);
		model.addAttribute("ciIdx", ciIdx);
		model.addAttribute("cfIdx", cfIdx);
		return "board/insertBoard";
	}

	@PostMapping("/board/insertBoard.do")
	public String insertBoard(BoardVO vo, Model model, MultipartFile file) throws IllegalStateException, IOException {

		System.out.println(">> vo : " + vo);

		if (file.isEmpty()) {
		} else {
			String fName = file.getOriginalFilename();
			String onlyFName = fName.substring(0, fName.indexOf("."));
			String extension = fName.substring(fName.indexOf("."));
			String fPath = null;
			int count = 0;

			while (true) {
				if (count == 0) {
					fPath = onlyFName + extension;
				} else {
					fPath = onlyFName + "(" + count + ")" + extension;
				}
				File cFile = new File(uploadPath + fPath);
				if (!cFile.exists()) {
					break;
				}
				count++;
			}
			file.transferTo(new File(uploadPath + fPath));
			vo.setbFile(fPath + fName);
		}
		boardService.insertBoard(vo);

		return "redirect:/board/getBoardList.do";
	}

	@RequestMapping("/board/getBoard.do")
	public String getBoard(int bIdx, Model model, BoardVO vo) {
		System.out.println("bIdx: " + bIdx);
		BoardVO board = boardService.getBoard(bIdx);
		System.out.println(board);
		model.addAttribute("board", board);

		return "board/getBoard";
	}

	@GetMapping("/board/modifyBoard.do")
	public String moveModify(@RequestParam("bIdx") int bIdx, Model model) {
		System.out.println("수정창으로 이동");
		BoardVO vo = boardService.getBoard(bIdx);
		model.addAttribute("board", vo);
		return "board/getModify";
	}
	
	@GetMapping("/board/updateBoard.do")
	public void updateBoardGet(@RequestParam("bIdx") int bIdx, Model model) {
		BoardVO vo = boardService.getBoard(bIdx);
		model.addAttribute("getBoard", vo);
	}

	@PostMapping("/board/updateBoard.do")
	public String updateBoardPost(BoardVO vo) {
		boardService.updateBoard(vo);

		return "redirect:/board/getBoard.do?bIdx=" + vo.getbIdx();
	}

	@RequestMapping("/board/deleteBoard.do")
	public String deleteBoard(int bIdx, int ciIdx, Model model) {
		System.out.println("deleteBoard 실행");
		boardService.deleteBoard(bIdx);
		model.addAttribute("ciIdx", ciIdx);

		return "redirect:/board/getBoardList.do";
	}

//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "BSUBJECT");
//		conditionMap.put("내용", "BCONTENT");
//		return conditionMap;
//	}

	@RequestMapping("/board/updateHit.do")
	@ResponseBody
	public int updateHit(@RequestParam int bIdx, Model model) {
		boardService.updateHit(bIdx);
		BoardVO board = boardService.getBoard(bIdx);
		int bHit = board.getbHit();
		System.out.println("bHit:" + bHit);
		return bHit;
	}

	public static Map<String, String> pageSet(String nowPage, String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		Map<String, String> ncPage = new HashMap<String, String>();
		ncPage.put("nowPage", nowPage);
		ncPage.put("cntPerPage", cntPerPage);

		return ncPage;
	}

	@RequestMapping("/board/myBoardList.do")
	public String myViewBoard(CampaignUserVO campaignUser, Model model, PagingVO pvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		System.out.println(campaignUser);
		int total = boardService.countMyCampaignBoard(campaignUser);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("getBoardList", boardService.getBoardList(pvo));
		List<BoardVO> myViewBoard = boardService.getMyBoardList(campaignUser);
		/* List<BoardVO> myViewBoard = boardService.getBoardList(pvo); */
		model.addAttribute("getBoardList", myViewBoard);

		return "board/getBoardList";
	}

	/*
	 * @RequestMapping("/board/myViewBoard.do") public String
	 * myViewBoard(CampaignUserVO campaignUser, Model model, PagingVO pvo,
	 * 
	 * @RequestParam(value = "nowPage", required = false) String nowPage,
	 * 
	 * @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
	 * 
	 * int total = boardService.countBoard(); if (nowPage == null && cntPerPage ==
	 * null) { nowPage = "1"; cntPerPage = "5"; } else if (nowPage == null) {
	 * nowPage = "1"; } else if (cntPerPage == null) { cntPerPage = "5"; } pvo = new
	 * PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	 * model.addAttribute("paging", pvo); model.addAttribute("getBoardList",
	 * boardService.getBoardList(pvo)); List<BoardVO> myViewBoard =
	 * boardService.getMyBoardList(campaignUser); List<BoardVO> myViewBoard =
	 * boardService.getBoardList(pvo); model.addAttribute("myViewBoard",
	 * myViewBoard);
	 * 
	 * return "board/getBoardList"; }
	 */
	
	@RequestMapping(value = "/uploadBoardSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:/knock2/summer/"; // 외부경로로 저장을 희망할때.

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

	@PostMapping("/board/boardSummer.do")
	public String insertBoardSummer(BoardVO vo, CampaignUserVO campaignUser, FundingUserVO fundingUser, Model model,
			MultipartFile file) throws IllegalStateException, IOException {
		
		System.out.println(vo);
		int ciIdx = vo.getCiIdx();
		System.out.println(fundingUser);
		System.out.println(campaignUser);
		CampaignUserVO cUser = campaignService.selectCampaignUser(campaignUser);
		FundingUserVO fUser = fundingService.selectFundingUser(fundingUser);

		System.out.println(cUser);
		System.out.println(fUser);
		// 캠페인 참여
		// -> 차감할 포인트를 정하기 위해
		// 후기게시판으로 이동하기 전에 사용자 식별 필요.

		if (cUser != null) {
			System.out.println("캠페인 참여한 적이 있음");
			// 식별(1) 캠페인에 참여한 적 있는 경우
			// -> 포인트 차감 0
		} else {
			System.out.println("캠페인 참여한 적이 없음");
			// 캠페인 참여 처음
			// 공통 => campaign user에 추가
			System.out.println("캠페인 첫 참여. CAMPAIGN_USER 테이블에 추가");
			campaignService.insertCampaignUser(campaignUser);
			// 식별(2) 펀딩에 참여하였는가
			// -> 펀딩 참여시 0 포인트 차감
			// -> 펀딩 미참여시 300 포인트 차감
			if (fUser == null) {
				// 펀딩에 미참여한 경우 => 300포인트 차감
				System.out.println("펀딩 미참여. 300포인트 차감");
				campaignService.updateParticipatePoint(campaignUser);
			}
		}
		
		//공통 - estimatedPoint += 10
		boardService.updateEstimatedPoint(ciIdx);
		boardService.insertBoard(vo);
		CampaignVO campaign = campaignService.selectOneCampaign(ciIdx);
		model.addAttribute("ciIdx", ciIdx);
		model.addAttribute("campaign", campaign);
		return "campaign/ing/detailWithBoard";
	}
}