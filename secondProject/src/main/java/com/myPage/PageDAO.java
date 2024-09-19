package com.myPage;

import java.sql.Connection;

public class PageDAO {

	private Connection conn;
	
	public PageDAO(Connection conn) {
		
		this.conn = conn;
	}
}
