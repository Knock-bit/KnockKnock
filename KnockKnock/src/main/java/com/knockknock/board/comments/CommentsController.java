package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
//	
//	@RequestMapping("/board/commentsList.do")
//	@ResponseBody
//	public List<CommentsVO> CommentsList(int bIdx, Model model) {
//		
//		return commentsService.commentsList(bIdx);
//	}
//	
//	@RequestMapping("/board/commentsList.do")
//	@ResponseBody
//	public List<CommentsVO> CommentsList(int bIdx, Model model) {
//		
//		return commentsService.commentsList(bIdx);
//	}
//	
//	@RequestMapping("/board/insertComments.do")
//	@ResponseBody
//	public int insertComments(@RequestParam(value="bIdx") int bIdx, 
//			@RequestParam(value="cContent") String cContent, int uIdx) {
//			
//		CommentsVO vo = new CommentsVO();
//		vo.setbIdx(bIdx);
//		vo.setcContent(cContent);
//		vo.setuIdx(uIdx);
//		
//		return commentsService.insertComments(vo);
//		
//	}
	@RequestMapping(value="/board/insertComments.do", method=RequestMethod.POST)
	public String insertComments(CommentsVO vo, RedirectAttributes rttr) {
		
		commentsService.insertComments(vo);
		
		rttr.addAttribute("bIdx", vo.getbIdx());
	
		return "redirect:/board/getBoard";
		
	}
//	
//	@RequestMapping("/board/updateComments.do")
//	@ResponseBody
//	public int updateComments(@RequestParam(value="mIdx") int mIdx, 
//			@RequestParam(value="cContent") String cContent) {
//		
//		CommentsVO vo = new CommentsVO();
//		vo.setmIdx(mIdx);
//		vo.setcContent(cContent);
//		
//		return commentsService.updateComments(vo);
//	}
//	
//	@RequestMapping("/board/deleteComments.do/{mIdx}")
//	@ResponseBody
//	public int deleteComments(@PathVariable int mIdx) {
//
//		return 	commentsService.deleteComments(mIdx);
//	}
}