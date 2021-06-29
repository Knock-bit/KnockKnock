package com.knockknock.campaign.funding;

public class FundingUserVO {
	private int uIdx;
	private int cfIdx;
	private int cfPoint;
	
	public FundingUserVO() { }
	
	public FundingUserVO(int uIdx, int cfIdx, int cfPoint) {
		super();
		this.uIdx = uIdx;
		this.cfIdx = cfIdx;
		this.cfPoint = cfPoint;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public int getCfIdx() {
		return cfIdx;
	}
	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
	}
	public int getCfPoint() {
		return cfPoint;
	}
	public void setCfPoint(int cfPoint) {
		this.cfPoint = cfPoint;
	}
	
	
	
}
