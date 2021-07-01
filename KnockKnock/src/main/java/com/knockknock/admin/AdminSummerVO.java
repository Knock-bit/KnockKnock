package com.knockknock.admin;

public class AdminSummerVO {
	private int testIdx;
	private String image;
	private String content;
	private String title;


	public AdminSummerVO() {};

	public AdminSummerVO(int testIdx, String image, String content, String title) {
		super();
		this.testIdx = testIdx;
		this.image = image;
		this.content = content;
		this.title = title;
	}
	public int getTestIdx() {
		return testIdx;
	}
	public void setTestIdx(int testIdx) {
		this.testIdx = testIdx;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "AdminSummerVO [testIdx=" + testIdx + ", image=" + image + ", content=" + content + ", title=" + title
				+ "]";
	}


}