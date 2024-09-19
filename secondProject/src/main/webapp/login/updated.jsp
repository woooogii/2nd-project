<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/login/css/style.css" />


<script type="text/javascript">
        function sendIt() {
			var f = document.myForm;
            f.action = "<%=cp %>/cabin/membership/updated_ok.gos";
			f.submit();
	}

	function isValidKorean(input) {
		var koreanRegex = /^[가-힣]+$/;
		return koreanRegex.test(input);
	}

	function isValidEmail(input) {
		var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		return emailRegex.test(input);
	}
</script>

<style type="text/css">
body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/login/image.jpg') no-repeat;
	background-size: cover;
	background-position: center;
	
}
</style>

</head>
<body>



	<div id="bbs">
	<form action="" method="post" name="myForm">
		<div class="wrapper"
			style="width: 300px; margin: 0 auto; text-align: center; border: none;">
			
				<h2>회원정보 수정</h2>
		</div>
		<br />

		<div class="bbsCreated">

			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<div style="display: flex; justify-content: space-between;">
						<dt style="flex: 1;">아이디</dt>
						<dd style="flex: 1;">
							<input type="text" name="userId" size="35" maxlength="50"
								class="boxTF" value="${userInfo.userId}" />
						</dd>
					</div>
				</dl>
			</div>


			<br />
			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<dt>비밀번호</dt>
					<dd>
						<input type="password" name="userPwd" size="35" maxlength="20"
							class="boxTF" value="${dto.userPwd }" />
					</dd>
				</dl>
			</div>

			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<dt>이름</dt>
					<dd>
						<input type="text" name="userName" size="35" maxlength="50"
							class="boxTF" value="${dto.userName }" />
					</dd>
				</dl>
			</div>

			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<dt>전화번호</dt>
					<dd>
						<input type="text" name="userTel" size="35" maxlength="50"
							class="boxTF" value="${dto.userTel }" />
					</dd>
				</dl>

			</div>
			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<dt>이메일</dt>
					<dd>
						<input type="text" name="userEmail" size="35" maxlength="50"
							class="boxTF" value="${dto.userEmail}" />
					</dd>
				</dl>
			</div>





			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<dt>주소</dt>
					<dd>
						<input type="text" name="userAddr" size="35" maxlength="50"
							class="boxTF" value="${dto.userAddr}" />
					</dd>
				</dl>
			</div>
			<div class="input-box" style="width: 300px; margin: 0 auto;">
				<dl>
					<div style="display: flex; justify-content: space-between;">
						<dt style="flex: 1;">가입날짜</dt>
						<dd style="flex: 1;">${dto.userReg}</dd>
					</div>
				</dl>
			</div>

		</div>
		<br /> <br />
		
		
		
		<div id="button" style="width: 300px; margin: 0 auto; padding-left: 50px;">
			<input type="button" value="수정하기" class="button1" onclick="sendIt();" />
			<input type="button" value="수정취소" class="button1"
				onclick="location='<%=cp%>/cabin/order/myPage.gos';" />


		</div>


		</form>

	</div>


</body>
</html>