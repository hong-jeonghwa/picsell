package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.imageTest.ImageTestDTO;

public class PicSellDAO {

	private Connection conn = null;
	
	public PicSellDAO(Connection conn) {
		
		this.conn = conn;
		
	}
	
	public List<PicSellDTO> getLists(int start, int end){
		
		List<PicSellDTO> lists = new ArrayList<PicSellDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from ("
					+ "select rownum rnum,data.* from ("
					+ "select uploadUserId,imagePoint,imageTitle,imageCode,fileName,originalName,imageTag "
					+ "from psimage order by imageCode desc) data) "
					+ "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PicSellDTO dto = new PicSellDTO();
				
				dto.setUploadUserId(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getString("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setImageCode(rs.getString("imageCode"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriginalName(rs.getString("originalName"));
				dto.setImageTag(rs.getString("imageTag"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - getLists" + e.toString());
		}
		return lists;
	}
	
	public List<PicSellDTO> getReadImage(String imageTag) {
		
		List<PicSellDTO> lists = new ArrayList<PicSellDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		System.out.println("imageTag : " + imageTag);
		
		try {
			
			imageTag = "%" + imageTag + "%";
			
			sql = "select uploadUserId,imagePoint,imageTitle,imageCode,fileName,originalName,imageTag from "
					+ "psimage where imageTag like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, imageTag);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PicSellDTO dto = new PicSellDTO();
				
				dto.setUploadUserId(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getString("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setImageCode(rs.getString("imageCode"));
				/*dto.setFileName(rs.getString("fileName"));*/
				dto.setOriginalName(rs.getString("originalName"));
				dto.setImageTag(rs.getString("imageTag"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - getReadImage" + e.toString());
		}
		
		System.out.println("lists.size() : " + lists.size());
		
		return lists;
	}
	
	public List<PicSellDTO> getReadVideo(String category) {
		
		List<PicSellDTO> lists = new ArrayList<PicSellDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		System.out.println("Category : " + category);
		
		try {
			
			/*Category = "%" + Category + "%";*/
			
			System.out.println(category + "°ªÀº??");
			
			sql = "select uploadUserId,imagePoint,imageTitle,imageCode,fileName,originalName,category from "
					+ "psimage where category='video'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PicSellDTO dto = new PicSellDTO();
				
				dto.setUploadUserId(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getString("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setImageCode(rs.getString("imageCode"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriginalName(rs.getString("originalName"));
				dto.setCategory(rs.getString("category"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - getReadVideo" + e.toString());
		}
		
		System.out.println("lists.size() : " + lists.size());
		
		return lists;
	}
	
	public List<PicSellDTO> getReadIllust(String category) {
		
		List<PicSellDTO> lists = new ArrayList<PicSellDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		
		try {
			
			sql = "select uploadUserId,imagePoint,imageTitle,imageCode,fileName,originalName,category from "
					+ "psimage where category='illust'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PicSellDTO dto = new PicSellDTO();
				
				dto.setUploadUserId(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getString("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setImageCode(rs.getString("imageCode"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriginalName(rs.getString("originalName"));
				dto.setCategory(rs.getString("category"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - getReadVideo" + e.toString());
		}
		
		System.out.println("lists.size() : " + lists.size());
		
		return lists;
	}
	
public List<PicSellDTO> getReadMovie(String category) {
		
		List<PicSellDTO> lists = new ArrayList<PicSellDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select uploadUserId,imagePoint,imageTitle,imageCode,fileName,originalName,category from "
					+ "psimage where category='movie'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PicSellDTO dto = new PicSellDTO();
				
				dto.setUploadUserId(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getString("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setImageCode(rs.getString("imageCode"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriginalName(rs.getString("originalName"));
				dto.setCategory(rs.getString("category"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - getReadVideo" + e.toString());
		}
		
		System.out.println("lists.size() : " + lists.size());
		
		return lists;
	}
	
	public int getDataCount() {
		
		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from psimage";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dataCount = rs.getInt(1);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("picSellDAO - dataCount" + e.toString());
		}
		
		return dataCount;
	}
	


}