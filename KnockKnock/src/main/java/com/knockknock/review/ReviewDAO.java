package com.knockknock.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReview(ReviewVO vo) {
		mybatis.insert("ReviewDAO.insertReview", vo);
	}
	
	public int updateReview(ReviewVO vo) {
		
		return mybatis.update("ReviewDAO.updateReview", vo);
	}
	
	public void deleteReivew(int rIdx) {
		mybatis.delete("ReviewDAO.deleteReview", rIdx);
	}

	public List<ReviewVO> reviewList(int rIdx) {
		
		return mybatis.selectList("ReviewDAO.reviewList", rIdx);
	}
}