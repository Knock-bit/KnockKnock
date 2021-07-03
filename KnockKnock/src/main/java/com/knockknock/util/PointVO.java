

package com.knockknock.util;

import java.util.Date;

public class PointVO {
	
	private int poUsed;
	private int poEarn;
	private Date poDate;
	private String poWhere;
	
	public PointVO() {
		super();
	}

	public PointVO(int poUsed, int poEarn, Date poDate, String poWhere) {
		super();
		this.poUsed = poUsed;
		this.poEarn = poEarn;
		this.poDate = poDate;
		this.poWhere = poWhere;
	}

	public int getPoUsed() {
		return poUsed;
	}

	public void setPoUsed(int poUsed) {
		this.poUsed = poUsed;
	}

	public int getPoEarn() {
		return poEarn;
	}

	public void setPoEarn(int poEarn) {
		this.poEarn = poEarn;
	}

	public Date getPoDate() {
		return poDate;
	}

	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}

	public String getPoWhere() {
		return poWhere;
	}

	public void setPoWhere(String poWhere) {
		this.poWhere = poWhere;
	}

	@Override
	public String toString() {
		return "PointVO [poUsed=" + poUsed + ", poEarn=" + poEarn + ", poDate=" + poDate + ", poWhere=" + poWhere + "]";
	}
	
	
	

}
