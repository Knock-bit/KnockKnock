package com.knockknock.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.knockknock.board.comments.CommentsService;
import com.knockknock.board.comments.CommentsVO;
import com.knockknock.util.PagingVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	private String uploadPath = "C:/Mystudy/";
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping("/board/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model, PagingVO pvo,
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
		List<BoardVO> boardList = boardService.getBoardList(pvo);
		model.addAttribute("getBoardList", boardList);
		
		return "board/getBoardList";	
	}
	
	@GetMapping("/board/moveInsert.do")
	public String moveInsert(BoardVO vo) {
		
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
		
		List<CommentsVO> commentsList = commentsService.commentsList(vo.getbIdx());
		model.addAttribute("commentsList", commentsList);
		
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
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "BSUBJECT");
		conditionMap.put("내용", "BCONTENT");
		return conditionMap;
	}
	
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
}