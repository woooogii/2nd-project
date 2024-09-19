<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>

 <%
              // 현재 날짜를 가져오기
              Calendar calendar = Calendar.getInstance();
 			  SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd (E)");
              String currentDate = dateFormat.format(calendar.getTime());
              calendar.add(Calendar.DAY_OF_MONTH, 2);
              String futureDate = dateFormat.format(calendar.getTime());
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조든의 오두막 결제창</title>
<link rel="icon" href="<%=cp%>/image/jodenfavicon.jpg">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/myPage/scc/myCart.css" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="<%=cp%>/pay/pt.js"></script>


<script type="text/javascript" src="<%=cp%>/payTest/pt11.js"></script>


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

				<div id="bbs_title" style="width: 300px; margin: 0 auto;">
				<h2>구매 완료</h2>
				</div>
				
				<div class="topLine"><hr/></div>				

				<div>주문이 완료되었습니다.</div>
				
				<div  class="middleLine"><hr/></div>
				
				<div>
				<span><%=futureDate %></span> 새벽 도착 보장
				</div>
				
				<div  class="middleLine"><hr/></div>
				
				<div class="input-box">
					<span>이름</span> ${userInfo.userName }
				</div>

			

				<div class="input-box">
					<span>전화번호</span> ${dto.userTel }
				</div>

				<div class="input-box">
					<span>주소</span> ${dto.userAddr }
				</div>
			
				
				
				<div class="middleLine"><hr/></div>


				<div>결제 금액</div>
				<div>
				3,000
				</div>

				<div class="middleLine"><hr/></div>

				<div>
					<a href="<%=cp %>/cabin/shop/productList.gos" style="color: white; border: dotted #f4a261;">쇼핑계속하기</a>			
					<button onclick="cancelPay()">환불하기</button>

				</div>

			</div>
		</div>
	</form>







</body>
</html>