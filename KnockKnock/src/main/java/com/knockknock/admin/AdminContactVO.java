package com.knockknock.admin;

import java.sql.Date;

public class AdminContactVO {
	private int ctIdx;
	private String ctTitle;
	private String ctContent;
	private int uIdx;
	private Date ctWritedate;
	private int ctResp;
	private String ctcIdx;

	private int ctRn; // rownum 처리
	private String uNickname;
	private String uImgpath;
	private String ctcName;
	private String uEmail;
	
	public AdminContactVO() {
		super();
	}

	public AdminContactVO(int ctIdx, String ctTitle, String ctContent, int uIdx, Date ctWritedate, int ctResp,
			String ctcIdx, int ctRn) {
		super();
		this.ctIdx = ctIdx;
		this.ctTitle = ctTitle;
		this.ctContent = ctContent;
		this.uIdx = uIdx;
		this.ctWritedate = ctWritedate;
		this.ctResp = ctResp;
		this.ctcIdx = ctcIdx;
		this.ctRn = ctRn;
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

	public Date getCtWritedate() {
		return ctWritedate;
	}

	public void setCtWritedate(Date ctWritedate) {
		this.ctWritedate = ctWritedate;
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

	public int getCtRn() {
		return ctRn;
	}

	public void setCtRn(int ctRn) {
		this.ctRn = ctRn;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuImgpath() {
		return uImgpath;
	}

	public void setuImgpath(String uImgpath) {
		this.uImgpath = uImgpath;
	}

	public String getCtcName() {
		return ctcName;
	}

	public void setCtcName(String ctcName) {
		this.ctcName = ctcName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	@Override
	public String toString() {
		return "AdminContactVO [ctIdx=" + ctIdx + ", ctTitle=" + ctTitle + ", ctContent=" + ctContent + ", uIdx=" + uIdx
				+ ", ctWritedate=" + ctWritedate + ", ctResp=" + ctResp + ", ctcIdx=" + ctcIdx + ", ctRn=" + ctRn
				+ ", uNickname=" + uNickname + ", uImgpath=" + uImgpath + ", ctcName=" + ctcName + ", uEmail=" + uEmail
				+ "]";
	}


	

}
