package com.knockknock.orders;

public class OrdersVO {
	private int oIdx;
	private int pIdx;
	private int oCnt;
	private int oStatus;
	private int pPrice;
	private int oTotprice;
	private String fCheck;
	private int oNumber;
	private int uIdx;
	private int paIdx;
	private String oDate;
	private int sIdx;
	private String uName;
	private String pName;
	private int oFee;
	private int total;
	private String salesdate;	
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	private String oTempnum;

	public OrdersVO() {
		super();
	}
  
	public OrdersVO(int oIdx, int pIdx, int oCnt, int oStatus, int pPrice, int oTotprice, String fCheck, int oNumber,
			int uIdx, int paIdx, String oDate, int sIdx, String uName, String pName, int oFee, int total,
			String oTempnum) {
		super();
		this.oIdx = oIdx;
		this.pIdx = pIdx;
		this.oCnt = oCnt;
		this.oStatus = oStatus;
		this.pPrice = pPrice;
		this.oTotprice = oTotprice;
		this.fCheck = fCheck;
		this.oNumber = oNumber;
		this.uIdx = uIdx;
		this.paIdx = paIdx;
		this.oDate = oDate;
		this.sIdx = sIdx;
		this.uName = uName;
		this.pName = pName;
		this.oFee = oFee;
		this.total = total;
		this.oTempnum = oTempnum;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;

	}

	public int getoIdx() {
		return oIdx;
	}

	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
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

	public int getoStatus() {
		return oStatus;
	}

	public void setoStatus(int oStatus) {
		this.oStatus = oStatus;
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

	public String getfCheck() {
		return fCheck;
	}

	public void setfCheck(String fCheck) {
		this.fCheck = fCheck;
	}

	public int getoNumber() {
		return oNumber;
	}

	public void setoNumber(int oNumber) {
		this.oNumber = oNumber;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public int getPaIdx() {
		return paIdx;
	}

	public void setPaIdx(int paIdx) {
		this.paIdx = paIdx;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public String getoTempnum() {
		return oTempnum;
	}

	public void setoTempnum(String oTempnum) {
		this.oTempnum = oTempnum;
	}
	 
	public int getoFee() {
		return oFee;
	}

	public void setoFee(int oFee) {
		this.oFee = oFee;
	}

	public String getSalesdate() {
		return salesdate;
	}

	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}

	@Override
	public String toString() {
		return "OrdersVO [oIdx=" + oIdx + ", pIdx=" + pIdx + ", oCnt=" + oCnt + ", oStatus=" + oStatus + ", pPrice="
				+ pPrice + ", oTotprice=" + oTotprice + ", fCheck=" + fCheck + ", oNumber=" + oNumber + ", uIdx=" + uIdx
				+ ", paIdx=" + paIdx + ", oDate=" + oDate + ", sIdx=" + sIdx + ", uName=" + uName + ", pName=" + pName
				+ ", oFee=" + oFee + ", total=" + total + ", salesdate=" + salesdate + ", oTempnum=" + oTempnum + "]";
	}


	
}
	
	
	

