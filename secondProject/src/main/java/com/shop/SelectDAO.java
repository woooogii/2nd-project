package com.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SelectDAO {
	
	private Connection conn;
	
	public SelectDAO(Connection conn) {
		this.conn = conn;
	}
	
	//1가지 카테고리 상품 select (productList)
		public List<CreateProductDTO> selectProductList(String category){
			List<CreateProductDTO> categoryLists = new ArrayList<CreateProductDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from PRODUCTINFO where category=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CreateProductDTO dto = new CreateProductDTO();
					
					dto.setCategory(rs.getString("category"));
					dto.setProductName(rs.getString("productName"));
					dto.setPrice(rs.getInt("price"));
					dto.setProductDetailContent(rs.getString("productDetailContent"));
					dto.setAmount(rs.getInt("amount"));
					dto.setProductNum(rs.getInt("productNum"));
					dto.setImgSaveFileName(rs.getString("imgSaveFileName"));
					dto.setImgOriginalFileName(rs.getString("imgOriginalFileName"));
					
					categoryLists.add(dto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return categoryLists;
			
		}
		
		//전체 카테고리 상품 select (productList)
		public List<CreateProductDTO> selectAllProductList(int start,int end){
			List<CreateProductDTO> allProductLists = new ArrayList<CreateProductDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from (select rownum rnum,data.* from (select * from PRODUCTINFO order by productnum desc) data) where rnum>=? and rnum <=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CreateProductDTO dto = new CreateProductDTO();
					
					dto.setCategory(rs.getString("category"));
					dto.setProductName(rs.getString("productName"));
					dto.setPrice(rs.getInt("price"));
					dto.setProductDetailContent(rs.getString("productDetailContent"));
					dto.setAmount(rs.getInt("amount"));
					dto.setProductNum(rs.getInt("productNum"));
					dto.setImgSaveFileName(rs.getString("imgSaveFileName"));
					dto.setImgOriginalFileName(rs.getString("imgOriginalFileName"));
					
					allProductLists.add(dto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return allProductLists;
			
		}

}
