package com.knockknock.admin;

public class AdminKeywordVO {
	private int kIdx; // index
	private String kContent; // keyword 내용
	private int kCount; // keyword 사용 횟수

	
	public AdminKeywordVO() {
		
	}
	
	public AdminKeywordVO(int kIdx, String kContent, int kCount) {
		this.kIdx = kIdx;
		this.kContent = kContent;
		this.kCount = kCount;
	}

	public int getkIdx() {
		return kIdx;
	}

	public void setkIdx(int kIdx) {
		this.kIdx = kIdx;
	}

	public String getkContent() {
		return kContent;
	}

	public void setkContent(String kContent) {
		this.kContent = kContent;
	}

	public int getkCount() {
		return kCount;
	}

	public void setkCount(int kCount) {
		this.kCount = kCount;
	}

	@Override
	public String toString() {
		return "AdminKeywordVO [kIdx=" + kIdx + ", kContent=" + kContent + ", kCount=" + kCount + "]";
	}

	
}
