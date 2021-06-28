package com.knockknock.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 등록
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	//게시글 전체 조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	
	//게시글 상세보기
	public BoardVO getBoard(BoardVO vo) {
		
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	//게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	//게시글 삭제
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
//	//조회수처리
//	public int updateHit(BoardVO vo) {
//		mybatis.upHit("BoardDAO.updateHit", vo);
//	}
	
	//추천수처리
	
	//댓글목록보기
	
	//댓글 수정
	
	//댓글 삭제
}