<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조든의 오두막 결제창</title>
<link rel="icon" href="<%=cp%>/image/jodenfavicon.jpg">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/myPage/scc/myCart.css" />

<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/joden/pay/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.myForm.buyerAddr.value = roadFullAddr;

	}
</script>


<style type="text/css">
body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/pay/css/payImg.jpg') no-repeat;
	background-size: cover;
	background-position: center;
}

</style>


</head>
<body>

	<form action="<%=cp%>/cabin/pay/pay_ok.gos" method="post" name="myForm">
		<div id="bbs" style="text-align: center; align: center"
			style="margin: 0 auto;">

			

			<div id="bbsList_list">

				<div id="bbs_title" style="width: 200px; margin: 0 auto;">
				<h2>주문/결제</h2>
				</div>
				
				<div  class="topLine"><hr/></div>				

				<div>구매자 정보</div>
				
				<div  class="middleLine"><hr/></div>
				
				<div class="input-box">
					<span>이름</span> ${dto.userName }
				</div>

				<div class="input-box">
					<span>이메일</span> ${dto.userEmail } <input type="hidden"
						name="userName" value="${dto.userEmail }" />
				</div>

				<div class="input-box">
					<span>전화번호</span> ${dto.userTel }
				</div>

				<div  class="middleLine"><hr/></div>
				
				<div>배송지 정보</div>
				
				<div  class="middleLine"><hr/></div>

				<div class="input-box">
					<span>이름</span> ${dto.userName } <input type="hidden"
						name="userName" value="${dto.userName }" />
				</div>

				<div class="input-box">
					<span>주소</span> <input type="text" name="buyerAddr"
						value="${dto.userAddr }" readonly="readonly" size="35" /> <input
						type="button" onClick="goPopup();" value="주소검색" />
				</div>

				<div class="input-box">
					<span>전화번호</span> <input type="text" name="userTel" size="35"
						maxlength="50" class="boxTF" value="${dto.userTel }"
						placeholder="010-0000-0000" />
				</div>
				
				<div class="middleLine"><hr/></div>


				<div>결제 금액</div>
				<div>
				<!-- 결제금액 받는곳 -->
				</div>

				<div class="middleLine"><hr/></div>

				<div>
					<button onclick="requestPay();">결제하기</button>
					<a href="<%=cp%>/cabin/shop/productList.gos">결제취소</a>
				</div>

			</div>
		</div>
	</form>





</body>
</html>
