package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	private static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/database 이름";  // MySQL URL
			String user = "사용자 이름";  // MySQL 사용자 이름
			String pwd = "비밀번호";  // MySQL 비밀번호
			
			if(conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL 드라이버 클래스
				conn = DriverManager.getConnection(url, user, pwd);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return conn;
	}
	
	public static void close() {
		if(conn==null) {
			return;
		}
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		conn = null;
	}
}
