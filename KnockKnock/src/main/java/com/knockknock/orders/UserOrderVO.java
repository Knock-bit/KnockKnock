package com.knockknock.orders;

public class UserOrderVO {
	
	// 수령인 정보 
	private int gIdx;
	private String oAddress1;
	private String oAddress2;
	private String oPhone;
	private String oReceiver;
	private int oZipcode;
	private int uIdx;
	
	public UserOrderVO() {
		
	}

	public UserOrderVO(int gIdx, String oAddress1, String oAddress2, String oPhone, String oReceiver, int oZipcode,
			int uIdx) {
		super();
		this.gIdx = gIdx;
		this.oAddress1 = oAddress1;
		this.oAddress2 = oAddress2;
		this.oPhone = oPhone;
		this.oReceiver = oReceiver;
		this.oZipcode = oZipcode;
		this.uIdx = uIdx;
	}

	public int getgIdx() {
		return gIdx;
	}

	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}

	public String getoAddress1() {
		return oAddress1;
	}

	public void setoAddress1(String oAddress1) {
		this.oAddress1 = oAddress1;
	}

	public String getoAddress2() {
		return oAddress2;
	}

	public void setoAddress2(String oAddress2) {
		this.oAddress2 = oAddress2;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoReceiver() {
		return oReceiver;
	}

	public void setoReceiver(String oReceiver) {
		this.oReceiver = oReceiver;
	}

	public int getoZipcode() {
		return oZipcode;
	}

	public void setoZipcode(int oZipcode) {
		this.oZipcode = oZipcode;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	@Override
	public String toString() {
		return "UserOrderVO [gIdx=" + gIdx + ", oAddress1=" + oAddress1 + ", oAddress2=" + oAddress2 + ", oPhone="
				+ oPhone + ", oReceiver=" + oReceiver + ", oZipcode=" + oZipcode + ", uIdx=" + uIdx + "]";
	}
	
	

}
