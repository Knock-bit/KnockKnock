package com.knockknock.board;

public class SubtitleVO {
	
	private int sbIdx;
	private String sbName;
	
	public SubtitleVO() {}

	public SubtitleVO(int sbIdx, String sbName) {
		super();
		this.sbIdx = sbIdx;
		this.sbName = sbName;
	}

	public int getSbIdx() {
		return sbIdx;
	}
	public void setSbIdx(int sbIdx) {
		this.sbIdx = sbIdx;
	}
	public String getSbName() {
		return sbName;
	}
	public void setSbName(String sbName) {
		this.sbName = sbName;
	}

	@Override
	public String toString() {
		return "SubtitleVO [sbIdx=" + sbIdx + ", sbName=" + sbName + "]";
	}
}