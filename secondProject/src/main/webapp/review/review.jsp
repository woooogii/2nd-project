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
<title>상품리뷰</title>
<link rel="icon" href="<%=cp %>/image/jodenfavicon.jpg">
<link rel="stylesheet" type="text/css" href="<%=cp%>/review/css/review.css" />

<script type="text/javascript">

function sendIt() {
	var f = document.myForm;
	
	f.action = cp+"/cabin/review/writeReview.gos"
}

</script>

<style type="text/css">

#bbsList{
position: fixed;
position: relative;
}

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

#bbsList_list{
	background: transparent;
	color:#fff;
	border: 2px solid rgba(255,255,255,.2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	color: #fff;
	border-radius: 10px;
	padding: 30px 40px;
	
	
}

body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/image/proList.jpg') no-repeat;
	background-size: cover;
	background-position: center;
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

</style><style type="text/css">

#bbsList{
position: fixed;
position: relative;
}

#bbsList_list img {
  width: 210px;
  height: 200px;
  border-radius: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out; /* 변환 효과를 부드럽게 만듭니다. */
}

#bbsList_list{
	display: flex;
	background: transparent;
	color:#fff;
	border: 2px solid rgba(255,255,255,.2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	color: #fff;
	border-radius: 10px;
	padding: 30px 40px;
	text-align: center;
	
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

.bbsList_list_title{
	background: transparent;
	color:#fff;
	border: 2px solid rgba(255,255,255,.2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	color: #fff;
	border-radius: 10px;
	padding: 8px 40px;
	text-align: center;

}

.bbsList_list_line{
  border-top: 2px solid #fff;
  margin: 30px 0px;
  opacity: 0.2;
	
}

body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/image/proList.jpg') no-repeat;
	background-size: cover;
	background-position: center;
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


.bbsList_list_sub{
	display: flex;
	background: transparent;
	color:#fff;
	border: 2px solid rgba(255,255,255,.2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	padding:1px 6px 1px 6px;
	border-radius: 5px;
	height: 30px;
}


</style>
</head>
<body>
<div id="container">
<div id="bbsList">

<jsp:include page="header.jsp"></jsp:include>
<br />
		<form action="" method="post" name="myForm">	
				<div class="bbsList_list_title">
					<div style="align-content: center;">리뷰</div>
				</div>
<br />
					<div class="bbsList_list">
						<div class="bbsList_list_sub" >
							<span style="width: 10%; text-align: center;">no</span>
							<span style="width: 60%;text-align: center;">review</span>
							<span style="width: 15%;text-align: center;">name</span>
							<span style="width: 15%;text-align: center;">date</span>
						</div>
						
						<div>
							<!-- 		확장for문 -->
							<c:forEach var="allReview" items="${allReviewList }">
								<div class="bbsList_list_line"></div>
								<div style="display: flex; font-size: 8pt;">
								<span style="width: 10%;text-align: center;">${allReview.rnum }</span>
								<span style="width: 60%;text-align: center;">${allReview.content }</span>
								<span style="width: 15%;text-align: center;">${allReview.userName }</span>
								<span style="width: 15%;text-align: center;">${allReview.reviewDate }</span>
								</div>
							</c:forEach>
						</div>
<br />
						<div id="footer" style="text-align: center;">
							<p>
								<c:if test="${reviewDataCount!=0 }">${reviewIndexList }</c:if>
								<c:if test="${reviewDataCount==0 }">등록된 게시물이 없습니다.</c:if>
							</p>
						</div>
					</div>
			</form>
			
		</div>
</div>


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>