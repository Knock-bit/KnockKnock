package com.knockknock.user;

import java.util.Date;

public class UserVO {
	private int uIdx;
	private String uId;
	private String uName;
	private String uPwd;
	private String uNickname;
	private String uEmail;
	private String uPhone;
	private Date uBirth;
	private int uTotPoint;
	private String uAdmin;
	private String uActive;
	private Date uLastlogin;
	private String uGender;
	private String uAddress;
	private Date uJoindate;
	private String uImg;
	private int uPoint;
	
	
	// ===================== [ 생성자 ] =======================
	public UserVO() {
	}

	//전체 생성자
	public UserVO(int uIdx, String uId, String uName, String uPwd, String uNickname, String uEmail, String uPhone,
			Date uBirth, int uTotPoint, String uAdmin, String uActive, Date uLastlogin, String uGender, String uAddress,
			Date uJoindate, String uImg, int uPoint) {
		super();
		this.uIdx = uIdx;
		this.uId = uId;
		this.uName = uName;
		this.uPwd = uPwd;
		this.uNickname = uNickname;
		this.uEmail = uEmail;
		this.uPhone = uPhone;
		this.uBirth = uBirth;
		this.uTotPoint = uTotPoint;
		this.uAdmin = uAdmin;
		this.uActive = uActive;
		this.uLastlogin = uLastlogin;
		this.uGender = uGender;
		this.uAddress = uAddress;
		this.uJoindate = uJoindate;
		this.uImg = uImg;
		this.uPoint = uPoint;
	}

	// 마이페이지용 생성자
	public UserVO(int uIdx, String uId, String uName, String uPwd, String uNickname, String uEmail, String uPhone,
			Date uBirth, int uTotPoint, String uGender, String uAddress, Date uJoindate, String uImg, int uPoint) {
		super();
		this.uIdx = uIdx;
		this.uId = uId;
		this.uName = uName;
		this.uPwd = uPwd;
		this.uNickname = uNickname;
		this.uEmail = uEmail;
		this.uPhone = uPhone;
		this.uBirth = uBirth;
		this.uTotPoint = uTotPoint;
		this.uGender = uGender;
		this.uAddress = uAddress;
		this.uJoindate = uJoindate;
		this.uImg = uImg;
		this.uPoint = uPoint;
	}

	//=======================[ getter, setter ] =========================
	
	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public Date getuBirth() {
		return uBirth;
	}

	public void setuBirth(Date uBirth) {
		this.uBirth = uBirth;
	}

	public int getuTotPoint() {
		return uTotPoint;
	}

	public void setuTotPoint(int uTotPoint) {
		this.uTotPoint = uTotPoint;
	}

	public String getuAdmin() {
		return uAdmin;
	}

	public void setuAdmin(String uAdmin) {
		this.uAdmin = uAdmin;
	}

	public String getuActive() {
		return uActive;
	}

	public void setuActive(String uActive) {
		this.uActive = uActive;
	}

	public Date getuLastlogin() {
		return uLastlogin;
	}

	public void setuLastlogin(Date uLastlogin) {
		this.uLastlogin = uLastlogin;
	}

	public String getuGender() {
		return uGender;
	}

	public void setuGender(String uGender) {
		this.uGender = uGender;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public Date getuJoindate() {
		return uJoindate;
	}

	public void setuJoindate(Date uJoindate) {
		this.uJoindate = uJoindate;
	}

	public String getuImg() {
		return uImg;
	}

	public void setuImg(String uImg) {
		this.uImg = uImg;
	}

	public int getuPoint() {
		return uPoint;
	}

	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}

	
	// ================== [ toString ] ====================
	@Override
	public String toString() {
		return "UserVO [uIdx=" + uIdx + ", uId=" + uId + ", uName=" + uName + ", uPwd=" + uPwd + ", uNickname="
				+ uNickname + ", uEmail=" + uEmail + ", uPhone=" + uPhone + ", uBirth=" + uBirth + ", uTotPoint="
				+ uTotPoint + ", uAdmin=" + uAdmin + ", uActive=" + uActive + ", uLastlogin=" + uLastlogin
				+ ", uGender=" + uGender + ", uAddress=" + uAddress + ", uJoindate=" + uJoindate + ", uImg=" + uImg
				+ ", uPoint=" + uPoint + "]";
	}
	
	
	
	
	
	
	
	
	

}
