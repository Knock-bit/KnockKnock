//package com.knockknock.board.comments;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//@Controller
//@SessionAttributes("/comments")
//public class CommentsController {
//	@Autowired
//	private CommentsService commentsService;
//	
////	@PostMapping("/insertComments.do")
////	public String insertComments(CommentsVO vo) {
////		commentsService.insertComments(vo);
////		
////		return "redirect:getBoardList.do";
////	}
////	
////	@PutMapping("/updateComments.do")
////	public String updateComments(@ModelAttribute("comments") CommentsVO vo) {
////		commentsService.updateComments(vo);
////		
////		return "redirect:getBoardList.do";
////	}
////	
////	@DeleteMapping("/deleteComments.do")
////	public String deleteComments(CommentsVO vo) {
////		commentsService.deleteComments(vo);
////		
////		return "redirect:getBoardList.do";
////	}
//}
