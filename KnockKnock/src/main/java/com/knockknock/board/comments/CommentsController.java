package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping("/board/commentsList.do")
	@ResponseBody
	public List<CommentsVO> CommentsList(int bIdx) {
		
		return commentsService.commentsList(bIdx);
	}
	
	@RequestMapping("/board/insertComments.do")
	public void  insertComments(@RequestParam(value="bIdx") int bIdx, 
			@RequestParam(value="cContent") String cContent, int uIdx) {
			
		CommentsVO vo = new CommentsVO();
		vo.setbIdx(bIdx);
		vo.setcContent(cContent);
		vo.setuIdx(uIdx);
		
		commentsService.insertComments(vo);
		
		
	}
	
	@RequestMapping("/board/updateComments.do")
	@ResponseBody
	public int updateComments(@RequestParam(value="mIdx") int mIdx, 
			@RequestParam(value="cContent") String cContent) {
		
		CommentsVO vo = new CommentsVO();
		vo.setmIdx(mIdx);
		vo.setcContent(cContent);
		
		return commentsService.updateComments(vo);
	}
	
	@PostMapping("/board/deleteComments.do")
	@ResponseBody
	public String deleteComments(int mIdx, RedirectAttributes rttr) {

		commentsService.deleteComments(mIdx);
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/board/list";
	}
}