package com.knockknock.campaign.ing;

import java.sql.Date;

public class CampaignVO {
	
	private int ciIdx;
	private int cfIdx;
	private String ciTitle;
	private String ciContent;
	private String cGoal;
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
	private String hostNickname; // 주최자 닉네임
	private String category; // 카테고리명
	private int userCount; // 사용자수


	public CampaignVO() {	}

	public CampaignVO(int ciIdx, String ciTitle, String ciContent, String cGoal, Date ciStartdate, Date ciEnddate,
			int ciBasepoint, int ciEstimatedpoint, int ciStatus, String ciFile, String ciEmblem, int uIdx,
			String ccIdx, int cTotpoint, String cKeyword1, String cKeyword2, String cKeyword3, int cfIdx, String hostNickname, String category
			, int userCount) {
		super();
		this.ciIdx = ciIdx;
		this.ciTitle = ciTitle;
		this.ciContent = ciContent;
		this.cGoal = cGoal;
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
		this.hostNickname = hostNickname;
		this.category = category;
		this.userCount = userCount;
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


	public String getcGoal() {
		return cGoal;
	}


	public void setcGoal(String cGoal) {
		this.cGoal = cGoal;
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

	public String getCcIdx() {
		return ccIdx;
	}

	public void setCcIdx(String ccIdx) {
		this.ccIdx = ccIdx;
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
	
	

	
	
}
