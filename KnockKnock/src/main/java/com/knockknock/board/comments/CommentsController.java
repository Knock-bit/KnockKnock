package com.knockknock.board.comments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
	
	@PostMapping("/board/insertComments.do")
	public String insertComments(CommentsVO vo) {
		commentsService.insertComments(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	@PutMapping("/board/updateComments.do")
	public String updateComments(@ModelAttribute("comments") CommentsVO vo) {
		commentsService.updateComments(vo);
		
		return "redirect:getBoardList.do";
	}
	
	@DeleteMapping("/board/deleteComments.do")
	public String deleteComments(int bIdx) {
		commentsService.deleteComments(bIdx);
		
		return "redirect:/board/getBoardList.do";
	}
}
