package com.knockknock.product;

public class ProductVO {
	private int pIdx;
	private int pcIdx;
	private String pName;
	private int pPrice;
	private int pStock;
	private String pDesc;
	private String pRegdate;
	private int pViews;
	private int sIdx;
	private int pAble;
	private int pTotalCnt;
	private int pFee;
	private String pImg;
	private String pcName;
	private int pCount;
	private String caRegdate;
	

	public ProductVO() {
		super();
	}

	public ProductVO(int pIdx, int pcIdx, String pName, int pPrice, int pStock, String pDesc, String pRegdate,
			int pViews, int sIdx, int pAble, int pTotalCnt, int pFee, String pImg, String pcName, int pCount,
			String caRegdate) {
		super();
		this.pIdx = pIdx;
		this.pcIdx = pcIdx;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pStock = pStock;
		this.pDesc = pDesc;
		this.pRegdate = pRegdate;
		this.pViews = pViews;
		this.sIdx = sIdx;
		this.pAble = pAble;
		this.pTotalCnt = pTotalCnt;
		this.pFee = pFee;
		this.pImg = pImg;
		this.pcName = pcName;
		this.pCount = pCount;
		this.caRegdate = caRegdate;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getCaRegdate() {
		return caRegdate;
	}

	public void setCaRegdate(String caRegdate) {
		this.caRegdate = caRegdate;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}

	public int getPcIdx() {
		return pcIdx;
	}

	public void setPcIdx(int pcIdx) {
		this.pcIdx = pcIdx;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpRegdate() {
		return pRegdate;
	}

	public void setpRegdate(String pRegdate) {
		this.pRegdate = pRegdate;
	}

	public int getpViews() {
		return pViews;
	}

	public void setpViews(int pViews) {
		this.pViews = pViews;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public int getpAble() {
		return pAble;
	}

	public void setpAble(int pAble) {
		this.pAble = pAble;
	}

	public int getpTotalCnt() {
		return pTotalCnt;
	}

	public void setpTotalCnt(int pTotalCnt) {
		this.pTotalCnt = pTotalCnt;
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

	public String getPcName() {
		return pcName;
	}

	public void setPcName(String pcName) {
		this.pcName = pcName;
	}

	@Override
	public String toString() {
		return "ProductVO [pIdx=" + pIdx + ", pcIdx=" + pcIdx + ", pName=" + pName + ", pPrice=" + pPrice + ", pStock="
				+ pStock + ", pDesc=" + pDesc + ", pRegdate=" + pRegdate + ", pViews=" + pViews + ", sIdx=" + sIdx
				+ ", pAble=" + pAble + ", pTotalCnt=" + pTotalCnt + ", pFee=" + pFee + ", pImg=" + pImg + ", pcName="
				+ pcName + ", pCount=" + pCount + ", caRegdate=" + caRegdate + "]";
	}

}
