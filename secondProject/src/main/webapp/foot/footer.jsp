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

<link rel="stylesheet" type="text/css" href="<%=cp%>/layout/layoutImg/layoutStyle.css"/>
<style type="text/css">
.layout {
  display: flex;
  gap: 16px;
}

</style>

<title>Insert title here</title>


</head>
<body>

<div style="margin: auto;">
    <section class="layout">
        <h1><a href="/" title="COUPANG">COUPANG</a></h1>
        
       	 <div>
            <address>
                상호명 및 호스팅 서비스 제공 : 조든의 오두막<br/>
                대표이사 : 리프리트 조든<br/>
                라퀴에트 상업도시 하비엘 스트리트 245-12 <br/>
                사업자 등록번호 : 123-45-67890 <br/>
                통신판매업신고 : 2024-라퀴에트하비엘-0224<br/>
                <a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767"
                   target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
            </address>
            </div>
            
            
            
            <div>
               
                    <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br/>
                    <em>1577-1234 (유료)</em>
                    라퀴에트 상업도시 하비엘 스트리트 245-12<br/>
                    <span class="contact-fax">email : help@jodenscavin.com</span>
                
            </div>
            <div>
	            <p>
	                <strong>고블린은행 채무지급보증 안내</strong><br/>
	                <span>
	                  당사는 고객님이 현금 결제한 금액에 대해<br/>고블린은행과 채무지급보증 계약을 체결하여<br/>안전거래를 보장하고 있습니다.<br/>
	              </span>
	                <a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
	            </p>
            </div>
        
    </section>
    <div class="footer-layer3 slide-unit">
        <div >
        <img src="./footerImg.jpg">
        </div>
    </div>
   
</div>

</body>
</html>