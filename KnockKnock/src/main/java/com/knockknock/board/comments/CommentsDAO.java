package com.knockknock.board.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommentsVO> commentsList(int bIdx) {
		
		return mybatis.selectList("CommentsDAO.commentsList", bIdx);
	}
	public void insertComments(CommentsVO vo) {
		mybatis.insert("CommentsDAO.insertComments", vo);
	}
	public int updateComments(CommentsVO vo) {
		return mybatis.update("CommentsDAO.updateComments", vo);
	}
	public int deleteComments(int bIdx) {
		return mybatis.delete("CommentsDAO.deleteComments", bIdx);
	}
}