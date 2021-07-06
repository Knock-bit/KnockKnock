package com.knockknock.board.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("/commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDAO commentsDAO;

	@Override
	public List<CommentsVO> commentsList(CommentsVO vo) {
		
		return commentsDAO.commentsList(vo);
	}

	@Override
	public void insertComments(CommentsVO vo) {
		commentsDAO.insertComments(vo);
	}

	@Override
	public void updateComments(CommentsVO vo) {
		commentsDAO.updateComments(vo);
	}

	@Override
	public void deleteComments(int bIdx) {
		commentsDAO.deleteComments(bIdx);
	}
}