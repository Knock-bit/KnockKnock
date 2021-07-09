package com.knockknock.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/review/reviewList.do")
	@ResponseBody
	public List<ReviewVO> reviewList(int rIdx) {
		
		return reviewService.reviewList(rIdx);
	}
	@RequestMapping(value="/review/insertReview.do", method=RequestMethod.POST)
	public String insertReview(ReviewVO vo, RedirectAttributes rttr) {
	
		reviewService.insertReview(vo);
		rttr.addAttribute("pIdx", vo.getpIdx());
		
		return "redirect:/review/reviewList";	
	}
	
	@RequestMapping("/review/updateComments.do")
	@ResponseBody
	public int updateReview(@RequestParam(value="rIdx") int rIdx, 
			@RequestParam(value="rWrite") String rWrite) {
		
		ReviewVO vo = new ReviewVO();
		vo.setrIdx(rIdx);
		vo.setrWrite(rWrite);
		
		return reviewService.updateReview(vo);
	}
	
	@PostMapping("/review/deleteComments.do")
	@ResponseBody
	public String deleteReview(@RequestParam(value="rIdx") int rIdx, 
			RedirectAttributes rttr) {

		reviewService.deleteReview(rIdx);
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/board/getBoard";
	}
}