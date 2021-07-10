package com.knockknock.board;

import java.util.List;

import com.knockknock.campaign.campaign.CampaignUserVO;
import com.knockknock.util.PagingVO;

public interface BoardService {
	public void insertBoard(BoardVO vo);
	public List<BoardVO> getBoardList(BoardVO vo);
	public BoardVO getBoard(int bIdx);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(int bIdx);
	public void updateHit(int bIdx);
	public void updateViews(int bIdx);
	public int countBoard();
	public List<BoardVO> getBoardList(PagingVO pvo);
	public List<BoardVO> getCampaignBoardList(int ciIdx);
	public List<BoardVO> getMyBoardList(CampaignUserVO campaignUser);
}