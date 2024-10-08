package com.myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
	
	private Connection conn;
	
	public OrderDAO(Connection conn) {
		
		this.conn = conn;
	}
	
	// 주문목록 ORDERLIST 전체 데이터 개수
	public int getOrderDataCount() {
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from ORDERLIST";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dataCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {

			System.out.println(e.toString());
		}
		
		return dataCount;
	}

	// 주문목록 ORDERLIST 전체 데이터 리스트
	public  List<OrderDTO> getOrderLists(int start,int end){
		
		List<OrderDTO> lists = new ArrayList<OrderDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (select rownum rnum, data.* from (";
			sql+= "select productName,userId,payWay,orderAmount,totalPrice,orderNum,to_char(orderDate,'YYYY-MM-DD') orderDate,";
			sql+= "imgSaveFileName from ORDERLIST order by orderNum desc) data) where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDTO dto = new OrderDTO();

				dto.setProductName(rs.getString("productName"));
				dto.setUserId(rs.getString("userId"));
				dto.setPayWay(rs.getString("payWay"));
				dto.setOrderAmount(rs.getInt("orderAmount"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setOrderDate(rs.getString("orderDate"));
				dto.setImgSaveFileName(rs.getString("imgSaveFileName"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	// orderNum으로 한 개의 데이터 가져오기
	public OrderDTO getReadOrderData(int orderNum) {
		
		OrderDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select productName,userId,payWay,imgSaveFileName,";
			sql+= "orderAmount,totalPrice,orderDate from ORDERLIST where orderNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new OrderDTO();

				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setImgSaveFileName(rs.getString("imgSaveFileName"));
				dto.setUserId(rs.getString("userId"));
				dto.setPayWay(rs.getString("payWay"));
				dto.setOrderAmount(rs.getInt("orderAmount"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				dto.setOrderDate(rs.getString("orderDate"));
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	// 주문목록 삭제
	public int deleteDataOrderList(int orderNum) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete ORDERLIST where orderNum=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, orderNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {

			System.out.println(e.toString());
		}
		
		return result;
	}
	
	/*
	// 장바구니 수량 변경
	public int updateCart(JodenDTO2 dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update CART set cartAmount=? where productName=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getCartAmount());
			pstmt.setString(2, dto.getProductName());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
		
		return result;
	}
	

	// num의 max 구하기
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(num),0) from board";
			
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
	
	// 입력
	public int insertData(BoardDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into board (num,name,pwd,email,subject,content,";
			sql+= "ipAddr,hitCount,created) values (?,?,?,?,?,?,?,0,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr()); // created 와 hitCount 는 자동으로 들어감
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
}
