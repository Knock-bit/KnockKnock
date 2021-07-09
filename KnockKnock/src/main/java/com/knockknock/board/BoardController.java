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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.knockknock.util.PagingVO;

@Controller
public class BoardController {
	
	private String uploadPath = "C:/Mystudy/";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/getBoardList.do")
	public String getBoardList(int ciIdx, BoardVO vo, Model model, PagingVO pvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		System.out.println("getBoardList 실행");
		System.out.println(ciIdx);
		int total = boardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1"; 
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("ciIdx", ciIdx);
		model.addAttribute("paging", pvo);
		model.addAttribute("getBoardList", boardService.getBoardList(pvo));
		/* List<BoardVO> boardList = boardService.getBoardList(pvo); */
		List<BoardVO> boardList = boardService.getCampaignBoardList(ciIdx);
		model.addAttribute("getBoardList", boardList);
		
		return "board/getBoardList";	
	}
	
	@GetMapping("/board/moveInsert.do")
	public String moveInsert(int ciIdx, Model model) {
		System.out.println("moveInsert! ciIdx:" + ciIdx);
		model.addAttribute("ciIdx", ciIdx);
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
			
			while(true) {
				if(count == 0) {
					fPath = onlyFName + extension;
				} else { 
					fPath = onlyFName + "(" + count + ")" + extension;
				}
				File cFile = new File(uploadPath + fPath);
				if(!cFile.exists()) {
					break;
				}
				count ++;
			}
			file.transferTo(new File(uploadPath + fPath));
			vo.setbFile(fPath + fName);
		}
		boardService.insertBoard(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	@RequestMapping("/board/getBoard.do")
	public String getBoard(int bIdx, Model model, BoardVO vo) {
		BoardVO board = boardService.getBoard(bIdx);
		model.addAttribute("board", board);
		
		return "board/getBoard";
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
	public String deleteBoard(@RequestParam("bIdx") int bIdx) {
		boardService.deleteBoard(bIdx);
		
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
	public String updateHit (@RequestParam int bIdx) {
		boardService.updateHit(bIdx);
		
		return "forward:/board/getBoardList.do";
	}
	
	public static Map<String ,String> pageSet(String nowPage, String cntPerPage) {
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
	
	@RequestMapping("/board/myViewBoard.do")
	public String myViewBoard(BoardVO vo, Model model, PagingVO pvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = boardService.countBoard();
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
		List<BoardVO> myViewBoard = boardService.getBoardList(pvo);
		model.addAttribute("myViewBoard", myViewBoard);
		
		return "board/getBoardList";	
	}
	
	  @RequestMapping(value="/uploadBoardlSummernoteImageFile.do", produces = "application/json; charset=utf8")
	  @ResponseBody
	  public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		  JsonObject jsonObject = new JsonObject();

	      String fileRoot = "C:/knock2/summer/"; // 외부경로로 저장을 희망할때.
	      
	      // 내부경로로 저장
//	      String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//	      String fileRoot = contextRoot+"resources/fileupload/";
	       
	      // 내부경로 저장 -> 혜민누나버전 
//	      String savePath = request.getSession().getServletContext().getRealPath("/resource/img/upload/");

	      String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
	      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
	      String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명
	      
	      File targetFile = new File(fileRoot + savedFileName);   
	      try {
	         InputStream fileStream = multipartFile.getInputStream();
	         FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
	         jsonObject.addProperty("url", "/img/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
	         jsonObject.addProperty("responseCode", "success");
	         jsonObject.addProperty("fileName", savedFileName);
	            
	      } catch (IOException e) {
	         FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
	         jsonObject.addProperty("responseCode", "error");
	         e.printStackTrace();
	      }
	      String a = jsonObject.toString();
	      System.out.println(a);
	      return a;
	   }
	  
	  @PostMapping("/board/boardSummer.do")
	  public String insertBoardSummer(BoardVO vo, Model model, MultipartFile file) throws IllegalStateException, IOException {
		  System.out.println(vo);
		  int ciIdx = vo.getCiIdx();
	      boardService.insertBoard(vo);
	      model.addAttribute("ciIdx", ciIdx);
	      return "campaign/ing/detailWithBoard";
	  }
}