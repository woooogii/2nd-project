<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조든의 오두막</title>
<link rel="icon" href="<%=cp%>/image/jodenfavicon.jpg">

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/product/css1/list.css" />

<script type="text/javascript">

function searchData() {
	var f= document.searchForm;
	
	f.action="<%=cp%>/cabin/shop/productList.gos";
	f.submit();

	}
</script>

<style type="text/css">
body {
	
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/image/proList.jpg') no-repeat;
	background-size: cover;
	background-position: center;
}
</style>

</head>
<body>

	<div id="bbsList">
				<div id="bbsList_header">
					<jsp:include page="header.jsp"></jsp:include>
					<div id="leftHeader">
						<c:if test="${userInfo.userId eq 'admin'}">
							<span>
	  						 	<input type="button" value="상품등록" onclick="location='<%=cp%>/cabin/shop/create.gos';">
							</span>
						</c:if>
					</div>

					<div id="rightHeader">
						<a href="<%=cp%>/cabin/shop/productList.gos">신상품순</a>
							<font color="ffc6ff">/</font>
						<a href="<%=cp%>/cabin/shop/productPriceList.gos">높은 가격순</a>
							<font color="ffc6ff">/</font>
						<a href="<%=cp%>/cabin/shop/productLowPriceList.gos">낮은 가격순</a>
					
					</div>

				</div>

				<div id="bbsList_list">

					<div style="padding-top: 5px;">
						<div style="display: flex; flex-wrap: wrap;">
							<c:forEach var="dto" items="${allProductList }">
								<div style="margin-bottom: 10px; align-items: center;">
									<div style="width: 280px; height: 280px; text-align: center;">
										<a href="${articleUrl }&num=${dto.productNum}"> 
										<img src="${imagePath }/${dto.imgSaveFileName }" width="210"height="200" /></a> 
										<br /> <font color="#fefae0">${dto.productName }</font>
										<font size="2" color="#f4a261">&#8361;${dto.price }</font>
									<c:if test="${userInfo.userId eq 'admin'}">	
										<a href="${deletePath }?num=${dto.productNum}&pageNum=${pageNum }" >삭제</a>
									</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<div id="footer">
						<c:if test="${allProductDataCount!=0 }">${allProductIndexList }</c:if>
						<c:if test="${allProductDataCount==0 }">등록된 게시물이 없습니다.</c:if>
					</div>

				</div>

			</div>

</body>
</html>