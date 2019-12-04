package com.picsell;

public class ImageUploadDTO {
	
	private String uploadUserId;
	private int imagePoint;
	private String imageTitle;
	private	int imageCode;
	private String fileName;
	private String originalName;
	private String imageTag;
	private String category;
	
	
	public String getUploadUserId() {
		return uploadUserId;
	}
	public void setUploadUserId(String uploadUserId) {
		this.uploadUserId = uploadUserId;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	

}
