package com.knockknock.admin;

import java.sql.Date;

public class AdminContactVO {
	private int ctIdx;
	private String ctTitle;
	private String ctContent;
	private int uIdx;
	private Date ctWriteDate;
	private int ctResp;
	private String ctcIdx;

	public AdminContactVO() {
		super();
	}

	public AdminContactVO(int ctIdx, String ctTitle, String ctContent, int uIdx, Date ctWriteDate, int ctResp,
			String ctcIdx) {
		super();
		this.ctIdx = ctIdx;
		this.ctTitle = ctTitle;
		this.ctContent = ctContent;
		this.uIdx = uIdx;
		this.ctWriteDate = ctWriteDate;
		this.ctResp = ctResp;
		this.ctcIdx = ctcIdx;
	}

	public int getCtIdx() {
		return ctIdx;
	}

	public void setCtIdx(int ctIdx) {
		this.ctIdx = ctIdx;
	}

	public String getCtTitle() {
		return ctTitle;
	}

	public void setCtTitle(String ctTitle) {
		this.ctTitle = ctTitle;
	}

	public String getCtContent() {
		return ctContent;
	}

	public void setCtContent(String ctContent) {
		this.ctContent = ctContent;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public Date getCtWriteDate() {
		return ctWriteDate;
	}

	public void setCtWriteDate(Date ctWriteDate) {
		this.ctWriteDate = ctWriteDate;
	}

	public int getCtResp() {
		return ctResp;
	}

	public void setCtResp(int ctResp) {
		this.ctResp = ctResp;
	}

	public String getCtcIdx() {
		return ctcIdx;
	}

	public void setCtcIdx(String ctcIdx) {
		this.ctcIdx = ctcIdx;
	}

	@Override
	public String toString() {
		return "AdminContactVO [ctIdx=" + ctIdx + ", ctTitle=" + ctTitle + ", ctContent=" + ctContent + ", uIdx=" + uIdx
				+ ", ctWriteDate=" + ctWriteDate + ", ctResp=" + ctResp + ", ctcIdx=" + ctcIdx + "]";
	}

}
