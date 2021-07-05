package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping("/CommentsList.do")
	public String CommentsList(CommentsVO vo, Model model) {
		List<CommentsVO> commentsList = commentsService.commentsList(vo);
		model.addAttribute("commentsList", commentsList);
		
		return "board/getBoard";
	}
	
	@PostMapping("/board/insertComments.do")
	public String insertComments(CommentsVO vo) {
		commentsService.insertComments(vo);
		
		return "redirect:/board/getBoard.do";
	}
	
//	@PostMapping("/board/updateComments.do")
//	public String updateComments(CommentsVO vo) {
//		commentsService.updateComments(vo);
//		
//		return "redirect:/board/getBoardList.do";
//	}
	
	@DeleteMapping("/board/deleteComments.do")
	public String deleteComments(int bIdx) {
		commentsService.deleteComments(bIdx);
		
		return "redirect:/board/getBoardList.do";
	}
}