package com.knockknock.board.comments;

import java.util.List;

public interface CommentsService {

	public List<CommentsVO> commentsList(int bIdx);
	public int insertComments(CommentsVO vo);
	public int updateComments(CommentsVO vo);
	public int deleteComments(int mIdx);
}