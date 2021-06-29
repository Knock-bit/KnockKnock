package com.knockknock.contact;

import java.sql.Date;

public class ContactVO {
	private int ctIdx;
	private String ctTitle;
	private String ctContent;
	private int uIdx;
	private Date ctWriteDate;
	private int ctResp;
	private String ctcIdx;
	private String ctReply;
	
	public ContactVO() {
		super();
	}
	public ContactVO(int ctIdx, String ctTitle, String ctContent, int uIdx, Date ctWriteDate, int ctResp, String ctcIdx,
			String ctReply) {
		super();
		this.ctIdx = ctIdx;
		this.ctTitle = ctTitle;
		this.ctContent = ctContent;
		this.uIdx = uIdx;
		this.ctWriteDate = ctWriteDate;
		this.ctResp = ctResp;
		this.ctcIdx = ctcIdx;
		this.ctReply = ctReply;
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
	public String getCtReply() {
		return ctReply;
	}
	public void setCtReply(String ctReply) {
		this.ctReply = ctReply;
	}
	@Override
	public String toString() {
		return "ContactVO [ctIdx=" + ctIdx + ", ctTitle=" + ctTitle + ", ctContent=" + ctContent + ", uIdx=" + uIdx
				+ ", ctWriteDate=" + ctWriteDate + ", ctResp=" + ctResp + ", ctcIdx=" + ctcIdx + ", ctReply=" + ctReply
				+ "]";
	}
	

}
