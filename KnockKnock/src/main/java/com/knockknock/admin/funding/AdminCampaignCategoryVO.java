package com.knockknock.admin.funding;

public class AdminCampaignCategoryVO {
	private int ccIdx;
	private String ccName;
	private int ccRn;
	
	public AdminCampaignCategoryVO() {}
	
	public AdminCampaignCategoryVO(int ccIdx, String ccName) {
		super();
		this.ccIdx = ccIdx;
		this.ccName = ccName;
	}

	public int getCcIdx() {
		return ccIdx;
	}

	public void setCcIdx(int ccIdx) {
		this.ccIdx = ccIdx;
	}

	public String getCcName() {
		return ccName;
	}

	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	

	public int getCcRn() {
		return ccRn;
	}

	public void setCcRn(int ccRn) {
		this.ccRn = ccRn;
	}

	@Override
	public String toString() {
		return "AdminCampaignCategory [ccIdx=" + ccIdx + ", ccName=" + ccName + "]";
	}
	 
}
