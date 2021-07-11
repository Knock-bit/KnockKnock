package com.knockknock.orders;

public class OrderStatusCategory {
	private int osIdx;
	private String osName;

	public OrderStatusCategory() {
		super();
	}

	public OrderStatusCategory(int osIdx, String osName) {
		super();
		this.osIdx = osIdx;
		this.osName = osName;
	}

	public int getOsIdx() {
		return osIdx;
	}

	public void setOsIdx(int osIdx) {
		this.osIdx = osIdx;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

}
