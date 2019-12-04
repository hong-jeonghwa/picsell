package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class PicsellUserDAO {

	private Connection conn;

	public PicsellUserDAO(Connection conn) {
		this.conn = conn;

	}

	public void insertData(PicsellUserDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into psuser (userId,userPwd,userName,userEmail,userTel,chargePoint) values (?,?,?,?,?,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserEmail());
			pstmt.setInt(5, dto.getUserTel());

			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.print("UserDAO.insertData : " + e.toString());

		}

	}
	
	public PicsellUserDTO getReadData (String userId) {
		
		PicsellUserDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select userId,userPwd,userName,userEmail,userTel,chargePoint from psuser where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				dto = new PicsellUserDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserTel(rs.getInt("userTel"));
				dto.setChargePoint(rs.getInt("chargePoint"));
			}
			rs.close();
			pstmt.close();	
		} catch (Exception e) {
			System.out.print("UserDAO.getReadData : " + e.toString());
		}
		return dto;
		
	}
	
	public int updateData(PicsellUserDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update psuser set userPwd=?,userEmail=?,userTel=? where userId=? and userName=?";
			
			pstmt = conn.prepareStatement(sql);
			
			 pstmt.setString(1, dto.getUserPwd());
			 pstmt.setString(2, dto.getUserEmail());
			 pstmt.setInt(3, dto.getUserTel());
			 pstmt.setString(4, dto.getUserId());
			 pstmt.setString(5, dto.getUserName());
			 
			 result = pstmt.executeUpdate();
			  
			 pstmt.close();
			
		} catch (Exception e) {
			System.out.print("UserDAO.updateData : " + e.toString());
		}
		return result;
		
	}
	 
	public boolean duplicateIdCheck(String id)	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean x= false;
		
		try {
			// 쿼리
			StringBuffer query = new StringBuffer();
			query.append("SELECT userId FROM psuser WHERE userId=?");
					
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x= true; //해당 아이디 존재
			
			return x;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} 
	}

}
