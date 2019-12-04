package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PicSellPaymentDAO {

	Connection conn = null;
	
	public PicSellPaymentDAO(Connection conn) {
		this.conn = conn;
	}

	public List<PicSellPaymentDTO> getChargeData() {
		
		List<PicSellPaymentDTO> lists = new ArrayList<PicSellPaymentDTO>();
		PicSellPaymentDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select chargeCode, chargePoint, realMoney from pschargeItem";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				dto = new PicSellPaymentDTO();
				
				dto.setChargeCode(rs.getString("chargeCode"));
				dto.setChargePoint(rs.getInt("chargePoint"));
				dto.setRealMoney(rs.getInt("realMoney"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}

	public void updateDownloadUser(String downloadUser, int imagePoint) {
		
		String sql;
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "update psuser set chargePoint = ? where userId = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, imagePoint);
			pstmt.setString(2, downloadUser);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("PicSellPaymentDAO - updateDownloadUser : " + e.toString());
		}
		
	}

	public void updateUploadUser(String uploadUser, int imagePoint) {
		
		String sql;
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "update psuser set chargePoint "
					+ "= ((select chargePoint from psuser where userId = ?) + ?) where userId = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uploadUser);
			pstmt.setInt(2, imagePoint);
			pstmt.setString(3, uploadUser);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("PicSellPaymentDAO - updateUploadUser : " + e.toString());
		}
		
	}
	
	public void clearBasket(String downloadUser) {
		
		String sql;
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "delete from psBasket where downloadUser = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, downloadUser);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("PicSellPaymentDAO - clearBasket : " + e.toString());
		}
		
	}
	
}
