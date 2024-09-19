<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="<%=cp%>/myPage/scc/myCart.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/myPage/scc/dcart.css" />
<script type="text/javascript" src="<%=cp%>/myPage/scc/util.js"></script>

<script type="text/javascript" src="<%=cp%>/myPage/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/myPage/scc/cartutil.js"></script>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script type="text/javascript" src="<%=cp%>/myPage/scc/aaa.js"></script> 

<script type="text/javascript">
	
	function searchData() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/myPage/myCart.gos"
		f.submit();
	}
	
</script>


<style type="text/css">

body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/myPage/img/myPage.jpg') no-repeat;
	background-size: cover;
	background-position: center;
}

</style>

</head>
<body>
<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
	<div id="bbsList">
		<div id="bbsList_list">

			<div class="titleArea">
				<h2>장바구니</h2>
			</div>

			<div class="xans-order-basketpackage ">
				<div class="orderListArea ec-base-table typeList">
					
 
					<table>

                    <div class="subdiv row head" style="color: #f4a261; margin-left: 0px;">
					    <span style="display: inline-block; width: 50px;">선택</span>
					    <span style="display: inline-block; width: 190px;">이미지</span>
					    <span style="display: inline-block; width: 150px;">상품명</span>
					    <span style="display: inline-block; width: 100px;">가격</span>
					    <span style="display: inline-block; width: 125px;">수량</span>
					    <span style="display: inline-block; width: 110px;">합계</span>
					    <span style="display: inline-block; width: 60px;">선택</span>
					</div>
				
						<tbody class="center">

							
 <c:forEach var="cartDto" items="${cartList}">
        <tr class="data" style="">
            <td class="subdiv" style="width: 400px;">
			    <div class="check" style="display: inline-block; width: 50px; margin-left: 10px;">
			        <input type="checkbox" name="buy" value="262" checked="" onclick="javascript:basket.checkItem();">
			        &nbsp;
			    </div>
			    <div class="img" style="display: inline-block; width: 180px;">
			        <img style="max-width: 100px;" src="${imagePath}/${cartDto.imgSaveFileName}">
			    </div>
			    
			    <div class="pname" style="display: inline-block;">
			        <div style="">${cartDto.productName}</div>
			    </div>
			</td>
			
            <td class="subdiv" style="width: 350px;">
			    <span class="basketprice" style="width: 100px;">
			        <input 
			        type="hidden" name="p_price" id="p_price${cartDto.cartId}" class="p_price" value="${cartDto.price}">
			        ${cartDto.price}
			    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <span class="num" style="width: 90px;">
			        <span class="updown" style="width: 90px;">
			            <span onclick="javascript:basket.changePNum(${cartDto.cartId});">
			                <i class="fas fa-arrow-alt-circle-up up"></i>
			            </span>
			            <input style="color: black;height: 80%;" type="text" name="p_num${cartDto.cartId}" id="p_num${cartDto.cartId}" 
			            size="2" maxlength="4" class="p_num" value="${cartDto.cartAmount}" onkeyup="javascript:basket.changePNum(${cartDto.cartId});">
			            <span onclick="javascript:basket.changePNum(${cartDto.cartId});">
			                <i class="fas fa-arrow-alt-circle-down down"></i>
			            </span>
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        </span>
			    </span>
			    <span class="sum" style="width: 90px;">${cartDto.price * cartDto.cartAmount}</span>
			    
			</td>

            <td class="subdiv">
                <div class="basketcmd" >
                    <a style="display: inline-block; width: auto;"
                    href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a>
                </div>
            </td>
        </tr>
        <tr><td colspan="7" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
    </c:forEach>
	
							<c:if test="${cartDataCount == 0}">
				                장바구니가 비어 있습니다.
				            </c:if>
							
						</tbody>
						
						  
        

					</table>

				</div>

				<div><br/>
					<table>
						<tr>
							<td align="left"><strong class="text">선택상품을</strong>
							<a href="javascript:void(0)" class="abutton" 
							onclick="javascript:basket.delCheckedItem();">삭제하기</a>
							

							</td>
							
							<td align="right">
								<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 0개</div>
            					<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 0원</div>
							
							</td>
						</tr>
						
						
					</table>
				</div><br/>

					

						<div align="center">
			                <a href="<%=cp%>/cabin/pay/pay.gos" onclick="javascript:void(0);">전체 상품 주문</a>						            
			            </div>

				


			<div id="bbs_title" style="padding-top: 80px;">
				<table border="1">

					<tr>
						
						<ol><h4>장바구니 이용안내</h4>
							<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
							<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로
								이동하여 결제하실 수 있습니다.</li>
							<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면
								됩니다.</li>
							<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
							<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실
								수 있습니다.</li>
							<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로
								교체됩니다.</li>
						</ol>
					</tr>
				</table>
			</div>

		<hr class="layout">
	</div>
</div>
</div>
 </form>

</body>
</html>