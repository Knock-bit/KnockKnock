package com.knockknock.admin.proposal;

import java.sql.Date;

public class AdminProposalVO {
	private int cpIdx;
	private String cpContent;
	private String cpGoal;
	private String cpTitle;
	private Date cpRegdate;
	private int cpGoalpoint;
	private String cpFile;
	private int uIdx;
	private String cpActive;
	private String cpKeyword1;
	private String cpKeyword2;
	private String cpKeyword3;

//	usertable join
	private String uNickname;
	private int cpRn;

	public AdminProposalVO() {
	};

	public AdminProposalVO(int cpIdx, String cpContent, String cpGoal, String cpTitle, Date cpRegdate, int cpGoalpoint,
			String cpFile, int uIdx, String cpActive, String cpKeyword1, String cpKeyword2, String cpKeyword3,
			String uNickname, int cpRn) {
		super();
		this.cpIdx = cpIdx;
		this.cpContent = cpContent;
		this.cpGoal = cpGoal;
		this.cpTitle = cpTitle;
		this.cpRegdate = cpRegdate;
		this.cpGoalpoint = cpGoalpoint;
		this.cpFile = cpFile;
		this.uIdx = uIdx;
		this.cpActive = cpActive;
		this.cpKeyword1 = cpKeyword1;
		this.cpKeyword2 = cpKeyword2;
		this.cpKeyword3 = cpKeyword3;
		this.uNickname = uNickname;
		this.cpRn = cpRn;
	}

	public int getCpIdx() {
		return cpIdx;
	}

	public void setCpIdx(int cpIdx) {
		this.cpIdx = cpIdx;
	}

	public String getCpContent() {
		return cpContent;
	}

	public void setCpContent(String cpContent) {
		this.cpContent = cpContent;
	}

	public String getCpGoal() {
		return cpGoal;
	}

	public void setCpGoal(String cpGoal) {
		this.cpGoal = cpGoal;
	}

	public String getCpTitle() {
		return cpTitle;
	}

	public void setCpTitle(String cpTitle) {
		this.cpTitle = cpTitle;
	}

	public Date getCpRegdate() {
		return cpRegdate;
	}

	public void setCpRegdate(Date cpRegdate) {
		this.cpRegdate = cpRegdate;
	}

	public int getCpGoalpoint() {
		return cpGoalpoint;
	}

	public void setCpGoalpoint(int cpGoalpoint) {
		this.cpGoalpoint = cpGoalpoint;
	}

	public String getCpFile() {
		return cpFile;
	}

	public void setCpFile(String cpFile) {
		this.cpFile = cpFile;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public String getCpActive() {
		return cpActive;
	}

	public void setCpActive(String cpActive) {
		this.cpActive = cpActive;
	}

	public String getCpKeyword1() {
		return cpKeyword1;
	}

	public void setCpKeyword1(String cpKeyword1) {
		this.cpKeyword1 = cpKeyword1;
	}

	public String getCpKeyword2() {
		return cpKeyword2;
	}

	public void setCpKeyword2(String cpKeyword2) {
		this.cpKeyword2 = cpKeyword2;
	}

	public String getCpKeyword3() {
		return cpKeyword3;
	}

	public void setCpKeyword3(String cpKeyword3) {
		this.cpKeyword3 = cpKeyword3;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public int getCpRn() {
		return cpRn;
	}

	public void setCpRn(int cpRn) {
		this.cpRn = cpRn;
	}

	@Override
	public String toString() {
		return "AdminProposalVO [cpIdx=" + cpIdx + ", cpContent=" + cpContent + ", cpGoal=" + cpGoal + ", cpTitle="
				+ cpTitle + ", cpRegdate=" + cpRegdate + ", cpGoalpoint=" + cpGoalpoint + ", cpFile=" + cpFile
				+ ", uIdx=" + uIdx + ", cpActive=" + cpActive + ", cpKeyword1=" + cpKeyword1 + ", cpKeyword2="
				+ cpKeyword2 + ", cpKeyword3=" + cpKeyword3 + ", uNickname=" + uNickname + ", cpRn=" + cpRn + "]";
	}

	

}
