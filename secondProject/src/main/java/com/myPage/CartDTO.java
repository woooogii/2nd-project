package com.myPage;

public class CartDTO {

	//장바구니 CART
private int productNum;
private String productName;
private String category;
private int price;
private int amount;
private String imgSaveFileName;
private String userId;
private String createdDate;
private int cartId;

private int cartAmount;

public int getProductNum() {
	return productNum;
}

public void setProductNum(int productNum) {
	this.productNum = productNum;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public String getImgSaveFileName() {
	return imgSaveFileName;
}

public void setImgSaveFileName(String imgSaveFileName) {
	this.imgSaveFileName = imgSaveFileName;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getCreatedDate() {
	return createdDate;
}

public void setCreatedDate(String createdDate) {
	this.createdDate = createdDate;
}

public int getCartId() {
	return cartId;
}

public void setCartId(int cartId) {
	this.cartId = cartId;
}

public int getCartAmount() {
	return cartAmount;
}

public void setCartAmount(int cartAmount) {
	this.cartAmount = cartAmount;
}

//private String imgOriginalFileName;


}
