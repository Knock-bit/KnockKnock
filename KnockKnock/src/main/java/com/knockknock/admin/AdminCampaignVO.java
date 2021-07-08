package com.knockknock.admin;

import java.sql.Date;

public class AdminCampaignVO {

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
	private String ccName;
	private int cTotpoint;
	private String ciKeyword1;
	private String ciKeyword2;
	private String ciKeyword3;
	private int ciRn;
	private String uNickname; // JOIN - 주최자 닉네임

	private String category; // JOIN - 카테고리명
	private int userCount; // JOIN - 사용자수

	public AdminCampaignVO() {
	}

	public AdminCampaignVO(int ciIdx, int cfIdx, String ciTitle, String ciContent, String cGoal, Date ciStartdate,
			Date ciEnddate, int ciBasepoint, int ciEstimatedpoint, int ciStatus, String ciFile, String ciEmblem,
			int uIdx, String ccName, int cTotpoint, String ciKeyword1, String ciKeyword2, String ciKeyword3,
			String uNickname, String category, int userCount) {
		super();
		this.ciIdx = ciIdx;
		this.cfIdx = cfIdx;
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
		this.ccName = ccName;
		this.cTotpoint = cTotpoint;
		this.ciKeyword1 = ciKeyword1;
		this.ciKeyword2 = ciKeyword2;
		this.ciKeyword3 = ciKeyword3;
		this.uNickname = uNickname;
		this.category = category;
		this.userCount = userCount;
	}

	public int getCiIdx() {
		return ciIdx;
	}

	public void setCiIdx(int ciIdx) {
		this.ciIdx = ciIdx;
	}

	public int getCfIdx() {
		return cfIdx;
	}

	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
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

	public String getCcName() {
		return ccName;
	}

	public void setCcName(String ccName) {
		this.ccName = ccName;
	}

	public int getcTotpoint() {
		return cTotpoint;
	}

	public void setcTotpoint(int cTotpoint) {
		this.cTotpoint = cTotpoint;
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

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
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

	public int getCiRn() {
		return ciRn;
	}

	public void setCiRn(int ciRn) {
		this.ciRn = ciRn;
	}

	@Override
	public String toString() {
		return "AdminCampaignVO [ciIdx=" + ciIdx + ", cfIdx=" + cfIdx + ", ciTitle=" + ciTitle + ", ciContent="
				+ ciContent + ", cGoal=" + cGoal + ", ciStartdate=" + ciStartdate + ", ciEnddate=" + ciEnddate
				+ ", ciBasepoint=" + ciBasepoint + ", ciEstimatedpoint=" + ciEstimatedpoint + ", ciStatus=" + ciStatus
				+ ", ciFile=" + ciFile + ", ciEmblem=" + ciEmblem + ", uIdx=" + uIdx + ", ccName=" + ccName
				+ ", cTotpoint=" + cTotpoint + ", ciKeyword1=" + ciKeyword1 + ", ciKeyword2=" + ciKeyword2
				+ ", ciKeyword3=" + ciKeyword3 + ", uNickname=" + uNickname + ", category=" + category
				+ ", userCount=" + userCount + "]";
	}

}
