package com.knockknock.admin;

public class AdminContactCategory {
	private int ctcIdx;
	private String ctcName;
	
	public AdminContactCategory() {}
	
	public AdminContactCategory(int ctcIdx, String ctcName) {
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

	@Override
	public String toString() {
		return "AdminContactCategory [ctcIdx=" + ctcIdx + ", ctcName=" + ctcName + "]";
	}
	
}
