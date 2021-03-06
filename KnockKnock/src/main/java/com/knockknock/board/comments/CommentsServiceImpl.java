package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("/commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDAO commentsDAO;

	@Override
	public List<CommentsVO> commentsList(int bIdx) {
		return commentsDAO.commentsList(bIdx);
	}

	@Override
	public int insertComments(CommentsVO vo) {
		return commentsDAO.insertComments(vo);
	}

	@Override
	public int updateComments(CommentsVO vo) {
		return commentsDAO.updateComments(vo);
	}

	@Override
	public int deleteComments(int bIdx) {
		return commentsDAO.deleteComments(bIdx);
	}
}