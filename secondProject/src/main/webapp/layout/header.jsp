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
<title>Insert title here</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script type="text/javascript">

        function searchData() {
            var f= document.searchForm;   
            f.action="<%=cp%>/cabin/shop/productList.gos";
            f.submit();    
        }
    </script>

    <style type="text/css">
        nav a{
            margin: 0 2em;
            display: flex; justify-content: flex-end;
        }

        nav form{
            display: flex; justify-content: flex-end;
            margin-right: 150px;
            margin-left: 30px;
        }


    </style>
</head>
<body>

 <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="" href="#"><img src="jodensLogo.png" height="60px"/></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
             
              
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  카테고리
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="<%=cp%>/cabin/shop/productList.gos">전체</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="<%=cp%>/cabin/shop/cateList.gos?category=의류">의류</a></li>
                  <li><a class="dropdown-item" href="<%=cp%>/cabin/shop/cateList.gos?category=무기">무기</a></li>
                  <li><a class="dropdown-item" href="<%=cp%>/cabin/shop/cateList.gos?category=도서">도서</a></li>
                  <li><a class="dropdown-item" href="<%=cp%>/cabin/shop/cateList.gos?category=음료">음료</a></li>
                </ul>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">알바</a>
                  </li>
              </li>
              
            </ul>
            <form class="d-flex" role="search" name="searchForm">
              <input class="form-control me-2" type="search" placeholder="상품명을 입력하세요" aria-label="Search" size="50">
              <button class="btn btn-outline-success" onclick="searchData();"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
              </svg></button>
            </form>
            <a class="nav-link active" aria-current="page" href="#">로그인</a>
            <a class="nav-link active" aria-current="page" href="#">회원가입</a>
          </div>
        </div>
      </nav>


</body>
</html>