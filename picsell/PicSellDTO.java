package com.picsell;

public class PicSellDTO {

	private String uploadUserId;
	private String imagePoint;
	private String imageTitle;
	private String imageCode;
	private String fileName;
	private String imageTag;
	private String videoTag;
	private String originalName;
	private String category;
	
	public String getUploadUserId() {
		return uploadUserId;
	}
	public void setUploadUserId(String uploadUserId) {
		this.uploadUserId = uploadUserId;
	}
	public String getImagePoint() {
		return imagePoint;
	}
	public void setImagePoint(String imagePoint) {
		this.imagePoint = imagePoint;
	}
	public String getImageTitle() {
		return imageTitle;
	}
	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
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
	public String getVideoTag() {
		return videoTag;
	}
	public void setVideoTag(String videoTag) {
		this.videoTag = videoTag;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
