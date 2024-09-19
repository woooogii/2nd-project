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
<link rel="icon" href="<%=cp %>/image/jodenfavicon.jpg">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/product/css1/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/product/css1/list.css" />


<style type="text/css">
#bbsList_list img {
	width: 210px;
	height: 200px;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out; /* 변환 효과를 부드럽게 만듭니다. */
}

#bbsList_list img:hover {
	transform: translateY(-10px) scale(1.1); /* 마우스를 올릴 때 효과 적용 */
}

#bbsList_list a {
	text-decoration: none;
	color: #333;
}

#bbsList_list a:hover {
	color: #ff6600;
}

#bbsList_list {
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 30px 40px;
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




<script type="text/javascript">
	
</script>

</head>
<body>


	<div id="bbsList">
		<jsp:include page="header.jsp"></jsp:include>


		<div id="bbsList_header">


			<div id="rightHeader">
				<a href="<%=cp%>/cabin/shop/productList.gos">신상품순</a> <font
					color="ffc6ff">/</font> <a
					href="<%=cp%>/cabin/shop/productPriceList.gos">높은 가격순</a> <font
					color="ffc6ff">/</font> <a
					href="<%=cp%>/cabin/shop/productLowPriceList.gos">낮은 가격순</a>

			</div>

		</div>

		<div id="bbsList_list">
			<div style="padding-top: 5px;">
				<div style="display: flex; flex-wrap: wrap;">
					<c:forEach var="cate" items="${categoryLists }">
						<div style="margin-bottom: 10px; align-items: center;">
							<div style="width: 280px; height: 280px; text-align: center;">
								<a href="${articleUrl }&num=${cate.productNum}"> <img
									src="${imagePath }/${cate.imgSaveFileName }" width="210"
									height="200" /></a> <br />
								<font color="#fefae0">${cate.productName }</font> <font size="2"
									color="#f4a261">&#8361;${cate.price }</font> <a
									href="${deletePath }cateList.gos?category=${cate.category }&num=${cate.productNum}&pageNum=${pageNum }">삭제</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<div id="footer">
				<c:if test="${dataCount!=0 }">
			${cateIndexList }
			</c:if>
				<c:if test="${dataCount==0 }">
			등록된 게시물이 없습니다.
			</c:if>
			</div>

		</div>

	</div>





	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>