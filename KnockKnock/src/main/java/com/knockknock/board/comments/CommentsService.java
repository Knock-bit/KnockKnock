package com.knockknock.board.comments;

import java.util.List;

public interface CommentsService {

	public List<CommentsVO> commentsList(CommentsVO vo);
	public void insertComments(CommentsVO vo);
	public void updateComments(CommentsVO vo);
	public void deleteComments(int bIdx);
}
