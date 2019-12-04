package com.picsell;

public class PicsellImageDTO {

	private String uploadUserID;
	private int imagePoint;
	private String imageTitle;
	private int imageCode;
	private String fileName;
	private String originalName;
	private String imageTag;
	private int hitCount;
	
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getUploadUserID() {
		return uploadUserID;
	}
	public void setUploadUserID(String uploadUserID) {
		this.uploadUserID = uploadUserID;
	}
	public int getImagePoint() {
		return imagePoint;
	}
	public void setImagePoint(int imagePoint) {
		this.imagePoint = imagePoint;
	}
	public String getImageTitle() {
		return imageTitle;
	}
	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}
	
	public int getImageCode() {
		return imageCode;
	}
	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getImageTag() {
		return imageTag;
	}
	public void setImageTag(String imageTag) {
		this.imageTag = imageTag;
	}
	
	
	
	
	
	
	
}
