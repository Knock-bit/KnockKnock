package com.knockknock.campaign.funding;

import java.sql.Date;

public class FundingVO {
	private int cfIdx;
	private int cpIdx;
	private String cGoal;
	private String cfTitle;
	private String cfContent;
	private Date cfEndtime;
	private Date cfStarttime;
	private int cfGoalpoint;
	private int cfCollected;
	private String cfStatus;
	private String cfFile;
	private int ccIdx;  // 캠페인 카테고리 
	private int uIdx;   // 유저번호	
	private String hostNickname; // uIdx를 통해 불러온 주최자 닉네임
	private String category;
	
	
	public FundingVO() {}


	public FundingVO(int cfIdx, int cpIdx, String cGoal, String cfTitle, String cfContent, Date cfEndtime,
			Date cfStarttime, int cfGoalpoint, int cfCollected, String cfStatus, String cfFile, int ccIdx, int uIdx,
			String hostNickname, String category) {
		super();
		this.cfIdx = cfIdx;
		this.cpIdx = cpIdx;
		this.cGoal = cGoal;
		this.cfTitle = cfTitle;
		this.cfContent = cfContent;
		this.cfEndtime = cfEndtime;
		this.cfStarttime = cfStarttime;
		this.cfGoalpoint = cfGoalpoint;
		this.cfCollected = cfCollected;
		this.cfStatus = cfStatus;
		this.cfFile = cfFile;
		this.ccIdx = ccIdx;
		this.uIdx = uIdx;
		this.hostNickname = hostNickname;
		this.category = category;
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


	public String getcGoal() {
		return cGoal;
	}


	public void setcGoal(String cGoal) {
		this.cGoal = cGoal;
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


	public Date getCfEndtime() {
		return cfEndtime;
	}


	public void setCfEndtime(Date cfEndtime) {
		this.cfEndtime = cfEndtime;
	}


	public Date getCfStarttime() {
		return cfStarttime;
	}


	public void setCfStarttime(Date cfStarttime) {
		this.cfStarttime = cfStarttime;
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
	};
	
	
	
	
	

}


