package com.knockknock.campaign;

import java.sql.Date;

public class CampaignNomineeVO {
	private int cIdx;
	private String cGoal;
	private String cnTitle;
	private String cnContent;
	private Date cnEndtime;
	private Date cnStarttime;
	private int cnCollected;
	private String cStatus;
	private String cnFile;
	private String cnCategory;
	private String cnGoal;
	private int cpIdx;
	
	public CampaignNomineeVO() {
	}
	
	public CampaignNomineeVO(int cIdx, String cGoal, String cnTitle, String cnContent, Date cnEndtime, Date cnStarttime,
			int cnCollected, String cStatus, String cnFile, String cnCategory, String cnGoal, int cpIdx) {
		super();
		this.cIdx = cIdx;
		this.cGoal = cGoal;
		this.cnTitle = cnTitle;
		this.cnContent = cnContent;
		this.cnEndtime = cnEndtime;
		this.cnStarttime = cnStarttime;
		this.cnCollected = cnCollected;
		this.cStatus = cStatus;
		this.cnFile = cnFile;
		this.cnCategory = cnCategory;
		this.cnGoal = cnGoal;
		this.cpIdx = cpIdx;
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public String getcGoal() {
		return cGoal;
	}
	public void setcGoal(String cGoal) {
		this.cGoal = cGoal;
	}
	public String getCnTitle() {
		return cnTitle;
	}
	public void setCnTitle(String cnTitle) {
		this.cnTitle = cnTitle;
	}
	public String getCnContent() {
		return cnContent;
	}
	public void setCnContent(String cnContent) {
		this.cnContent = cnContent;
	}
	public Date getCnEndtime() {
		return cnEndtime;
	}
	public void setCnEndtime(Date cnEndtime) {
		this.cnEndtime = cnEndtime;
	}
	public Date getCnStarttime() {
		return cnStarttime;
	}
	public void setCnStarttime(Date cnStarttime) {
		this.cnStarttime = cnStarttime;
	}
	public int getCnCollected() {
		return cnCollected;
	}
	public void setCnCollected(int cnCollected) {
		this.cnCollected = cnCollected;
	}
	public String getcStatus() {
		return cStatus;
	}
	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}
	public String getCnFile() {
		return cnFile;
	}
	public void setCnFile(String cnFile) {
		this.cnFile = cnFile;
	}
	public String getCnCategory() {
		return cnCategory;
	}
	public void setCnCategory(String cnCategory) {
		this.cnCategory = cnCategory;
	}
	public String getCnGoal() {
		return cnGoal;
	}
	public void setCnGoal(String cnGoal) {
		this.cnGoal = cnGoal;
	}
	public int getCpIdx() {
		return cpIdx;
	}
	public void setCpIdx(int cpIdx) {
		this.cpIdx = cpIdx;
	}
	
	
	
}
