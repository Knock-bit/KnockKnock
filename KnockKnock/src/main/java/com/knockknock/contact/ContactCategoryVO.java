package com.knockknock.contact;

public class ContactCategoryVO {
	private int ctcIdx;
	private String ctcName;

	public ContactCategoryVO() {
		super();
	}

	public ContactCategoryVO(int ctcIdx, String ctcName) {
		super();
		this.ctcIdx = ctcIdx;
		this.ctcName = ctcName;
	}

	public int getCtcIdx() {
		return ctcIdx;
	}

	public void setCtcIdx(int ctcIdx) {
		this.ctcIdx = ctcIdx;
	}

	public String getCtcName() {
		return ctcName;
	}

	public void setCtcName(String ctcName) {
		this.ctcName = ctcName;
	}

}
