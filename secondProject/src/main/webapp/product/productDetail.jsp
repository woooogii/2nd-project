<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>

<%
	int reviewNo = 1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
function sendIt() {
	var f = document.myForm;

		alert("로그인 후 작성 가능합니다.");
		f.action="<%=cp%>/cabin/membership/login.gos";
		f.submit();
		window.event.returnValue = false;
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조든의 오두막</title>
<link rel="icon" href="<%=cp %>/image/jodenfavicon.jpg">
<style type="text/css">
#bbsList {
	position: fixed;
	position: relative;
}

.bbsList_list img {
	width: 400px;
	height: 400px;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.bbsList_list {
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 30px 40px;
}

#sidebar {
	position: fixed;
	top: 0;
	right: 0;
	width: 200px; /* 적절한 너비 설정 */
	background-color: #f4f4f4;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

body {
	display: flex;
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
	<form action="" method="post" name="myForm">
		<!-- 상품 디테일 -->
		<div id="bbsList">
			<jsp:include page="header.jsp"></jsp:include>
			<br />
			<div class="bbsList_list">
				<div style="display: flex;">
					<div>
						<div>					
							<img alt="" src="${imagePath }/${productList.imgSaveFileName }"
								class="img" />
						</div>

						<div class="part_first_detail">
							<div class="font_main">[${productList.category }]</div>
							<div class="font_main">${productList.productName }</div>
							<div class="font_main">&#8361;${productList.price }</div>
							<div style="align-content: center;">
								<a href="<%=cp%>/cabin/pay/pay.gos" style="color: #a2d2ff; text-shadow: 0 0 7px #a2d2ff, 0 0 10px #a2d2ff, 0 0 21px #a2d2ff"><font size="5">Buy</font></a> 
								<a href="<%=cp%>/cabin/order/myCart_ok.gos?pageNum=${pageNum}&cartnum=${productList.productNum}"
								 style="color: #ffafcc; text-shadow: 0 0 7px #ffafcc, 0 0 10px #ffafcc, 0 0 21px #ffafcc"><font size="5">Cart</font></a>
								<a href="<%=cp%>/cabin/order/myCart.gos" style="color: #a2d2ff; text-shadow: 0 0 7px #a2d2ff, 0 0 10px #a2d2ff, 0 0 21px #a2d2ff"><font size="5">CartList</font></a> 
								<a href="<%=cp %>/cabin/shop/productList.gos?pageNum=${pageNum}"
								style="color: #ffafcc; text-shadow: 0 0 7px #ffafcc, 0 0 10px #ffafcc, 0 0 21px #ffafcc"><font size="5">List</font></a>
							</div>
						</div>

						<div class="font_main">${productList.productDetailContent }</div>
					</div>
				</div>
			</div>

			<br />
			<!-- 리뷰 시작 -->

			<div class="bbsList_list">

				<div>
					리뷰 ${reviewCount}
					<c:choose>
						<c:when test="${empty sessionScope.userInfo.userId}">
							<span><a href="javascript:location=sendIt();">Write</a></span>
							<span><a href="<%=cp%>/cabin/review/review.gos?num=${productList.productNum}">All</a></span>
						</c:when>

						<c:otherwise>
							<span><a href="<%=cp%>/cabin/review/writeReview.gos?userId=${sessionScope.userInfo.userId}&num=${productList.productNum}">Write</a></span>
							<span><a href="<%=cp%>/cabin/review/review.gos?num=${productList.productNum}">All</a></span>
						</c:otherwise>
					</c:choose>
				</div>
				<br />
				<div>
					<c:if test="${reviewList != null}">
						<c:forEach var="review" items="${reviewList }">
							<div>
								<span>${review.reviewNum }</span>
								<span>${review.content }</span>
								<span>${review.userName }</span>
								<span style="float: right: ;">${review.reviewDate }</span>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div id="footer">
					<c:if test="${reviewCount!=0 }">${reviewIndexList }</c:if>
					<c:if test="${reviewCount==0 }">등록된 게시물이 없습니다.</c:if>
				</div>
			</div>
		</div>
<input type="hidden" name="num" value="${productList.productNum}">
	</form>
<br/><br/><br/>
<br/><br/><br/>
</body>
</html>