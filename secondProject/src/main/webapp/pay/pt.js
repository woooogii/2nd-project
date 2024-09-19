// 가맹점 식별 코드 : imp64297364
	// REST API : 7440562304225525
  	var IMP = window.IMP;
 		IMP.init("imp68667140"); // "iamport" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	//결제시 전달되는 정보
	IMP.request_pay({
		pg : 'html5_inicis',
	    pay_method: "card",
	    merchant_uid: "ORD20180131-0003366",
	    name : '혹한의 검 외 5개 상품',
	    amount : 212000,
	    buyer_email : 'ykh@joden.com',
	    buyer_name : '유경훈',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 역삼동',
		buyer_postcode : '123-456',
		m_redirect_url : 'http://localhost:8080/joden/cabin/shop/productList.gos'   // member_phone  (buyer_email / addr 등 데이터 입력 가능
			}, function(rsp) {
				var result = '';      // result 로 성공 여부 판별
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';           // 결제 성공시 코드 메시지 내용
			        msg += '고유ID : ' + rsp.imp_uid;        // 얘도 결제 할때 구분 되는 코드라는데 정확하게 모르겠어연
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num; 
			        result ='0';
			    } else {        
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        result ='1';
			        history.back();
			    }
			    if(result=='0') {  
                                // 성공시 addCoin 서블릿 주소를 통해 값을 넘겼음 -> 매우 간단하게 한거라서 보안에 취약할듯
			    	location.href="pay_ok.gos";  
			    }
			    alert(msg);
			});