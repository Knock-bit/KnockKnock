package com.knockknock.board;

public class BoardCategoryVO {

	private int bcCategory;
	private String bcName;
	
	public BoardCategoryVO() {}

	public BoardCategoryVO(int bcCategory, String bcName) {
		super();
		this.bcCategory = bcCategory;
		this.bcName = bcName;
	}

	public int getBcCategory() {
		return bcCategory;
	}
	public void setBcCategory(int bcCategory) {
		this.bcCategory = bcCategory;
	}
	public String getBcName() {
		return bcName;
	}
	public void setBcName(String bcName) {
		this.bcName = bcName;
	}
	
	@Override
	public String toString() {
		return "BoardCategoryVO [bcCategory=" + bcCategory + ", bcName=" + bcName + "]";
	}
}