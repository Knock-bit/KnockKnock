package com.knockknock.campaign.ing;

import java.sql.Date;

public class CampaignVO {
	private int ciIdx;
	private String ciTitle;
	private String ciContent;
	private String ciGoal;
	private Date ciEnddate;
	private int ciBasepoint;
	private int ciEstimatedpoint;
	private int ciStatus;
	private String ciFile;
	private String ciEmblem;
	private int hostIdx;
	private String ciCategory;
	private int ciTotpoint;
	private String ciKeyword1;
	private String ciKeyword2;
	private String ciKeyword3;
	private int cfIdx;
	
	public CampaignVO() {	}
	
	
	
	
	public CampaignVO(int ciIdx, String ciTitle, String ciContent, String ciGoal, Date ciEnddate, int ciBasepoint,
			int ciEstimatedpoint, int ciStatus, String ciFile, String ciEmblem, int hostIdx, String ciCategory,
			int ciTotpoint, String ciKeyword1, String ciKeyword2, String ciKeyword3, int cfIdx) {
		super();
		this.ciIdx = ciIdx;
		this.ciTitle = ciTitle;
		this.ciContent = ciContent;
		this.ciGoal = ciGoal;
		this.ciEnddate = ciEnddate;
		this.ciBasepoint = ciBasepoint;
		this.ciEstimatedpoint = ciEstimatedpoint;
		this.ciStatus = ciStatus;
		this.ciFile = ciFile;
		this.ciEmblem = ciEmblem;
		this.hostIdx = hostIdx;
		this.ciCategory = ciCategory;
		this.ciTotpoint = ciTotpoint;
		this.ciKeyword1 = ciKeyword1;
		this.ciKeyword2 = ciKeyword2;
		this.ciKeyword3 = ciKeyword3;
		this.cfIdx = cfIdx;
	}




	public int getCiIdx() {
		return ciIdx;
	}




	public void setCiIdx(int ciIdx) {
		this.ciIdx = ciIdx;
	}

	public String getCiTitle() {
		return ciTitle;
	}

	public void setCiTitle(String ciTitle) {
		this.ciTitle = ciTitle;
	}

	public String getCiContent() {
		return ciContent;
	}

	public void setCiContent(String ciContent) {
		this.ciContent = ciContent;
	}

	public String getCiGoal() {
		return ciGoal;
	}

	public void setCiGoal(String ciGoal) {
		this.ciGoal = ciGoal;
	}

	public Date getCiEnddate() {
		return ciEnddate;
	}

	public void setCiEnddate(Date ciEnddate) {
		this.ciEnddate = ciEnddate;
	}

	public int getCiBasepoint() {
		return ciBasepoint;
	}

	public void setCiBasepoint(int ciBasepoint) {
		this.ciBasepoint = ciBasepoint;
	}

	public int getCiEstimatedpoint() {
		return ciEstimatedpoint;
	}

	public void setCiEstimatedpoint(int ciEstimatedpoint) {
		this.ciEstimatedpoint = ciEstimatedpoint;
	}

	public int getCiStatus() {
		return ciStatus;
	}

	public void setCiStatus(int ciStatus) {
		this.ciStatus = ciStatus;
	}

	public String getCiFile() {
		return ciFile;
	}

	public void setCiFile(String ciFile) {
		this.ciFile = ciFile;
	}

	public String getCiEmblem() {
		return ciEmblem;
	}

	public void setCiEmblem(String ciEmblem) {
		this.ciEmblem = ciEmblem;
	}

	public int getHostIdx() {
		return hostIdx;
	}

	public void setHostIdx(int hostIdx) {
		this.hostIdx = hostIdx;
	}

	public String getCiCategory() {
		return ciCategory;
	}

	public void setCiCategory(String ciCategory) {
		this.ciCategory = ciCategory;
	}

	public int getCiTotpoint() {
		return ciTotpoint;
	}

	public void setCiTotpoint(int ciTotpoint) {
		this.ciTotpoint = ciTotpoint;
	}

	public String getCiKeyword1() {
		return ciKeyword1;
	}

	public void setCiKeyword1(String ciKeyword1) {
		this.ciKeyword1 = ciKeyword1;
	}

	public String getCiKeyword2() {
		return ciKeyword2;
	}

	public void setCiKeyword2(String ciKeyword2) {
		this.ciKeyword2 = ciKeyword2;
	}

	public String getCiKeyword3() {
		return ciKeyword3;
	}

	public void setCiKeyword3(String ciKeyword3) {
		this.ciKeyword3 = ciKeyword3;
	}

	public int getCfIdx() {
		return cfIdx;
	}

	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
	}

	@Override
	public String toString() {
		return "campaign Title : " + ciTitle;
	}
	
	
	
	
}
