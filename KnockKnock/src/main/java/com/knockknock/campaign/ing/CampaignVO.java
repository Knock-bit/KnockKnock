package com.knockknock.campaign.ing;

import java.sql.Date;

public class CampaignVO {
	
	private int ciIdx;
	private int cfIdx;
	private String ciTitle;
	private String ciContent;
	private String ciGoal;
	private Date ciStartdate;
	private Date ciEnddate;
	private int ciBasepoint;
	private int ciEstimatedpoint;
	private int ciStatus;
	private String ciFile;
	private String ciEmblem;
	private int uIdx;
	private String ccIdx;
	private int cTotpoint;
	private String cKeyword1;
	private String cKeyword2;
	private String cKeyword3;


	public CampaignVO() {	}

	public CampaignVO(int ciIdx, String ciTitle, String ciContent, String ciGoal, Date ciStartdate, Date ciEnddate,
			int ciBasepoint, int ciEstimatedpoint, int ciStatus, String ciFile, String ciEmblem, int uIdx,
			String ccCategory, int cTotpoint, String cKeyword1, String cKeyword2, String cKeyword3, int cfIdx) {
		super();
		this.ciIdx = ciIdx;
		this.ciTitle = ciTitle;
		this.ciContent = ciContent;
		this.ciGoal = ciGoal;
		this.ciStartdate = ciStartdate;
		this.ciEnddate = ciEnddate;
		this.ciBasepoint = ciBasepoint;
		this.ciEstimatedpoint = ciEstimatedpoint;
		this.ciStatus = ciStatus;
		this.ciFile = ciFile;
		this.ciEmblem = ciEmblem;
		this.uIdx = uIdx;
		this.ccIdx = ccIdx;
		this.cTotpoint = cTotpoint;
		this.cKeyword1 = cKeyword1;
		this.cKeyword2 = cKeyword2;
		this.cKeyword3 = cKeyword3;
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


	public Date getCiStartdate() {
		return ciStartdate;
	}


	public void setCiStartdate(Date ciStartdate) {
		this.ciStartdate = ciStartdate;
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


	public int getuIdx() {
		return uIdx;
	}


	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}


	public int getcTotpoint() {
		return cTotpoint;
	}


	public void setcTotpoint(int cTotpoint) {
		this.cTotpoint = cTotpoint;
	}




	public String getCcCategory() {
		return ccIdx;
	}




	public void setCcCategory(String ccIdx) {
		this.ccIdx = ccIdx;
	}




	public String getcKeyword1() {
		return cKeyword1;
	}




	public void setcKeyword1(String cKeyword1) {
		this.cKeyword1 = cKeyword1;
	}




	public String getcKeyword2() {
		return cKeyword2;
	}




	public void setcKeyword2(String cKeyword2) {
		this.cKeyword2 = cKeyword2;
	}




	public String getcKeyword3() {
		return cKeyword3;
	}




	public void setcKeyword3(String cKeyword3) {
		this.cKeyword3 = cKeyword3;
	}




	public int getCfIdx() {
		return cfIdx;
	}


	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
	}
	
	

	
	
}
