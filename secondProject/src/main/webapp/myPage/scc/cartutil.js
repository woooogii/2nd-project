$(document).ready(function() {
    $('.form-1__checkbox-all').change(function(){
        if(this.checked){
            $('.form-1__checkbox-item:not(:checked').prop('checked', true);
        }
else{
	$('.form-1__checkbox-item:checked').prop('checked', false);
}
    });
});







$(document).ready(function(){

    // check box 눌렀을 경우 정보 담아주는 변수
    var cart = {
        buyList : [],
        init : function() {
            //buyList 초기화
            this.buyList = [];
        },
        getBuyList : function(obj) {
            return this.buyList;
        },
        getFindIndex : function(cd) {
            //배열 중복 검색
            var fIdx = -1;
            this.buyList.forEach(function(item, idx, ary) {
                if(item.code == cd) {
                    fIdx = idx;
                }
            });
            return fIdx;
        },
        addBuyList : function(obj) {
            var fIdx = this.getFindIndex(obj.code);
            if(fIdx == -1) {
                this.buyList.push(obj);
            } else {
                this.buyList[fIdx] = obj;
            }
            this.render();
        },
        deleteBuyList : function(cd) {
            this.buyList.splice(this.getFindIndex(cd), 1);
            this.render();
        },
        getTotalPay : function() {
            //총 결제금액 계산
            var totalQty = 0;
            var totalPrice = 0;
            
            this.buyList.forEach(function(item, idx, ary) {
                totalQty += Number(item.qty);
                totalPrice += Number(item.price)*Number(item.qty);
            });
            return {
                totalQty : totalQty,
                totalPrice : totalPrice
            };
        },
        render : function() {            
            // 주문 table 그리기
            var order = $('#tbl-order tbody');
            if(this.buyList.length > 0) {
                var html = [];
                this.buyList.forEach(function(item, idx, ary) {
                    html.push([
                        '<tr data-cd="', item.cd ,'">',                        
                        '<td>', item.title, '</td>',
                        '<td>', item.price, '</td>',
                        '<td>', item.qty, '</td>',
                        '<td>', Number(item.price)*Number(item.qty), '</td>',
                        '</tr>'
                    ].join(''));
                });
                order.html(html);

                // 총 결제금액&수량 table 그리기
                var total = this.getTotalPay();
                $('#total-qty').val(total.totalQty);
                $('#total-amt').val(total.totalPrice);
                $('#tbl-order').show();                

            } else {
                // 주문내역 table 숨기기
                $('#tbl-order').hide();                
     
                // 주문내역 지우기
                order.empty();
     
                // 총 결제정보 지우기
                $('#total-qty').val(0);
                $('#total-amt').val(0);
            }            
        }
    };

    // 수량 클릭 시
    $('.edt-qty').on('change', function() {
        var tr = $(this).closest('tr');
        var code = tr.children('td:eq(1)').text();
        var title = tr.children('td:eq(2)').text();
        var price = Number(tr.children('td:eq(3)').text());
        var qty = Number(tr.children('td:eq(4)').find('input').val());

        // 수량이 0 초과하는 경우 buyList에 추가 
        // 수량이 0 이하인 경우 buyList에서 삭제
        if(qty > 0) {
            var obj = {
                code : code,
                title : title,
                price : price,
                qty : qty
            }
            cart.addBuyList(obj);
        } else {
            cart.deleteBuyList(code);
        }
        console.log(cart.getBuyList());
    });

    // 삭제 버튼 클릭 시
    $('#btn-delete').on('click', function() {

        var chkList = $('input[name="fruit"]:checked');        
        var cd;

        // chcekd 된 product row 삭제
        // order row 삭제
        for(var i = chkList.length-1; i > -1; i--) {
            cd = chkList.eq(i).closest('tr').find('td:eq(1)').text();            
            chkList.eq(i).closest('tr').remove();
            cart.deleteBuyList(cd);
        }     
    });

}); //end document ready

$.fn.serializeObject = function() {
    "use strict";
    
    var result = {};
    var extend = function(i, element) {
        var node = result[element.name];

        if ('undefined' !== typeof node && node !== null) {
            if ($.isArray(node)) {
                node.push(element.value);
            } else {
                result[element.name] = [ node, element.value ];
            }
        } else {
            result[element.name] = element.value;
        }
    };

    $.each(this.serializeArray(), extend);
    return result;
};














//물건 수량 감소
function count_down(cartId){
    if($('#count_' + cartId).text() == "0개") {
        alert("최소 갯수입니다.");
    }else if($('#count_' + cartId).text() == "1개"){
        delete_cart(cartId);
    }else{

        $.ajax({
            type: "post",
            url: `/api/cart/${cartId}/down`,
            contentType: "application/json; charset=utf-8",   //보낼 데이터의 형식
            dataType: "json" //응답받을 데이터의 형식
        }).done(res => {
            //해당 cart찾기
            var index = -1;
            for(var i=0; i<res.data.length;i++){
                if(res.data[i].id == cartId){
                    index = i;
                }
            }

            //수량 갱신
            $('#count_' + cartId).text(res.data[index].product_count+"개");

            //가격 갱신
            $('#total_price_'+cartId).text(res.data[index].total_price+"원");

            //장바구니 총 가격 갱신
            var sum = 0;
            for(var i=0; i<res.data.length; i++){
                sum += parseInt($('#total_price_'+res.data[i].id).text());
            }
            $('#summary').text(sum+"원");


        }).fail(error => {
            alert("수량 감소 실패");
        });
    }
}

//물건 수량 증가
function count_up(cartId){
    $.ajax({
        type: "post",
        url: `/api/cart/${cartId}/up`,
        contentType: "application/json; charset=utf-8",   //보낼 데이터의 형식
        dataType: "json" //응답받을 데이터의 형식
    }).done(res => {
        //해당 cart찾기
        var index = -1;
        for(var i=0; i<res.data.length;i++){
            if(res.data[i].id == cartId){
                index = i;
            }
        }

        //수량 갱신
        $('#count_' + cartId).text(res.data[index].product_count+"개");

        //가격 갱신
        $('#total_price_'+cartId).text(res.data[index].total_price+"원");

        //장바구니 총 가격 갱신
        var sum = 0;
        for(var i=0; i<res.data.length; i++){
            sum += parseInt($('#total_price_'+res.data[i].id).text());
        }
        $('#summary').text(sum+"원");

    }).fail(error => {
        alert("수량 증가 실패");
    });
}