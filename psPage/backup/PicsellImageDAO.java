package com.picsell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.BoardDTO;

public class PicsellImageDAO {

	private Connection conn;

	public PicsellImageDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum(String userId) {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from psBasket where downloadUser=?"; // num이 없을 경우 0을 표시

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1); // 첫번째 칼럼
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "picsellImageDAO/getmaxnum");
		}

		return maxNum;

	}

	public List<PicBasketDTO> getLists(String userId) {

		List<PicBasketDTO> Basket_list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from psBasket where downloadUser=? order by num desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				PicBasketDTO bdto = new PicBasketDTO();

				bdto.setNum(rs.getInt("num"));
				bdto.setImageCode(rs.getInt("imageCode"));
				bdto.setImagePoint(rs.getInt("imagePoint"));
				bdto.setUploadUser(rs.getString("uploadUser"));
				bdto.setDownloadUser(rs.getString("downloadUser"));
				bdto.setFileName(rs.getString("fileName"));

				Basket_list.add(bdto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "picsellimageDao/getlist");
		}

		return Basket_list;

	}

	public int getData(String userId) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int sum = 0;

		try {

			sql = "select count(*) from psBasket where downloadUser=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				sum = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "picsellimageDao/getData");
		}

		return sum;

	}

	public List<String> getTag(int imageCode) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String ll = "";

		List<String> list = new ArrayList<>();

		try {

			sql = "select imageTag from psImage where imageCode=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, imageCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ll = rs.getString(1);
			}

			for (String i : ll.split(",")) {
				list.add(i);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "picsellimageDao/getData");
		}

		return list;

	}

	public int getSumPoint(String userId) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		int sumPoint = 0;

		try {

			sql = "select * from psBasket where downloadUser=? order by num desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sumPoint += rs.getInt("imagePoint");
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "picsellimageDao/getlist_sumPoint");
		}

		return sumPoint;

	}

	public int insertData(PicBasketDTO bdto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into psBasket (num,downloadUser,imageCode,imagePoint,uploadUser,fileName) ";
			sql += "values(?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bdto.getNum());
			pstmt.setString(2, bdto.getDownloadUser());
			pstmt.setInt(3, bdto.getImageCode());
			pstmt.setInt(4, bdto.getImagePoint());
			pstmt.setString(5, bdto.getUploadUser());
			pstmt.setString(6, bdto.getFileName());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "insertData");
		}

		return result;

	}

	public int deleteData(int imageCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete from psBasket where imageCode=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, imageCode);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "deleteData");
		}

		return result;

	}

	public PicsellImageDTO selectImage(int imageCode) {

		// 이미지코드에 맞는 이미지 추출해서 저장하기 위함
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		PicsellImageDTO dto = null;

		try {

			sql = "select * from psImage where imageCode=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, imageCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new PicsellImageDTO();

				dto.setImageCode(rs.getInt("imageCode"));
				dto.setUploadUserID(rs.getString("uploadUserId"));
				dto.setImagePoint(rs.getInt("imagePoint"));
				dto.setImageTitle(rs.getString("imageTitle"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriginalName(rs.getString("originalName"));
				dto.setImageTag(rs.getString("imageTag"));
				dto.setHitCount(rs.getInt("hitCount"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString() + "--->picsellImageDTO/selectImage");
		}

		return dto;

	}

	// 조회수 증가
	public int updateHitCount(int imageCode) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update psImage set hitCount=hitCount+1 ";
			sql += "where imageCode=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, imageCode);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
}
