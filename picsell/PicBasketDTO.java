package com.picsell;

public class PicBasketDTO {

	private int num;
	private String downloadUser;
	private String uploadUser;
	private int imagePoint;
	private int imageCode;
	private String fileName;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDownloadUser() {
		return downloadUser;
	}
	public void setDownloadUser(String downloadUser) {
		this.downloadUser = downloadUser;
	}
	public String getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}
	public int getImagePoint() {
		return imagePoint;
	}
	public void setImagePoint(int imagePoint) {
		this.imagePoint = imagePoint;
	}
	public int getImageCode() {
		return imageCode;
	}
	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}
	
}
