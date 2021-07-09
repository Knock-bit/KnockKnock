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
	public void insertComments(CommentsVO vo) {
		commentsDAO.insertComments(vo);
	}

	@Override
	public int updateComments(CommentsVO vo) {
		return commentsDAO.updateComments(vo);
	}

	@Override
	public void deleteComments(int bIdx) {
		commentsDAO.deleteComments(bIdx);
	}
}