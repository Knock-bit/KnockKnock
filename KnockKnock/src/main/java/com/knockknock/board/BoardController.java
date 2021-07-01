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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private String uploadPath = "C:/mystudy/temp";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		List<BoardVO> boardList = boardService.getBoardList(vo);
		model.addAttribute("boardList", boardList);
		
		return "board/getBoardList";	
	}
	
	@GetMapping("/moveInsert.do")
	public String moveInsert(BoardVO vo) {
		
		return "board/insertBoard";
	}
	
	@PostMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		System.out.println("POST vo : " + vo);
		
		boardService.insertBoard(vo);
		return "redirect:/board/getBoardList.do";
		
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(int bIdx, Model model) {
		BoardVO board = boardService.getBoard(bIdx);
		model.addAttribute("board", board);
		
		return "board/getBoard";
	}
	@GetMapping("/updateBoard.do")
	public void updateBoardGet(@RequestParam("bIdx") int bIdx, Model model) {
		BoardVO vo2 = boardService.getBoard(bIdx);
		model.addAttribute("getBoard", vo2);
	}	
	
	@PostMapping("/updateBoard.do")
	public String updateBoardPost(BoardVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("vo : " + vo);
		boardService.updateBoard(vo);
		return "redirect:/board/getBoard.do?bIdx=" + vo.getbIdx();
	}	
	
	@RequestMapping("/deleteBoard.do")
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
	
	@RequestMapping("/hitBoard.do")
	public String updateHit (@RequestParam int bIdx) {
		boardService.updateHit(bIdx);
		
		return "forward:/board/getBoardList.do";
	}
}
