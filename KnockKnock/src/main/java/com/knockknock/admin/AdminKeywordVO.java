package com.knockknock.admin;

public class AdminKeywordVO {
	private int kIdx; // index
	private String kContent; // keyword 내용
	private int kCount; // keyword 사용 횟수

	// 검색 조건용 필드 추가 
	private String searchCondition;
	private String searchKeyword;

	
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

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "AdminKeywordVO [kIdx=" + kIdx + ", kContent=" + kContent + ", kCount=" + kCount + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}


	
}
