package com.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.member.MemDTO;

public class PayDAO {
	
	Connection conn;
	
	public PayDAO(Connection conn) {
		this.conn = conn;
	}
	
	public MemDTO getReadData(String userId) {
		MemDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			
			
			sql = "select userId, userPwd, userName, userEmail, userTel, userGender, userAddr, userBirth, userReg from USERINFO where userId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserReg(rs.getString("userReg"));
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	
}
