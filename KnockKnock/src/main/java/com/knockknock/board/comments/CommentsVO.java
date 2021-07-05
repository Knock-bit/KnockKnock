package com.knockknock.board.comments;


import java.sql.Timestamp;

public class CommentsVO {
	private int mIdx;
	private String cContent;
	private int bIdx;
	private int uIdx;
	private Timestamp cRegdate;
	
	public CommentsVO() {}

	public CommentsVO(int mIdx, String cContent, int bIdx, int uIdx, Timestamp cRegdate) {
		super();
		this.mIdx = mIdx;
		this.cContent = cContent;
		this.bIdx = bIdx;
		this.uIdx = uIdx;
		this.cRegdate = cRegdate;
	}

	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public Timestamp getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(Timestamp cRegdate) {
		this.cRegdate = cRegdate;
	}

	@Override
	public String toString() {
		return "CommentsVO [mIdx=" + mIdx + ", cContent=" + cContent + ", bIdx=" + bIdx + ", uIdx=" + uIdx
				+ ", cRegdate=" + cRegdate + "]";
	}
}