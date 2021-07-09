package com.knockknock.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("/reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewVO> reviewList(int rIdx) {
		return reviewDAO.reviewList(rIdx);
	}
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
	
	@Override
	public int updateReview(ReviewVO vo) {
		return reviewDAO.updateReview(vo);
	}
	
	@Override
	public void deleteReview(int rIdx) {
		reviewDAO.deleteReivew(rIdx);
	}
}