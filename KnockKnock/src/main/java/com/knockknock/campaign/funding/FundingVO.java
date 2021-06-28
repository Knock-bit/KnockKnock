package com.knockknock.campaign.funding;

import java.sql.Date;

public class FundingVO {
	private int cfIdx;
	private int cpIdx;
	private String cfGoal;
	private String cfTitle;
	private String cfContent;
	private Date cfEndtime;
	private Date cfStarttime;
	private int cfGoalpoint;
	private int cfCollected;
	private char cfStatus;
	private String cfFile;
	private int cfCategory;
	private int hostIdx;
	private String hostNickname;
	
	public FundingVO() {
	}
	
	

	public FundingVO(int cfIdx, int cpIdx, String cfGoal, String cfTitle, String cfContent, Date cfEndtime,
			Date cfStarttime, int cfGoalpoint, int cfCollected, char cfStatus, String cfFile, int cfCategory,
			int hostIdx, String hostNickname) {
		super();
		this.cfIdx = cfIdx;
		this.cpIdx = cpIdx;
		this.cfGoal = cfGoal;
		this.cfTitle = cfTitle;
		this.cfContent = cfContent;
		this.cfEndtime = cfEndtime;
		this.cfStarttime = cfStarttime;
		this.cfGoalpoint = cfGoalpoint;
		this.cfCollected = cfCollected;
		this.cfStatus = cfStatus;
		this.cfFile = cfFile;
		this.cfCategory = cfCategory;
		this.hostIdx = hostIdx;
		this.hostNickname = hostNickname;
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

	public char getCfStatus() {
		return cfStatus;
	}

	public void setCfStatus(char cfStatus) {
		this.cfStatus = cfStatus;
	}

	public String getCfFile() {
		return cfFile;
	}

	public void setCfFile(String cfFile) {
		this.cfFile = cfFile;
	}

	public int getCfCategory() {
		return cfCategory;
	}

	public void setCfCategory(int cfCategory) {
		this.cfCategory = cfCategory;
	}

	public int getHostIdx() {
		return hostIdx;
	}

	public void setHostIdx(int hostIdx) {
		this.hostIdx = hostIdx;
	}



	public String getHostNickname() {
		return hostNickname;
	}



	public void setHostNickname(String hostNickname) {
		this.hostNickname = hostNickname;
	}
	
	

	
	
}
