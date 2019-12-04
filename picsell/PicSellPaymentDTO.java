package com.picsell;

public class PicSellPaymentDTO {

	private String chargeCode;
	private int chargePoint;
	private int realMoney;
	
	public String getChargeCode() {
		return chargeCode;
	}
	public void setChargeCode(String chargeCode) {
		this.chargeCode = chargeCode;
	}
	public int getChargePoint() {
		return chargePoint;
	}
	public void setChargePoint(int chargePoint) {
		this.chargePoint = chargePoint;
	}
	public int getRealMoney() {
		return realMoney;
	}
	public void setRealMoney(int realMoney) {
		this.realMoney = realMoney;
	}
	
}
