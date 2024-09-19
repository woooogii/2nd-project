package com.myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class CartDAO {

	private Connection conn;

	public CartDAO(Connection conn) {

		this.conn = conn;
	}

	//1. 기존 장바구니 데이터 확인
	public boolean isCart(String userId) {
		CartDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart where userId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;	
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}

	//2. 장바구니 테이블 데이터 추가
	public int insertCart(CartDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into cart(cartId,userId,productNum,cartDate) values(?,?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getCartId());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getProductNum());

			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	//3. 장바구니 list 불러오기
		public List<CartDTO> getCartList(String userId,int start,int end){
			List<CartDTO> cartList = new ArrayList<CartDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from (select rownum rnum, data.* from (select c.cartId, p.productName,p.price, c.productNum, p.imgSaveFileName from cart c INNER JOIN PRODUCTINFO p on c.productNum = p.productNum WHERE userId = ?) data) where rnum>=? and rnum<=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);

				rs = pstmt.executeQuery();
				while(rs.next()) {
					CartDTO dto = new CartDTO();
					dto.setCartId(rs.getInt("cartId"));
					dto.setProductName(rs.getString("productName"));
					dto.setPrice(rs.getInt("price"));
					dto.setProductNum(rs.getInt("productNum"));
					dto.setImgSaveFileName(rs.getString("imgSaveFileName"));
					cartList.add(dto);
				}
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return cartList;
		}

	//4. 장바구니 내 한 아이디 당 상품 전체 수량 (cartAmount제외)
	public int getCartDataCount(String userId) {
		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(count(*),0) from CART where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
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

	//5. 장바구니에 담긴 상품 고유 코드 설정
	public int getCartId() {
		int cartId = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(max(cartId),0) from cart";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartId = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cartId;
	}

	//6. 장바구니 삭제
	public int deleteCart(int productNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql= "delete from CART where productNum=?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
////////////////////////////////////////////////////////////////////////
	public int getCartAmount() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(max(cartAmount),0) from cart";
		try {
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

	// 장바구니 수량 변경
	public int updateCart(CartDTO dto) {

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

	/*
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
