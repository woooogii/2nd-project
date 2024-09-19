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
<title>리뷰 작성</title>

<script type="text/javascript">
	function sendIt() {
		var f = document.myForm;
	
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("내용을 입력하세요!");
			f.content.focus();
			window.event.returnValue = false;
			return;
		}
		
		f.content.value = str;
		
		str = f.reviewPwd.value;
		str = str.trim();
		if(!str){
			alert("내용을 입력하세요!");
			f.reviewPwd.focus();
			window.event.returnValue = false;
			return;
		}
		
		f.reviewPwd.value = str;
		
		alert("리뷰가 등록되었습니다.");
		
		f.action="<%=cp%>/cabin/review/writeReview_ok.gos";
		f.submit();
		window.event.returnValue = false;
	

	}
</script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/review/css/review.css" />

<style type="text/css">
body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/image/proList.jpg') no-repeat;
	background-size: cover;
	background-position: center;
}

textarea::placeholder {
	color: white;
}

#bbsList {
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

#bbsList_list {
	display: flex;
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
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

.bbsList_list_title {
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 10px 40px;
	text-align: center;
}

.bbsList_list_line {
	border-top: 2px solid #fff;
	margin: 12px 0px;
	opacity: 0.2;
}

.textbox {
	background: transparent;
	border: 1px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 10px 40px;
	text-align: center;
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

.bbsList_list_sub {
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	padding: 1px 6px 1px 6px;
	border-radius: 5px;
	height: 30px;
}

#bbsList_list_save {
	text-align: center;
	background: transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 8px 40px;
	text-align: center;
	width: 30px;
	align-self: center;
}

</style>


</head>
<body>
<form action="" method="post" name="myForm">

	<div id="container">
		<div id="bbsList">

			<jsp:include page="header.jsp"></jsp:include>
			<br />
			<div class="bbsList_list_title">
				<div>
					<span>Write Review</span>
				</div>
				<div class="bbsList_list_line"></div>
				<div>
					<textarea rows="7" cols="60" name="content" class="textbox"
						placeholder="내용을 입력해주세요."></textarea>
				</div>
				<br />
				<div>
					<dl>
						<dt>비밀번호</dt>
						<dd>
							<input type="passward" name="reviewPwd" placeholder="passward" />
						</dd>
					</dl>
				</div>

				<br />

			</div>
			<br />
		</div>
			<div id="bbsList_list_save">
				<a href="javascript:location=sendIt();">save</a>
			</div>
	</div>
</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>