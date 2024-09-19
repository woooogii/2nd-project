<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/login/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/login/css/created.css">
<script type="text/javascript" src="<%=cp%>/login/js/util.js"></script>
<script type="text/javascript">


	function checkAll() {
		  var checkboxes = document.myForm["str2"];
		  var clength = checkboxes.length;
	
		  for (var i = 0; i < clength; i++) {
		    checkboxes[i].checked = !checkboxes[i].checked;
		  }
		}

	function sendIt() {
		var f = document.myForm;
		
		str = f.userId.value;
		str = str.trim();
		if(!str) {
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return;	
		}
	
		str = f.userId.value;
	
		str = f.userPwd.value;
		str = str.trim();
		if(!str) {
			alert("비밀번호를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		
		str = f.userPwd.value;
		
		str = f.userPwd2.value;
		str = str.trim();
		if(!str) {
			alert("확인용 비밀번호를 입력하세요.");
			f.userPwd2.focus();
			return;
		}
		
		if(f.userPwd.value != f.userPwd2.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.userPwd.value="";
			f.userPwd2.value="";
			f.userPwd.focus();
			return;
		}
		
		
		str = f.userPwd2.value;
		
		str = f.userName.value;
	
		str = f.userName.value;
		str = str.trim();
		if(!str) {
			alert("이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		
		str = f.userEmail.value;
		
		str = f.userEmail.value
		str = str.trim();
		if(!str) {
			alert("이메일을 입력하세요.");
			f.userEmail.focus();
			return;
		}
		
		str = f.userEmail.value;
		
		str = f.userTel.value;
		str = str.trim();
		if(!str) {
			alert("전화번호를 입력하세요.");
			f.userTel.focus();
			return;
		}
		
		str = f.userTel.value;
		
		str = f.userGender.value;
		str = str.trim();
		if(!str) {
			alert("성별을 선택하세요.");
			f.userGender.focus();
			return;
		}
		
		str = f.userGender.value;
		
		str = f.userAddr.value;
		str = str.trim();
		if(!str) {
			alert("주소를 입력하세요.");
			f.userAddr.focus();
			return;
		}
		
		

		str = f.userAddr.value;
		
		str = f.userBirth.value;
		str = str.trim();
		if(!str) {
			alert("생일을 입력하세요.");
			f.userBirth.focus();
			return;
		}
		
		str = f.userBirth.value;
		
		f.action = "<%=cp%>/cabin/membership/created_ok.gos"
		f.submit();
	
	}
</script>
	
	<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/joden/login/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.myForm.userAddr.value = roadFullAddr;

	}
</script>
	
	
	
</head>
<body>

<div id="bbs">

	<div id = "bbs_title" style="width: 300px; margin: 0 auto;">
		<dt>회원가입</dt>
	</div>

	<form action="" method="post" name="myForm">
	<div id = "bbsCreated">
	
		<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>아&nbsp;이&nbsp;디</dt>
				<dd>	
				<input type="text" name="userId" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>패&nbsp;스&nbsp;워&nbsp;드</dt>
				<dd>
				<input type="password" name="userPwd" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>패스워드 확인</dt>
				<dd>
				<input type="password" name="userPwd2" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>이&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
				<dd>
				<input type="text" name="userName" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>이&nbsp;메&nbsp;일</dt>
				<dd>
				<input type="text" name="userEmail" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>전&nbsp;화&nbsp;번&nbsp;호</dt>
				<dd>
				<input type="text" name="userTel" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>성&nbsp;&nbsp;&nbsp;&nbsp;별</dt>
				<dd>
				<input type="radio" name="userGender" size="35" maxlength="50" class="boxTF" value="남자"/>
				남자
				<input type="radio" name="userGender" size="35" maxlength="50" class="boxTF" value="여자"/>
				여자
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto; display: flex; align-items: center;">
    <dl>
        <dt>주&nbsp;&nbsp;&nbsp;&nbsp;소</dt>
        <dd>
            <input type="text" name="userAddr" size="35" maxlength="50" class="boxTF"/>
            <input type="button" onClick="goPopup();" value="주소검색"/>
        </dd>
   	 </dl>
	</div>

	
	<div class="bbsCreated_bottomLine" style="width: 300px; margin: 0 auto;">
			<dl>
				<dt>생&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
				<dd>
				<input type="text" name="userBirth" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
	</div>
	
<br/><br/>

	<div style="border: 1px solid #000; width: 400px; margin: 0 auto; padding: 10px;">
    <div colspan="3" name="str2" value="전체동의">
        <h3></h3>
        
		<input type="checkbox" onclick="checkAll();">
        </a>[필수] 인증 약관 전체동의
    </div>
    <div style="display: flex; justify-content: space-between;">
        <div>
            <input type="checkbox" name="str2">
            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewPersonalInfoTerms&v=1">
                개인정보이용
            </a>
        </div>
        <div>
            <input type="checkbox" name="str2">
            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewUniqInfoTerms&v=1">
                고유식별정보처리
            </a>
        </div>
    </div>
    <div style="display: flex; justify-content: space-between;">
        <div>
            <input type="checkbox" name="str2">
            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewCellPhoneCarriersTerms&v=1">
                통신사 이용약관
            </a>
        </div>
        <div>
            <input type="checkbox" name="str2">
            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewServiceTerms&v=1">
                이용사 이용약관
            </a>
        </div>
    </div>
</div>

<br/>
	<div id="bbsCreated_footer" style="width: 300px; margin: 0 auto;" >
	<input type="button" value = "가입하기" class="btn2" onclick="sendIt();"/>
	<input type="button" value=" 작성취소 " class="btn2" onclick="location='<%=cp %>/cabin/membership/login.gos';">
	</div>
	
	</div>
	
	
	</form>

<br/>

<jsp:include page="footer.jsp"></jsp:include>




</div>





</body>
</html>