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
<title>Insert title here</title>
   <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
    
    
    <script type="text/javascript">

        function searchData() {
            var f= document.searchForm;
            
            f.action="<%=cp%>/cabin/shop/productList.gos";
            f.submit();
            
        }
        
        </script>

    <style>
@charset "UTF-8";
@import url("https://fronts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");



*{
	margin: 0px;
	padding :0px;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}






a{
	cursor: pointer;
	color:#000000;
	text-decoration: none;
	font-size:9pt;
	line-height: 150%;
}

a:hover, a:active{
	font-size: 9pt;
	color:#36d992;
	text-decoration: underline;
	
	
}

ul{
	font-size:9pt;	
}

.btn1{
	font-size:9pt;
	color:rgb(0,0,0);
	background-color: rgb(245,245,245);
	line-height: 16px;
}

.btn2{
	color : #000000;
	font : nomal 9pt '굴림','trebuchet ms',hevetica, san-serif;
	border:1px solid;
	background-color:#696 #363 #363 #696;
	line-height: 16px;
	padding: 1px 6px 1px 6px;
}

.wrapper{

	background: transparent;
	color:#fff;
	border: 2px solid rgba(255,255,255,.2);
	backdrop-filter: blur(5px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	color: #fff;
	

	height: 100px;
	width: 100%;
}


.wrapper h1 {
	font-size:36px;
	text-align: center;
	}
	
.wrapper .input-box {
	position: relative;
	width: 100%;
	height: 50px;
	margin: 30px 0;
}

.input-box input{
	width:100%;
	height: 100%;
	background:transparent;
	border:none;
	outline:none;
	border 2px solid rgba(255,255,255,.2);
	border-radius:40px;
	color: #fff;
	padding: 20px 45px 20px 20px;
}

.input-box input-placeholder {
	color:#fff;
}

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform:translateY(-50%);
	font-size: 20px;
}

.wrapper .remember-forgot {
	display: flex;
	justify-content: space-between;
	font-size: 14.5px;
	margin: -15px 0 15px;
}

.remember-forgot label input {
	accent-color: #fff;
	margin-right: 3px;
}

.remember-forgot a {
	color: #fff;
	text-decoration: none;
}

.remember-forgot a:hover{
	text-decoration:underline;
}

.wrapper .btn {
	width: 100%;
	height: 45px;
	background: #fff;
	border: none;
	outline: none;
	border-radius: 40px;
	box-shadow: 0 0 10px rgba(0,0,0,1);
	cursor: pointer;
	font-size: 16px;
	color:#333;
	font-weight:600;
	
}

.wrapper .register-link {
	font-size: 14.5px;
	text-align: center;
	margin: 20px 0 15px;
}

.register-link p a {
	color: #fff;
	text-decoration: none;
	font-weight:600;
}

.register-link p a:hover{
	text-decoration: underline;
}

body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: url('<%=cp%>/login/img.jpg') no-repeat;
	background-size: cover;
	background-position: center;

}
</style>
</head>
<body>
   






















	<div class="wrapper">



<c:choose>
	<c:when test="${empty sessionScope.UserInfo.userId }">
		 <div id="header-first">
			<div style="display: flex;">
				<span class="header-join">
				<a href="<%=cp%>/cabin/membership/created.gos">회원가입</a>
				</span>
				<span id="header-first-line">ㅣ</span>
				<span class="header-login">
				<a href="<%=cp%>/cabin/membership/login.gos">로그인</a>
				</span>
			</div>
		</div>
	</c:when>
	
	<c:otherwise>
		<div style="display: flex;">
			<span class="header-login">
			<a href="<%=cp%>/cabin/membership/login.gos">로그아웃</a>
			</span>
		</div>
	</c:otherwise>
</c:choose>
	

	
<form action="" name="searchForm" method="post">		
	<div id="header-first">
		<div style="display: flex;" class="">
			<div>
			카테고리
				<ul>
 					<li><a href="<%=cp%>/cabin/shop/productList.gos">전체보기</a></li>
 					<li><a href="<%=cp%>/cabin/shop/cateList.gos?category=의류">의류</a></li>
 					<li><a href="<%=cp%>/cabin/shop/cateList.gos?category=무기">무기</a></li>
 					<li><a href="<%=cp%>/cabin/shop/cateList.gos?category=도서">도서</a></li>
 					<li><a href="<%=cp%>/cabin/shop/cateList.gos?category=음료">음료</a></li>
				</ul>
			</div>
			<div>
				<span id="">
					<a href="<%=cp%>/cabin/shop/productList.gos"><img alt="" src="<%=cp%>/image/jodensLogo.png"></a>
				</span>
				
				<div class="input-box">
					<input type="text" name="searchValue" class="textField" placeholder="상품명 검색">
					<input type="button" value="검색" class="btn2" onclick="searchData();">
					</div>
				
				<span class="">
				<a href="">마이페이지</a>
				</span>
				<span class="">
				<a href="">장바구니</a>
				</span>
			</div>
		</div>
	</div>

</form>
	</div>

      
      <!-- Your page content goes here -->
      
      <script src="script.js">document.addEventListener('DOMContentLoaded', function() {
        // 드롭다운 메뉴 토글 기능
        var dropdowns = document.querySelectorAll('.dropdown');
      
        dropdowns.forEach(function(dropdown) {
          dropdown.addEventListener('mouseenter', function() {
            this.querySelector('.dropdown-content').style.display = 'block';
          });
      
          dropdown.addEventListener('mouseleave', function() {
            this.querySelector('.dropdown-content').style.display = 'none';
          });
        });
      });</script>           
</body>
</html>