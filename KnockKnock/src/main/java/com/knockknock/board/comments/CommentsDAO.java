package com.knockknock.board.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommentsVO> commentsList() {
		
		return mybatis.selectList("CommentsDAO.commentsList");
	}
	public int insertComments(CommentsVO vo) {
		return mybatis.insert("CommentsDAO.insertComments", vo);
	}
	public int updateComments(CommentsVO vo) {
		return mybatis.update("commentsDAO.updateComments", vo);
	}
	public int deleteComments(int bIdx) {
		return mybatis.delete("CommentsDAO.deleteComments", bIdx);
	}
}