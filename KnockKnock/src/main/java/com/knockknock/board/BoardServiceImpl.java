package com.knockknock.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knockknock.util.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		
		return boardDAO.getBoardList(vo);
	}

	@Override
	public BoardVO getBoard(int bIdx) {
		boardDAO.updateViews(bIdx);
		return boardDAO.getBoard(bIdx);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int bIdx) {
		boardDAO.deleteBoard(bIdx);
	}

	@Override
	public void updateHit(int bIdx) {
		boardDAO.updateHit(bIdx);
	}

	@Override
	public void updateViews(int bIdx) {
		boardDAO.updateViews(bIdx);	
	}

	@Override
	public int countBoard() {
		return boardDAO.countBoard();
	}

	@Override
	public List<BoardVO> getBoardList(PagingVO pvo) {
		return boardDAO.getBoardList(pvo);
	}
}