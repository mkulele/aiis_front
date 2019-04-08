<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, intial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/trade.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="js/jquery.min.js"></script>
    <script src="js/flat.min.js"></script>
    <script src="js/sleep_tab.js"></script>

    <title>Set</title>
</head>
<body>


<div id="wrap">
    <!-- 헤더 / 로고, 토글버튼-->
    <header class="header">
        <h1 class="logo">
            <a href="index.html">AutoInSleep</a>
        </h1>
        <nav class="nav">
            <ul class="gnb">
                <li><a href="notice">공지사항</a></li>
                <li><a href="introudce">F&Q</a></li>
                <li><a href="set">설정</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li>
                <li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a>
                    <form id="logout" action='<c:url value='/logout'/>' method="POST">
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                    </form>
                </li>
            </ul>
        </nav>
        <span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
    </header>



    <!--선택된 메뉴-->
    <section class="main_section">
        <section class="select_section">
            <div class="select_title">거래</div>
        </section>

        <form action="tradeProcess" method="POST" onsubmit="return checkForm();" name="trade_form">
            <!--계정선택-->
            <section class="account_section">
                <select name="market" class="market_list">
                    <option value="" selected disabled hidden>거래소 선택</option>
                    <c:forEach var="i" begin="0" end="${size-1}" step="1" varStatus="s">
                        <c:set var="market" value="market${s.index}" />
                        <c:set var="default_color" value="style='background-color: #4B515F'"/>
                        <c:choose>
                            <c:when test="${requestScope[market] eq 'bithumb'}">
                                <option value="${requestScope[market]}" ${default_color}>빗썸</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'coinone'}">
                                <option value="${requestScope[market]}" ${default_color}>코인원</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'binance'}">
                                <option value="${requestScope[market]}" ${default_color}>바이넨스</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'huobi'}">
                                <option value="${requestScope[market]}" ${default_color}>후오비</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'poloniex'}">
                                <option value="${requestScope[market]}" ${default_color}>폴로닉스</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'okex'}">
                                <option value="${requestScope[market]}" ${default_color}>오케이스</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'bitmax'}">
                                <option value="${requestScope[market]}" ${default_color}>비트맥스</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'digifinex'}">
                                <option value="${requestScope[market]}" ${default_color}>디지피닉스</option>
                            </c:when>
                            <c:when test="${requestScope[market] eq 'upbit'}">
                                <option value="${requestScope[market]}" ${default_color}>업비트</option>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </select>
                <input type="text" name="apiKey" id="apikey" placeholder="APIKEY" />
                <input type="password" name="scrKey" id="secretkey" placeholder="SECRETKEY" />
            </section>




        <section class="trade_section">
            <!--왼쪽 슬립리스트-->
            <ul class="sleep_list_section">
                <!--추가버튼-->
                <li class="sleep_list_plus">
                    <i class="fas fa-plus-square"></i>
                    <span>추가</span>
                </li>
                <!--sleep목록-->
                <li class="sleep_list_content" data-tab="tab-1">
                    <span>목록</span>
                </li>
                <li class="sleep_list_content" data-tab="tab-2">
                    <span>목록2</span>
                </li>
                <li class="sleep_list_content" data-tab="tab-3">
                    목록3
                </li>
                <li class="sleep_list_content" data-tab="tab-4">
                    목록4
                </li>
                <li class="sleep_list_content" data-tab="tab-5">
                    목록5
                </li>
            </ul>

            <!--오른쪽 슬립옵션 정하기-->
            <section class="option_list_section" id="tab-1">
                <!--코인정하기-->
                <section class="coin_select_section">
                    <span>코인</span>
                    <select name="symbol" class="symbol">
                        <option value="" selected disabled hidden>거래소 선택시 활성화</option>
                    </select>
                </section>

                <!--매수-->
                <section class="buy_section">
                    <span class="title">매수</span>
                    <input type="checkbox" class="only_check" name="only_buy" value="only_buy" id="only_buy">
                    <span class="only_check_span">매수만</span>
                </section>

                <!--매수 옵션-->
                <section class="buy_option_section">
                        <div class="buy_option_div">
                            <span>가격</span>
                            <input class="buy_option_input" type="text" name="form_buy_price" id="buy_price"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                        <div class="buy_option_div">
                            <span>코인 개수</span>
                            <input class="buy_option_input" type="text" name="form_buy_amount" id="buy_much"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                        <div class="buy_option_div">
                            <span>StopLoss(%)</span>
                            <input class="buy_option_input" type="text" name="form_buy_stoploss" id="buy_stoploss"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                </section>

                <!--매도 옵션-->
                <section class="sell_section">
                    <span class="title">매도</span>
                    <input type="checkbox" class="only_check" name="only_sell" value="only_sell" id="only_sell">
                    <span class="only_check_span">매도만</span>
                </section>

                <!--매도 옵션-->
                <section class="sell_option_section">
                        <div class="sell_option_div">
                            <span>가격</span>
                            <input class="sell_option_input" type="text" name="form_sell_price" id="sell_price"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                        <div class="sell_option_div">
                            <span>코인 개수</span>
                            <input class="sell_option_input" type="text" name="form_sell_amount" id="sell_much"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                        <div class="sell_option_div">
                            <span>TrailingStop(%)</span>
                            <input class="trailing_input" type="text" name="form_sell_trailingstop" id="trailing_stop_1"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                            <input class="trailing_input" type="text" name="form_sell_trailingstop" id="trailing_stop_2"
                                   onkeypress="return isNumberKey(event)"
                                   onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"
                                   onpaste="javascript:return false;">
                        </div>
                </section>

                <div class="choose_section" id="buy_sell_choose_section">
                    <input type="radio" name="first" class="only_check" value="0" checked="checked" >매수 먼저
                    <input type="radio" name="first" class="only_check" value="1" >매도 먼저
                </div>

                <section class="choose_section">
                    <input type="checkbox" class="only_check" name="formreal" value="1">실거래
                    <input type="checkbox" class="only_check" name="formalarm" value="1">알림받기
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                    <button id="sleep_make">SLEEP 생성</button>
                    <button>SLEEP 취소</button>
                </section>

            </section>

         </section>
        </form>
    </section>



    <!-- 메뉴바 -->
    <section class="menubar_section">
        <ul class="menubar_list">
            <li><a href="">
                <i class="fas fa-credit-card"></i>
                <span class="menubar_list_item">매매</span>
            </a></li>
            <li><a href="chart.html">
                <i class="fas fa-chart-line"></i>
                <span class="menubar_list_item">차트</span>
            </a></li>
            <li><a href="">
                <i class="fas fa-money-bill-wave"></i>
                <span class="menubar_list_item">대출</span>
            </a></li>
            <li><a href="">
                <i class="fas fa-wallet"></i>
                <span class="menubar_list_item">지갑</span>
            </a></li>
            <li><a href="dashboard.html">
                <i class="fas fa-columns"></i>
                <span class="menubar_list_item">대시보드</span>
            </a></li>
            <li><a href="">
                <i class="fas fa-moon"></i>
                <span class="menubar_list_item">Sleep 목록</span>
            </a></li>
        </ul>
    </section>
