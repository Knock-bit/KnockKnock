package com.knockknock.board;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	BoardVO getBoard(int bIdx);
	void updateBoard(BoardVO vo);
	void deleteBoard(int bIdx);
	void updateHit(int bIdx);
	void updateViews(int bIdx);
}
