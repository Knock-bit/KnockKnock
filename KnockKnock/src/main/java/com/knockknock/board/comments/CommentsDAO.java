package com.knockknock.board.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommentsVO> commentsList(CommentsVO vo) {
		
		return mybatis.selectList("commentsDAO.", vo);
	}
	public void insertComments(CommentsVO vo) {
		mybatis.insert("commentsDAO.insertComments", vo);
	}
	public void updateComments(CommentsVO vo) {
		mybatis.update("commentsDAO.updateComments", vo);
	}
	public void deleteComments(int bIdx) {
		mybatis.delete("commentsDAO.deleteComments", bIdx);
	}
}