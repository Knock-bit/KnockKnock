package com.knockknock.review;

import java.util.Date;

public class ReviewVO {

	private int rIdx;
	private int pIdx;
	private String rWrite;
	private String rImg;
	private Date rRegdate;
	private String rStatus;
	private int uIdx;
	private int rRating;
	
	public ReviewVO() {}
	
	public ReviewVO(int rIdx, int pIdx, String rWrite, String rImg, Date rRegdate, String rStatus, int uIdx,
			int rRating) {
		super();
		this.rIdx = rIdx;
		this.pIdx = pIdx;
		this.rWrite = rWrite;
		this.rImg = rImg;
		this.rRegdate = rRegdate;
		this.rStatus = rStatus;
		this.uIdx = uIdx;
		this.rRating = rRating;
	}

	public int getrIdx() {
		return rIdx;
	}

	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}

	public String getrWrite() {
		return rWrite;
	}

	public void setrWrite(String rWrite) {
		this.rWrite = rWrite;
	}

	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}

	public Date getrRegdate() {
		return rRegdate;
	}

	public void setrRegdate(Date rRegdate) {
		this.rRegdate = rRegdate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public int getrRating() {
		return rRating;
	}

	public void setrRating(int rRating) {
		this.rRating = rRating;
	}

	@Override
	public String toString() {
		return "ReplyVO [rIdx=" + rIdx + ", pIdx=" + pIdx + ", rWrite=" + rWrite + ", rImg=" + rImg + ", rRegdate="
				+ rRegdate + ", rStatus=" + rStatus + ", uIdx=" + uIdx + ", rRating=" + rRating + "]";
	}
}