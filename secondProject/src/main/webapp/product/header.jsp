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
            
            f.action = "<%=cp %>/cabin/shop/productList.gos";
			f.submit();

	}
</script>

<style>
body {
	margin: 0;
	font-family: 'Sunflower', sans-serif;
	font-size: large;
	z-index: 998;
}

@charset "UTF-8";

@import
	url("https://fronts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap")
	;

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

a {
	cursor: pointer;
	color: #fff;
	text-decoration: none;
	font-size: 9pt;
	line-height: 150%;
}

a:hover, a:active {
	font-size: 9pt;
	color: #36d992;
	text-decoration: underline;
}

ul {
	font-size: 9pt;
}

.btn1 {
	font-size: 9pt;
	color: rgb(0, 0, 0);
	background-color: rgb(245, 245, 245);
	line-height: 16px;
}

.btn2 {
	color: #000000;
	font: nomal 9pt '굴림', 'trebuchet ms', hevetica, san-serif;
	border: 1px solid;
	background-color: #696 #363 #363 #696;
	line-height: 16px;
	padding: 1px 6px 1px 6px;
}

.wrapper {
	text-align: center; background : transparent;
	color: #fff;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	color: #fff;
	border-radius: 10px;
	padding: 30px 40px;
	background: transparent;
}

.wrapper h1 {
	font-size: 36px;
	text-align: center;
}

.wrapper .input-box {
	position: relative;
	width: 100%;
	height: 50px;
	margin: 30px 0;
}

.input-box input {
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none; border 2px solid rgba(255,255,255,.2);
	border-radius: 40px;
	color: #fff;
	padding: 20px 45px 20px 20px;
}

.input-box input-placeholder {
	color: #fff;
}

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
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

.remember-forgot a:hover {
	text-decoration: underline;
}

.wrapper .btn {
	width: 100%;
	height: 45px;
	background: #fff;
	border: none;
	outline: none;
	border-radius: 40px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1);
	cursor: pointer;
	font-size: 16px;
	color: #333;
	font-weight: 600;
}

.wrapper .register-link {
	font-size: 14.5px;
	text-align: center;
	margin: 20px 0 15px;
}

.register-link p a {
	color: #fff;
	text-decoration: none;
	font-weight: 600;
}

.register-link p a:hover {
	text-decoration: underline;
}


.header-menu {
      display: flex;
    justify-content: space-between; /* 간격을 좌우로 넓힘 */
    align-items: center; /* 세로 중앙 정렬을 위해 추가 */
}


#topMenu {
            height: 25px;  
            width: 48px;       /* [변경] 하위 메뉴와 동일하게 맞춤 */
            
            background-color:transparent; /* [추가] 늘어난만큼 배경색도 보이도록 수정 */
    }
    #topMenu ul {           /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
        list-style-type: none;  
        margin: 0px;            
        padding: 0px;           
    }
    #topMenu ul li {            /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
        color: white;               
        background-color:transparent;
        float: left;                
        line-height: 30px;          
        vertical-align: middle;     
        text-align: center;         
        -position: relative;         
    }
    .submenuLink {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
        text-decoration:none;               
        display: block;                     
        width: 100px;                       
        font-size: 12px;                    
        font-weight: bold;                  
        font-family: "Trebuchet MS", Dotum; 
    }
    .menuLink {     /* 상위 메뉴의 글씨색을 흰색으로 설정 */
        color: white;
    }
    .topMenuLi:hover .menuLink {    /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
        color: white;                 
       
    }
    .longLink {     /* 좀 더 긴 메뉴 스타일 설정 */
        width: 100px;   
    }
.submenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
        color: #2d2d2d;             
        background-color: #fff;      /* [변경] 배경색 변경 */
        -border: solid 1px black;    /* [삭제] 테두리 삭제 */
        -margin-right: -1px;         /* [삭제] 공백 보정 삭제 */
    }
    .submenu {              /* 하위 메뉴 스타일 설정 */
        position: absolute;     
        height: 0px;            
        overflow: hidden;       
        transition: height .2s; 
        -webkit-transition: height .2s; 
        -moz-transition: height .2s; 
        -o-transition: height .2s; 
        width: 500px;           
        left: 0;                
        background-color: #DDD; /* [추가] 하위 메뉴 전체에 배경색 설정 */
    }
    .submenu li {
        display: inline-block;
    }
    .topMenuLi:hover .submenu { 
        height: 16px;           
    }
    .submenuLink:hover {        
        color: black;                 
        background-color: #dddddd;  
    }
    
.neonText  { color: #fff; text-shadow: /* White glow */ 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, }
.dropdown {
    position: relative;
    display: inline-block;
    margin-right: 10px;
    z-index: 3; /* 다른 요소 위에 나타나도록 설정 */
	}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #333;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 9999;
}

.dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #555;
}

.dropdown:hover .dropdown-content {
    display: block;
}

</style>
</head>
<body>

	<div class="wrapper">
		<c:choose>
			<c:when test="${empty sessionScope.userInfo.userId }">
				<div id="header-first">
					<div style="display: flex;">
						<span class="header-join">
						 	<a href="<%=cp%>/cabin/membership/created.gos" style="color: #ffb703; text-shadow: 0 0 7px #ffb703, 0 0 10px #ffb703, 0 0 21px #ffb703">회원가입</a>
									<font style="color: #ffb703; text-shadow: 0 0 7px #ffb703, 0 0 10px #ffb703, 0 0 21px #ffb703"> /</font>
							<a href="<%=cp%>/cabin/membership/login.gos" style="color: #ffb703; text-shadow: 0 0 7px #ffb703, 0 0 10px #ffb703, 0 0 21px #ffb703">로그인</a>
						</span>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<div style="display: flex;">
					<span class="header-login"> 
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=cp%>/cabin/membership/logout.gos" style="text-shadow: 0 0 7px #ffb703, 0 0 10px #ffb703, 0 0 21px #ffb703">로그아웃</a>
					</span>
				</div>
			</c:otherwise>
		</c:choose>


		<form action="" name="searchForm" method="post">
	
		
			<div id="header-first">
				<div style="display: flex;" class="header-menu">
					<a href="<%=cp%>/cabin/shop/productList.gos"><img src="<%=cp %>/image/jodensLogo.png" height="60px"></a>
					
					
		
					
	  <div id="topMenu">
        <ul>
            <li class="topMenuLi">
                <a href="#" class="menuLink" style="color: #fefae0; text-shadow: 0 0 7px #2a9d8f, 0 0 10px #2a9d8f, 0 0 21px #2a9d8f">카테고리</a>
                <ul class="submenu">
                    <li><a href="<%=cp%>/cabin/shop/productList.gos" class="submenuLink">전체보기</a></li>
                    <li><a href="<%=cp%>/cabin/shop/cateList.gos?category=의류" class="submenuLink">의류</a></li>
                    <li><a href="<%=cp%>/cabin/shop/cateList.gos?category=무기" class="submenuLink">무기</a></li>
                    <li><a href="<%=cp%>/cabin/shop/cateList.gos?category=도서" class="submenuLink">도서</a></li>
                    <li><a href="<%=cp%>/cabin/shop/cateList.gos?category=음료" class="submenuLink">음료</a></li>
                </ul>
            </li>
         
        </ul>
    </div>
					
					
					<div>
						<span id=""> <a href="<%=cp%>/cabin/main.gos"> <img
								alt="" src="">
						</a>
						</span> <span class=""> 
						<input type="text" name="searchValue" class="textField" placeholder="상품명 검색"> 
						<input type="button" value="검색" class="btn2" onclick="searchData();">
						
						</span> <span class=""> <a href="<%=cp %>/cabin/order/myCart.gos" style="color: #ffb703; text-shadow: 0 0 7px #ffb703, 0 0 10px #ffb703, 0 0 21px #ffb703">장바구니</a>
						</span>
					</div>
				</div>
			</div>

		</form>

	</div>
</body>
</html>