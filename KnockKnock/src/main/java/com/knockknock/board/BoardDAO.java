package com.knockknock.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.knockknock.campaign.campaign.CampaignUserVO;
import com.knockknock.util.PagingVO;

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
	public BoardVO getBoard(int bIdx) {
		
		return mybatis.selectOne("BoardDAO.getBoard", bIdx);
	}
	
	//게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	//게시글 삭제
	public void deleteBoard(int bIdx) {
		mybatis.delete("BoardDAO.deleteBoard", bIdx);
	}
	
	//조회수처리
	public void updateViews(int bIdx) {
		mybatis.update("BoardDAO.updateViews", bIdx);
	}
			
	//추천수처리
	public void updateHit(int bIdx) {
		mybatis.update("BoardDAO.updateHit", bIdx);
	}
	
	//페이징 처리를 위한 총 게시글 갯수
	public int countBoard() {
		return mybatis.selectOne("Util.countBoard");
	}
	
	//페이징처리
	public List<BoardVO> getBoardList(PagingVO pvo) {
		return mybatis.selectList("Util.getBoardList", pvo);
	}


	public List<BoardVO> getCampaignBoardList(PagingVO pvo) {
		return mybatis.selectList("BoardDAO.getCampaignBoardList", pvo);
	}


	public List<BoardVO> getMyBoardList(CampaignUserVO cUser) {
		return mybatis.selectList("BoardDAO.getMyBoardList", cUser);
	}

	public int countCampaignBoard(int ciIdx) {
		return mybatis.selectOne("BoardDAO.countCampaignBoard", ciIdx);
	}

	public int countMyCampaignBoard(CampaignUserVO campaignUser) {
		return mybatis.selectOne("BoardDAO.countMyCampaignBoard", campaignUser);
	}

}