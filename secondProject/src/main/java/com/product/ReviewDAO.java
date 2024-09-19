package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
	
	private Connection conn = null;
	
	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}
	
	//1. 리뷰 넘버
	public int getMaxNum(int productNum) {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select nvl(max(num),0) from review where productNum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				maxNum = rs.getInt(1);
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;	
	}
	
	//리뷰 데이터 db insert
	public int insertData(ReviewDTO dto) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "insert into REVIEW values (?,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getReviewNum());
			pstmt.setInt(2, dto.getProductNum());
			pstmt.setString(3, dto.getUserId());
			pstmt.setString(4, dto.getUserName());
			pstmt.setString(5, dto.getUserPwd());
			pstmt.setString(6, dto.getContent());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//db안 리뷰 불러오기(상세페이지)
	public List<ReviewDTO> getReviewList(int productNum){
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select reviewNum,productNum,userId,userPwd,content,to_char(reviewDate,'yyyy-mm-dd') reviewDate from REVIEW where productNum=? order by reviewNum desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReviewNum(rs.getInt("reviewNum"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setContent(rs.getString("content"));
				dto.setReviewDate(rs.getString("reviewDate"));
			
				reviewList.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return reviewList;
	}
	//db안 리뷰 불러오기(리뷰 전체페이지)
	public List<ReviewDTO> getAllReviewList(int productNum,int start,int end){
		List<ReviewDTO> allReviewList = new ArrayList<ReviewDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rnum,data.* from (select reviewNum,productNum,userId,userName,userPwd,content,to_char(reviewDate,'yyyy-mm-dd') reviewDate from review where productNum=? order by reviewNum desc) data) where rnum>=? and rnum<=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setRnum(rs.getInt("rnum"));
				dto.setReviewNum(rs.getInt("reviewNum"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setContent(rs.getString("content"));
				dto.setReviewDate(rs.getString("reviewDate"));
			
				allReviewList.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return allReviewList;
	}
	
	
	
	//리뷰 갯수 확인(페이징처리)
	public int getReviewCount(int productNum) {
		int reviewCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "select nvl(count(*),0) from review where productNum=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return reviewCount;
	}
	
	//리뷰 삭제
	public int deleteData(int reviewNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql="delete from review where reviewNum=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	


}
