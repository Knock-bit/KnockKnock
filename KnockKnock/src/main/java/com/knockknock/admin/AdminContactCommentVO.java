package com.knockknock.admin;

import java.sql.Date;

public class AdminContactCommentVO {
	private int cmIdx;
	private String cmContent;
	private int ctIdx;
	private int uIdx;
	private Date cmWritedate;
	private int ctcIdx;
	
	public AdminContactCommentVO() {}

	public AdminContactCommentVO(int cmIdx, String cmContent, int ctIdx, int uIdx, Date cmWritedate, int ctcIdx) {
		super();
		this.cmIdx = cmIdx;
		this.cmContent = cmContent;
		this.ctIdx = ctIdx;
		this.uIdx = uIdx;
		this.cmWritedate = cmWritedate;
		this.ctcIdx = ctcIdx;
	}

	public int getCmIdx() {
		return cmIdx;
	}

	public void setCmIdx(int cmIdx) {
		this.cmIdx = cmIdx;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public int getCtIdx() {
		return ctIdx;
	}

	public void setCtIdx(int ctIdx) {
		this.ctIdx = ctIdx;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public Date getCmWritedate() {
		return cmWritedate;
	}

	public void setCmWritedate(Date cmWritedate) {
		this.cmWritedate = cmWritedate;
	}

	public int getCtcIdx() {
		return ctcIdx;
	}

	public void setCtcIdx(int ctcIdx) {
		this.ctcIdx = ctcIdx;
	}

	@Override
	public String toString() {
		return "AdminContactCommentVO [cmIdx=" + cmIdx + ", cmContent=" + cmContent + ", ctIdx=" + ctIdx + ", uIdx="
				+ uIdx + ", cmWritedate=" + cmWritedate + ", ctcIdx=" + ctcIdx + "]";
	};
	
	
	
	
}
