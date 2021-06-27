package com.knockknock.campaign;

import java.sql.Date;

public class CampaignVO {
	private int cIdx;
	private String ciTitle;
	private String ciContent;
	private String cGoal;
	private Date ci_enddate;
	private int ci_basepoint;
	private int ci_estimatedpoint;
	private char ci_status;
	private String ci_file;
	private String ci_emblem;
	private int u_idx;
	private String c_category;
	private int c_totpoint;
	private String c_keyword1;
	private String c_keyword2;
	private String c_keyword3;
	
	public CampaignVO() {	}
	
	
	
	public CampaignVO(int cIdx, String ciTitle, String ciContent, String cGoal, Date ci_enddate, int ci_basepoint,
			int ci_estimatedpoint, char ci_status, String ci_file, String ci_emblem, int u_idx, String c_category,
			int c_totpoint, String c_keyword1, String c_keyword2, String c_keyword3) {
		super();
		this.cIdx = cIdx;
		this.ciTitle = ciTitle;
		this.ciContent = ciContent;
		this.cGoal = cGoal;
		this.ci_enddate = ci_enddate;
		this.ci_basepoint = ci_basepoint;
		this.ci_estimatedpoint = ci_estimatedpoint;
		this.ci_status = ci_status;
		this.ci_file = ci_file;
		this.ci_emblem = ci_emblem;
		this.u_idx = u_idx;
		this.c_category = c_category;
		this.c_totpoint = c_totpoint;
		this.c_keyword1 = c_keyword1;
		this.c_keyword2 = c_keyword2;
		this.c_keyword3 = c_keyword3;
	}



	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
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
	public Date getCi_enddate() {
		return ci_enddate;
	}
	public void setCi_enddate(Date ci_enddate) {
		this.ci_enddate = ci_enddate;
	}
	public int getCi_basepoint() {
		return ci_basepoint;
	}
	public void setCi_basepoint(int ci_basepoint) {
		this.ci_basepoint = ci_basepoint;
	}
	public int getCi_estimatedpoint() {
		return ci_estimatedpoint;
	}
	public void setCi_estimatedpoint(int ci_estimatedpoint) {
		this.ci_estimatedpoint = ci_estimatedpoint;
	}
	public char getCi_status() {
		return ci_status;
	}
	public void setCi_status(char ci_status) {
		this.ci_status = ci_status;
	}
	public String getCi_file() {
		return ci_file;
	}
	public void setCi_file(String ci_file) {
		this.ci_file = ci_file;
	}
	public String getCi_emblem() {
		return ci_emblem;
	}
	public void setCi_emblem(String ci_emblem) {
		this.ci_emblem = ci_emblem;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public int getC_totpoint() {
		return c_totpoint;
	}
	public void setC_totpoint(int c_totpoint) {
		this.c_totpoint = c_totpoint;
	}
	public String getC_keyword1() {
		return c_keyword1;
	}
	public void setC_keyword1(String c_keyword1) {
		this.c_keyword1 = c_keyword1;
	}
	public String getC_keyword2() {
		return c_keyword2;
	}
	public void setC_keyword2(String c_keyword2) {
		this.c_keyword2 = c_keyword2;
	}
	public String getC_keyword3() {
		return c_keyword3;
	}
	public void setC_keyword3(String c_keyword3) {
		this.c_keyword3 = c_keyword3;
	}
	
	@Override
	public String toString() {
		return "campaign Title : " + ciTitle;
	}
	
	
	
	
}
