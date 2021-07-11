package com.knockknock.orders;

// 주문서에 작성할 내용들
public class OrdersListVO {
	private int pIdx;
	private int oCnt;
	private int pPrice;
	private int oTotprice;
	private int sIdx;
	private String pName;
	private String pDesc;
	private int pFee;
	private String pImg;
	
	// 주문내역에 들어가야할 것들
	private String oDate;
	private String oTempnum;
	private int oStatus;

	public OrdersListVO() {
		super();
	}

	public OrdersListVO(int pIdx, int oCnt, int pPrice, int oTotprice, int sIdx, String pName, String pDesc, int pFee,
			String pImg, String oDate, String oTempnum, int oStatus) {
		super();
		this.pIdx = pIdx;
		this.oCnt = oCnt;
		this.pPrice = pPrice;
		this.oTotprice = oTotprice;
		this.sIdx = sIdx;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pFee = pFee;
		this.pImg = pImg;
		this.oDate = oDate;
		this.oTempnum = oTempnum;
		this.oStatus = oStatus;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}

	public int getoCnt() {
		return oCnt;
	}

	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getoTotprice() {
		return oTotprice;
	}

	public void setoTotprice(int oTotprice) {
		this.oTotprice = oTotprice;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public int getpFee() {
		return pFee;
	}

	public void setpFee(int pFee) {
		this.pFee = pFee;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public String getoTempnum() {
		return oTempnum;
	}

	public void setoTempnum(String oTempnum) {
		this.oTempnum = oTempnum;
	}

	public int getoStatus() {
		return oStatus;
	}

	public void setoStatus(int oStatus) {
		this.oStatus = oStatus;
	}

	@Override
	public String toString() {
		return "OrdersListVO [pIdx=" + pIdx + ", oCnt=" + oCnt + ", pPrice=" + pPrice + ", oTotprice=" + oTotprice
				+ ", sIdx=" + sIdx + ", pName=" + pName + ", pDesc=" + pDesc + ", pFee=" + pFee + ", pImg=" + pImg
				+ ", oDate=" + oDate + ", oTempnum=" + oTempnum + ", oStatus=" + oStatus + "]";
	}

}
