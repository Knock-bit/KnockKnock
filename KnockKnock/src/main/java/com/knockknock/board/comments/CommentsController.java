package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping("/board/commentsList.do")
	@ResponseBody
	public List<CommentsVO> CommentsList(int bIdx, Model model) {
		
		return commentsService.commentsList(bIdx);
	}
	
	/*
	 * @RequestMapping(value="/board/insertComments.do", method=RequestMethod.POST)
	 * public String insertComments(CommentsVO vo, RedirectAttributes rttr) {
	 * 
	 * commentsService.insertComments(vo); rttr.addAttribute("bIdx", vo.getbIdx());
	 * 
	 * return "redirect:/board/getBoard"; }
	 */
	
	
	  @RequestMapping(value="/board/insertComments.do", method=RequestMethod.POST)
	  @ResponseBody
	  public int insertComments(CommentsVO vo) {
		  System.out.println(vo);
	  return commentsService.insertComments(vo); 
	  
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
	
	/*
	 * @PostMapping("/board/deleteComments.do")
	 * 
	 * @ResponseBody public String deleteComments(@RequestParam(value="mIdx") int
	 * mIdx, RedirectAttributes rttr) {
	 * 
	 * commentsService.deleteComments(mIdx); rttr.addFlashAttribute("result",
	 * "delete success");
	 * 
	 * return "redirect:/board/getBoard.do"; }
	 */
	
	
	@RequestMapping("/board/deleteComments.do")
	@ResponseBody
	public int deleteComments(@RequestParam(value="mIdx") int mIdx) {
		System.out.println("comments 삭제");
		/* rttr.addFlashAttribute("result", "delete success"); */
		
		return commentsService.deleteComments(mIdx);
	}
}