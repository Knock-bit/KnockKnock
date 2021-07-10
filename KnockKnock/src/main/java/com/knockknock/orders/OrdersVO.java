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
	private String uImg;
	private int countnum;
	private int ordertimes;
	private String sdate1;
	private String sdate2;
	private int c1;
	private int c2;
	private String oTempnum;
	private int r;
	private String a;
	private int rankcount;	
	private String sRegdate;
	
	public OrdersVO() {
		super();
	}

	public OrdersVO(int oIdx, int pIdx, int oCnt, int oStatus, int pPrice, int oTotprice, String fCheck, int oNumber,
			int uIdx, int paIdx, String oDate, int sIdx, String uName, String pName, int oFee, int total,
			String salesdate, String uImg, int countnum, int ordertimes, String sdate1, String sdate2, int c1, int c2,
			String oTempnum, int r, String a, int rankcount, String sRegdate) {
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
		this.salesdate = salesdate;
		this.uImg = uImg;
		this.countnum = countnum;
		this.ordertimes = ordertimes;
		this.sdate1 = sdate1;
		this.sdate2 = sdate2;
		this.c1 = c1;
		this.c2 = c2;
		this.oTempnum = oTempnum;
		this.r = r;
		this.a = a;
		this.rankcount = rankcount;
		this.sRegdate = sRegdate;
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

	public int getoFee() {
		return oFee;
	}

	public void setoFee(int oFee) {
		this.oFee = oFee;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getSalesdate() {
		return salesdate;
	}

	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}

	public String getuImg() {
		return uImg;
	}

	public void setuImg(String uImg) {
		this.uImg = uImg;
	}

	public int getCountnum() {
		return countnum;
	}

	public void setCountnum(int countnum) {
		this.countnum = countnum;
	}

	public int getOrdertimes() {
		return ordertimes;
	}

	public void setOrdertimes(int ordertimes) {
		this.ordertimes = ordertimes;
	}

	public String getSdate1() {
		return sdate1;
	}

	public void setSdate1(String sdate1) {
		this.sdate1 = sdate1;
	}

	public String getSdate2() {
		return sdate2;
	}

	public void setSdate2(String sdate2) {
		this.sdate2 = sdate2;
	}

	public int getC1() {
		return c1;
	}

	public void setC1(int c1) {
		this.c1 = c1;
	}

	public int getC2() {
		return c2;
	}

	public void setC2(int c2) {
		this.c2 = c2;
	}

	public String getoTempnum() {
		return oTempnum;
	}

	public void setoTempnum(String oTempnum) {
		this.oTempnum = oTempnum;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public int getRankcount() {
		return rankcount;
	}

	public void setRankcount(int rankcount) {
		this.rankcount = rankcount;
	}

	public String getsRegdate() {
		return sRegdate;
	}

	public void setsRegdate(String sRegdate) {
		this.sRegdate = sRegdate;
	}

	@Override
	public String toString() {
		return "OrdersVO [oIdx=" + oIdx + ", pIdx=" + pIdx + ", oCnt=" + oCnt + ", oStatus=" + oStatus + ", pPrice="
				+ pPrice + ", oTotprice=" + oTotprice + ", fCheck=" + fCheck + ", oNumber=" + oNumber + ", uIdx=" + uIdx
				+ ", paIdx=" + paIdx + ", oDate=" + oDate + ", sIdx=" + sIdx + ", uName=" + uName + ", pName=" + pName
				+ ", oFee=" + oFee + ", total=" + total + ", salesdate=" + salesdate + ", uImg=" + uImg + ", countnum="
				+ countnum + ", ordertimes=" + ordertimes + ", sdate1=" + sdate1 + ", sdate2=" + sdate2 + ", c1=" + c1
				+ ", c2=" + c2 + ", oTempnum=" + oTempnum + ", r=" + r + ", a=" + a + ", rankcount=" + rankcount
				+ ", sRegdate=" + sRegdate + "]";
	} 
	
	

}
