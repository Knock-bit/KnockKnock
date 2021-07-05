package com.knockknock.campaign.funding;

import java.sql.Date;

public class FundingVO {
	private int cfIdx;
	private int cpIdx;
	private String cfGoal;
	private String cfTitle;
	private String cfContent;
	private Date cfEnddate;
	private Date cfStartdate;
	private int cfGoalpoint;
	private int cfCollected;
	private String cfStatus;
	private String cfFile;
	private int ccIdx;  
	private int uIdx;   // 주최자 유저번호	
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String hostNickname; // JOIN - 주최자 닉네임
	private String category; // JOIN - 카테고리명
	private int userCount; // JOIN - 참여자 수
	
	
	public FundingVO() {}


	public FundingVO(int cfIdx, int cpIdx, String cfGoal, String cfTitle, String cfContent, Date cfEnddate,
			Date cfStartdate, int cfGoalpoint, int cfCollected, String cfStatus, String cfFile, int ccIdx, int uIdx,
			String keyword1, String keyword2, String keyword3, String hostNickname, String category, int userCount) {
		super();
		this.cfIdx = cfIdx;
		this.cpIdx = cpIdx;
		this.cfGoal = cfGoal;
		this.cfTitle = cfTitle;
		this.cfContent = cfContent;
		this.cfEnddate = cfEnddate;
		this.cfStartdate = cfStartdate;
		this.cfGoalpoint = cfGoalpoint;
		this.cfCollected = cfCollected;
		this.cfStatus = cfStatus;
		this.cfFile = cfFile;
		this.ccIdx = ccIdx;
		this.uIdx = uIdx;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.hostNickname = hostNickname;
		this.category = category;
		this.userCount = userCount;
	}


	public int getCfIdx() {
		return cfIdx;
	}


	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
	}


	public int getCpIdx() {
		return cpIdx;
	}


	public void setCpIdx(int cpIdx) {
		this.cpIdx = cpIdx;
	}


	public String getCfGoal() {
		return cfGoal;
	}


	public void setCfGoal(String cfGoal) {
		this.cfGoal = cfGoal;
	}


	public String getCfTitle() {
		return cfTitle;
	}


	public void setCfTitle(String cfTitle) {
		this.cfTitle = cfTitle;
	}


	public String getCfContent() {
		return cfContent;
	}


	public void setCfContent(String cfContent) {
		this.cfContent = cfContent;
	}


	public Date getCfEnddate() {
		return cfEnddate;
	}


	public void setCfEnddate(Date cfEnddate) {
		this.cfEnddate = cfEnddate;
	}


	public Date getCfStartdate() {
		return cfStartdate;
	}


	public void setCfStartdate(Date cfStartdate) {
		this.cfStartdate = cfStartdate;
	}


	public int getCfGoalpoint() {
		return cfGoalpoint;
	}


	public void setCfGoalpoint(int cfGoalpoint) {
		this.cfGoalpoint = cfGoalpoint;
	}


	public int getCfCollected() {
		return cfCollected;
	}


	public void setCfCollected(int cfCollected) {
		this.cfCollected = cfCollected;
	}


	public String getCfStatus() {
		return cfStatus;
	}


	public void setCfStatus(String cfStatus) {
		this.cfStatus = cfStatus;
	}


	public String getCfFile() {
		return cfFile;
	}


	public void setCfFile(String cfFile) {
		this.cfFile = cfFile;
	}


	public int getCcIdx() {
		return ccIdx;
	}


	public void setCcIdx(int ccIdx) {
		this.ccIdx = ccIdx;
	}


	public int getuIdx() {
		return uIdx;
	}


	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}


	public String getKeyword1() {
		return keyword1;
	}


	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}


	public String getKeyword2() {
		return keyword2;
	}


	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}


	public String getKeyword3() {
		return keyword3;
	}


	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}


	public String getHostNickname() {
		return hostNickname;
	}


	public void setHostNickname(String hostNickname) {
		this.hostNickname = hostNickname;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getUserCount() {
		return userCount;
	}


	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}


	@Override
	public String toString() {
		return "FundingVO [cfIdx=" + cfIdx + ", cpIdx=" + cpIdx + ", cfGoal=" + cfGoal + ", cfTitle=" + cfTitle
				+ ", cfContent=" + cfContent + ", cfEnddate=" + cfEnddate + ", cfStartdate=" + cfStartdate
				+ ", cfGoalpoint=" + cfGoalpoint + ", cfCollected=" + cfCollected + ", cfStatus=" + cfStatus
				+ ", cfFile=" + cfFile + ", ccIdx=" + ccIdx + ", uIdx=" + uIdx + ", keyword1=" + keyword1
				+ ", keyword2=" + keyword2 + ", keyword3=" + keyword3 + ", hostNickname=" + hostNickname + ", category="
				+ category + ", userCount=" + userCount + "]";
	}

	
	

}


