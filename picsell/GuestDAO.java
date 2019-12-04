package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
	
	Connection conn;

	public GuestDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from psGuest"; // num이 없을 경우 0을 표시

			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1); // 첫번째 칼럼
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	public int insertData(GuestDTO dto) {
		
		System.out.println("insert?");

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into psGuest (num,psUserId,Content,imageCode) ";
			sql += "values (?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPsUserId());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getImageCode());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.toString() + "//////////insertData");
		}

		return result;

	}

	// 전체 데이터 개수 구하기ㅏ
	public int getDataCount() {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from psGuest";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1); // 첫번째 칼럼
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}

	public List<GuestDTO> getList(int start, int end,int imageCode) {

		List<GuestDTO> list = new ArrayList<GuestDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "select * from (select rownum rnum,data.* from (select num,content,psUserId, imageCode from psGuest order by num desc) data)"; 
			sql += " where rnum>=? and rnum<=? and imageCode=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, imageCode);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				GuestDTO dto = new GuestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setPsUserId(rs.getString("psUserId"));
				dto.setContent(rs.getString("content"));
				dto.setImageCode(rs.getInt("imageCode"));

				list.add(dto);

			}

		} catch (Exception e) {
			System.out.println(e.toString() + "///////////getlist");
		}

		return list;

	}

	public int deleteData(int num) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete psGuest where num=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString()+"//////deleteData");
		}
		
		
		
		return result;

	}

}
