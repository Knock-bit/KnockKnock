package com.knockknock.board;

import java.util.Date;

public class BoardVO {
	
	private int bIdx;
	private String bSubject;
	private String bContent;
	private int uIdx;
	private Date bRegdate;
	private int bHit;
	private int bViews;
	private int bCategory;
	private String bFile;
	private int ciIdx;
	private int sbIdx;
	
	public BoardVO() {}
	
	public BoardVO(int bIdx, String bSubject, String bContent, int uIdx, Date bRegdate, int bHit, int bViews,
			int bCategory, String bFile, int ciIdx, int sbIdx) {
		super();
		this.bIdx = bIdx;
		this.bSubject = bSubject;
		this.bContent = bContent;
		this.uIdx = uIdx;
		this.bRegdate = bRegdate;
		this.bHit = bHit;
		this.bViews = bViews;
		this.bCategory = bCategory;
		this.bFile = bFile;
		this.ciIdx = ciIdx;
		this.sbIdx = sbIdx;
	}

	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String getbSubject() {
		return bSubject;
	}
	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public Date getbRegdate() {
		return bRegdate;
	}
	public void setbRegdate(Date bRegdate) {
		this.bRegdate = bRegdate;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbViews() {
		return bViews;
	}
	public void setbViews(int bViews) {
		this.bViews = bViews;
	}
	public int getbCategory() {
		return bCategory;
	}
	public void setbCategory(int bCategory) {
		this.bCategory = bCategory;
	}
	public String getbFile() {
		return bFile;
	}
	public void setbFile(String bFile) {
		this.bFile = bFile;
	}
	public int getCiIdx() {
		return ciIdx;
	}
	public void setCiIdx(int ciIdx) {
		this.ciIdx = ciIdx;
	}
	public int getSbIdx() {
		return sbIdx;
	}
	public void setSbIdx(int sbIdx) {
		this.sbIdx = sbIdx;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bIdx=" + bIdx + ", bSubject=" + bSubject + ", bContent=" + bContent + ", uIdx=" + uIdx
				+ ", bRegdate=" + bRegdate + ", bHit=" + bHit + ", bViews=" + bViews + ", bCategory=" + bCategory
				+ ", bFile=" + bFile + ", ciIdx=" + ciIdx + ", sbIdx=" + sbIdx + "]";
	}
}