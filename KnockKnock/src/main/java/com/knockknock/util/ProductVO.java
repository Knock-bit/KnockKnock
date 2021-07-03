package com.knockknock.util;

public class ProductVO {
	private int pIdx; // 상품번호
	private int pcIdx; // 상품 카테고리 번호
	private String pName; // 상품명
	private int pPrice; // 상품가격
	private int pStock; // 재고수량
	private String pDesc; // 상품설명
	private String pRegdate; // 등록날짜 - db는 date 타입인데 스프링에서 사용하기에는 String타입으로 받는게 좋아서 string으로 선언
	private int pViews; // 조회수
	private int sIdx; // 판매자번호
	private String pAble; // 판매여부 -> 0 : 판매중지( 품절 등) 1: 판매중
	private int pTotalcnt; // 총 판매량
	private int pFee; //배송비
	private String pImg; // 상품 사진
	
	public ProductVO() {
		super();
	}

	public ProductVO(int pIdx, int pcIdx, String pName, int pPrice, int pStock, String pDesc, String pRegdate,
			int pViews, int sIdx, String pAble, int pTotalcnt, int pFee, String pImg) {
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
		this.pTotalcnt = pTotalcnt;
		this.pFee = pFee;
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

	public String getpAble() {
		return pAble;
	}

	public void setpAble(String pAble) {
		this.pAble = pAble;
	}

	public int getpTotalcnt() {
		return pTotalcnt;
	}

	public void setpTotalcnt(int pTotalcnt) {
		this.pTotalcnt = pTotalcnt;
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

	@Override
	public String toString() {
		return "ProductVO [pIdx=" + pIdx + ", pcIdx=" + pcIdx + ", pName=" + pName + ", pPrice=" + pPrice + ", pStock="
				+ pStock + ", pDesc=" + pDesc + ", pRegdate=" + pRegdate + ", pViews=" + pViews + ", sIdx=" + sIdx
				+ ", pAble=" + pAble + ", pTotalcnt=" + pTotalcnt + ", pFee=" + pFee + ", pImg=" + pImg + "]";
	}

	
	
}
