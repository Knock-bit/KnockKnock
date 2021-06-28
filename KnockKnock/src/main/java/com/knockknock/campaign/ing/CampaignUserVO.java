package com.knockknock.campaign.ing;

public class CampaignUserVO {
	private int ciIdx;
	private int uIdx;
	private char ciEmblem;
	private String nickname;
	
	public CampaignUserVO() {}
	
	public CampaignUserVO (int ciIdx, int uIdx, char ciEmblem, String nickname) {
		super();
		this.ciIdx = ciIdx;
		this.uIdx = uIdx;
		this.ciEmblem = ciEmblem;
		this.nickname = nickname;
	}

	
	public int getCiIdx() {
		return ciIdx;
	}
	public void setCiIdx(int ciIdx) {
		this.ciIdx = ciIdx;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public char getCiEmblem() {
		return ciEmblem;
	}
	public void setCiEmblem(char ciEmblem) {
		this.ciEmblem = ciEmblem;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return this.nickname;
	}
	
}
