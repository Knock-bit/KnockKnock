//package com.knockknock.board.comments;
//
//import java.util.List;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.knockknock.board.CommentsVO;
//
//@Repository
//public class CommentsDAO {
//	@Autowired
//	private SqlSessionTemplate mybatis;
//	
//	//댓글목록보기
//	public List<CommentsVO> commentsList(CommentsVO vo) {
//		
//		return mybatis.selectList("commentsDAO.", vo);
//	}
//	//댓글 작성
//	public void insertComments(CommentsVO vo) {
//		mybatis.insert("commentsDAO.insertComments", vo);
//	}
//	//댓글 수정
//	public void updateComments(CommentsVO vo) {
//		mybatis.update("commentsDAO.updateComments", vo);
//	}
//	//댓글 삭제
//	public void deleteComments(CommentsVO vo) {
//		mybatis.delete("commentsDAO.deleteComments", vo);
//	}
//}