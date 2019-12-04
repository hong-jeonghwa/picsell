package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ImageUploadDAO {
	
	private Connection conn = null;
	
	public ImageUploadDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	public int insertData(ImageUploadDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into psimage (uploaduserid,imagepoint,imagetitle,imagecode,filename,originalname,imagetag,category) ";
			sql += "values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUploadUserId());
			pstmt.setInt(2, dto.getImagePoint());
			pstmt.setString(3, dto.getImageTitle());
			pstmt.setInt(4, dto.getImageCode());
			pstmt.setString(5, dto.getFileName());
			pstmt.setString(6, dto.getOriginalName());
			pstmt.setString(7, dto.getImageTag());
			pstmt.setString(8, dto.getCategory());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString()+ "insertdata");
		}
		
		return result;
		
	}
	
	public int getMaxNum() {
	
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
		
			sql = "select max(imagecode) from psimage";
		
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
			
				maxNum = rs.getInt(1);
			
			}
		
			rs.close();
			pstmt.close();
		
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	
		return maxNum;
	
	}

	public List<ImageUploadDTO> getList(int start, int end){
	
		List<ImageUploadDTO> lists = new ArrayList<ImageUploadDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
		
			sql = "select * from (";
			sql += "select rownum rnum,data.* from(";
			sql += "select uploaduserid,imagepoint,imagetitle,imagecode,filename,originalname,imagetag,category ";
			sql += "from psimage ";
			sql += "order by imagecode desc) data) ";
			sql += "where rnum>=? and rnum<=?";
		
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
		
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
			
			ImageUploadDTO dto = new ImageUploadDTO();
			
			dto.setUploadUserId(rs.getString("uploaduserid"));
			dto.setImagePoint(rs.getInt("imagepoint"));
			dto.setImageTitle(rs.getString("imagetitle"));
			dto.setImageCode(rs.getInt("imagecode"));
			dto.setFileName(rs.getString("filename"));
			dto.setImageTag(rs.getString("imagetag"));
			dto.setOriginalName(rs.getString("originalname"));
			dto.setCategory(rs.getString("category"));
			
			lists.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		
	} catch (Exception e) {
		System.out.println(e.toString() + "getlist");
	}
	
	return lists;
	
}

	public List<ImageUploadDTO> getReadData(String uploaduserid){
		
		List<ImageUploadDTO> listss = new ArrayList<ImageUploadDTO>();
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
		
			sql = "select * from psimage where uploaduserid=?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uploaduserid);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				
				ImageUploadDTO dto = new ImageUploadDTO();
			
				dto.setUploadUserId(rs.getString("uploaduserid"));
				dto.setImagePoint(rs.getInt("imagepoint"));
				dto.setImageTitle(rs.getString("imagetitle"));
				dto.setImageCode(rs.getInt("imagecode"));
				dto.setFileName(rs.getString("filename"));
				dto.setImageTag(rs.getString("imagetag"));
				dto.setOriginalName(rs.getString("originalname"));
				dto.setCategory(rs.getString("category"));
				
				listss.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		
	} catch (Exception e) {
		System.out.println(e.toString()+"getreaddata");
	}
	
	return listss;
	
	}
public String getDeleteData(int imagecode){
		
		String fn = null;
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
		
			sql = "select filename from psimage where imagecode=?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, imagecode);
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				
				fn = rs.getString(1);
				
			}
		
		rs.close();
		pstmt.close();
		
		
	} catch (Exception e) {
		System.out.println(e.toString()+"getreaddata");
	}
	
	return fn;
	
}
	
	public int getDataCount() { //전체 데이터 갯수 구하기
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from psimage";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dataCount = rs.getInt(1); // 첫번째 col밖에 없다.
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dataCount;
		
	}
	
	public String getcheck(int max) {
		
		String ch = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		try {
		
			sql = "select filename from psimage where imagecode=?";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, max);
		
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
			
				ch = rs.getString(1);
			
			}
		
			rs.close();
			pstmt.close();
		
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	
		return ch;
	
	}
	
	public void deleteData(int imagecode) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete psimage where imagecode=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, imagecode);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	
		
	}
	
}
