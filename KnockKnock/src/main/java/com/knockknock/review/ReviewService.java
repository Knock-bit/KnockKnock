package com.knockknock.review;

import java.util.List;

public interface ReviewService {
	public void insertReview(ReviewVO vo);
	public List<ReviewVO> reviewList(int rIdx);
	public int updateReview(ReviewVO vo);
	public void deleteReview(int rIdx);
}
