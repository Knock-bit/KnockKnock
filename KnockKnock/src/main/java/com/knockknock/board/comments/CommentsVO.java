package com.knockknock.board.comments;


import java.sql.Date;
import java.sql.Timestamp;

public class CommentsVO {
	private int mIdx;
	private String cContent;
	private int bIdx;
	private int uIdx;
	private String cRegdate;
//	private Timestamp cRegdate;
	private String uNickname;
	
	public CommentsVO() {}

	public CommentsVO(int mIdx, String cContent, int bIdx, int uIdx, String cRegdate, String uNickname) {
		super();
		this.mIdx = mIdx;
		this.cContent = cContent;
		this.bIdx = bIdx;
		this.uIdx = uIdx;
		this.cRegdate = cRegdate;
		this.uNickname = uNickname;
		
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
	/*
	 * public Timestamp getcRegdate() { return cRegdate; } public void
	 * setcRegdate(Timestamp cRegdate) { this.cRegdate = cRegdate; }
	 */
	
	
	
	public String getuNickname() {
		return uNickname;
	}

	public String getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(String cRegdate) {
		this.cRegdate = cRegdate;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	@Override
	public String toString() {
		return "CommentsVO [mIdx=" + mIdx + ", cContent=" + cContent + ", bIdx=" + bIdx + ", uIdx=" + uIdx
				+ ", cRegdate=" + cRegdate + "]";
	}
}