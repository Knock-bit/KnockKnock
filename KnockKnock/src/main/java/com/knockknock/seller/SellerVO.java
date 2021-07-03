package com.knockknock.seller;

public class SellerVO {
	private int sIdx;
	private String sId;
	private String sPwd;
	private String sPhone;
	private String sName;
	private String sAddress;
	private String sEmail;
	private String sBiz;

	public SellerVO() {
		super();
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsPwd() {
		return sPwd;
	}

	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getsBiz() {
		return sBiz;
	}

	public void setsBiz(String sBiz) {
		this.sBiz = sBiz;
	}

	@Override
	public String toString() {
		return "SellerVO [sIdx=" + sIdx + ", sId=" + sId + ", sPwd=" + sPwd + ", sPhone=" + sPhone + ", sName=" + sName
				+ ", sAddress=" + sAddress + ", sEmail=" + sEmail + ", sBiz=" + sBiz + "]";
	}
 

}