</div>

</body>
<script>
    $(document).ready(function() {
        var option = $('.market_list option:selected').val();
        var query = {market:option};
        $.ajax({
            url: "ajax/getSymbol",
            type: "post",
            data: query,
            dataType: "json",
            success : function(data){
                console.log(data);
                $.each(data, function(i, item) {
                    var symbol = item.coin + item.payment;
                    var view_symbol = item.coin + " / "  + item.payment;
                    $(".symbol:last").append("<option value='" +symbol + "' ${default_color}>" + view_symbol + "</option>");
                });

            },
        });

    });

</script>


<script>
    $(".market_list").on("change",function(){
        $(".symbol option").remove();
        var option = $('.market_list option:selected').val();
        var query = {market:option};
        $.ajax({
            url: "ajax/getSymbol",
            type: "post",
            data: query,
            dataType: "json",
            success : function(data){
                console.log(data);
                $.each(data, function(i, item) {
                    var symbol = item.coin + "/"  + item.payment;
                    var view_symbol = item.coin + " / "  + item.payment;
                    $(".symbol:last").append("<option value='" +symbol + "' ${default_color}>" + view_symbol + "</option>");
                });

            },
        });
    });
</script>

<script>
    //buy
    $('#only_buy').on("change",function(){
        if($('#only_buy').prop('checked')){
            $('#buy_sell_choose_section').hide();
            $('.sell_section').hide();
            $('.sell_option_section').hide();
        }
        else{
            $('#buy_sell_choose_section').show();
            $('.sell_section').show();
            $('.sell_option_section').show();
        }
    });
    //sell
    $('#only_sell').on("change",function(){
        if($('#only_sell').prop('checked')){
            $('#buy_sell_choose_section').hide();
            $('.buy_section').hide();
            $('.buy_option_section').hide();
        }
        else{
            $('#buy_sell_choose_section').show();
            $('.buy_section').show();
            $('.buy_option_section').show();
        }
    });

    function checkForm() {

        if($('#only_buy').prop('checked')) {
            var buy_price = $("#buy_price").val();
            if (buy_price == '') {
                window.alert("가격을 입력하세요.");
                document.trade_form.form_buy_price.focus();
                return false;
            }
            var buy_much = $("#buy_much").val();
            if (buy_much == '') {
                window.alert("개수를 입력하세요.");
                document.trade_form.form_buy_amount.focus();
                return false;
            }
        }

        else if($('#only_sell').prop('checked')) {
            var sell_price = $("#sell_price").val();
            if (sell_price == '') {
                window.alert("가격을 입력하세요.");
                document.trade_form.form_sell_price.focus();
                return false;
            }
            var sell_much = $("#sell_much").val();
            if (sell_much == '') {
                window.alert("개수를 입력하세요.");
                document.trade_form.form_sell_amount.focus();
                return false;
            }
            var stop_1 = $("#trailing_stop_1").val();
            var stop_2 = $("#trailing_stop_2").val();
            if(stop_1!='' || stop_2!=''){
                if(stop_1=='' || stop_2==''){
                    window.alert("trailing stop을 입력하세요.");
                    return false;
                }
            }
        }

        else {
            var buy_price = $("#buy_price").val();
            var buy_much = $("#buy_much").val();
            var sell_price = $("#sell_price").val();
            var sell_much = $("#sell_much").val();

            if (buy_price == '') {
                window.alert("매수 가격을 입력하세요.");
                document.trade_form.form_buy_price.focus();
                return false;
            }
            if (buy_much == '') {
                window.alert("매도 개수를 입력하세요.");
                document.trade_form.form_buy_amount.focus();
                return false;
            }
            if (sell_price == '') {
                window.alert("매도 가격을 입력하세요.");
                document.trade_form.form_sell_price.focus();
                return false;
            }
            if (sell_much == '') {
                window.alert("매도 개수를 입력하세요.");
                document.trade_form.form_sell_amount.focus();
                return false;
            }

            var stop_1 = $("#trailing_stop_1").val();
            var stop_2 = $("#trailing_stop_2").val();
            if(stop_1!='' || stop_2!=''){
                if(stop_1=='' || stop_2==''){
                    window.alert("trailing stop을 입력하세요.");
                    return false;
                }
            }
        }
    }
</script>

<script>
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
     return false;
    // Textbox value
    var _value = event.srcElement.value;
    // 소수점(.)이 두번 이상 나오지 못하게
    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
    if (_pattern0.test(_value)) {
    if (charCode == 46) {
     return false;
    }
}

// 소수점 네번째자리까지만 입력가능
var _pattern2 = /^\d*[.]\d{4}$/;
    if (_pattern2.test(_value)) {
        alert("소수점 네번째자리까지만 입력가능합니다.");
        return false;
    }
    return true;
}
</script>


</html>
