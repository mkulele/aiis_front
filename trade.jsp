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
            <div class="select_title">매매</div>
        </section>

		<form action="tradeProcess" method="POST">
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
            <input type="text" name="scrKey" id="secretkey" placeholder="SECRETKEY" />
        </section>


        <section class="trade_section">

            <!--코인 선택-->
            <section class="coin_select_section">
                <span>코인</span>
                <select name="symbol" class="symbol">
                	<option value="" selected disabled hidden>거래소 선택시 활성화</option>
                </select>
            </section>

            <!--매수-->
            <section class="buy_section">
                <span>매수</span>
                <input type="checkbox" class="only_check" name="only_buy" value="only_buy">매수만
            </section>

            <!--매수 옵션-->
            <section class="buy_option_section">
                <div class="sell_two_group">
                    <div class="sell_option_div">
                        <span>가격</span>
                        <input type="number" name="form_buy_price" id="buy_price">
                    </div>
                    <div class="sell_option_div">
                        <span>코인 개수</span>
                        <input type="number" name="form_buy_amount" id="buy_much">
                    </div>
                </div>
                <div class="sell_two_group">
                    <div class="sell_option_div">
                        <span>StopLoss</span>
                        <input type="number" name="form_buy_stoploss" id="buy_stoploss">
                        <span>%</span>
                    </div>
                    <!-- <div class="sell_option_div">
                        <span>마진</span>
                        <input type="number" name="form_buy_margin" id="buy_margin">
                        <span>%</span>
                    </div> -->
                </div>
                <div class="sell_two_group">
                    <div class="sell_option_div">
                        <span>Trailing Stop</span>
                        <input type="text" name="form_buy_trailingstop" id="buy_trailing">
                        <span>%</span>
                    </div>
                </div>
            </section>


            <!--매도 옵션-->
            <section class="sell_section">
                <span>매도</span>
                <input type="checkbox" class="only_check" name="only_sell" value="only_sell">매도만
            </section>

            <!--매도 옵션-->
            <section class="sell_option_section">
                <div class="sell_two_group">
                    <div class="sell_option_div">
                        <span>가격</span>
                        <input type="number" name="form_sell_price" id="price">
                    </div>
                    <div class="sell_option_div">
                        <span>코인 개수</span>
                        <input type="number" name="form_sell_amount" id="much">
                    </div>
                </div>
                <div class="sell_two_group">
                    <div class="sell_option_div">
                        <span>Trailing Stop</span>
                        <input type="number" name="form_sell_trailingstop" id="trailing stop">
                        <span>%</span>
                    </div>
                    <!-- <div class="sell_option_div">
                        <span>마진</span>
                        <input type="number" name="form_sell_margin" id="margin">
                        <span>%</span>
                    </div> -->
                </div>
            </section>
            <section class="choose_section">
                <input type="radio" name="first" class="only_check" value="0">매수 먼저
                <input type="radio" name="first" class="only_check" value="1">매도 먼저
            </section>

            <section class="choose_section">
                <input type="checkbox" class="only_check" name="formreal" value="1">실거래
                <input type="checkbox" class="only_check" name="formalarm" value="1">알림받기
                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                <button>SLEEP 생성</button>
            </section>

        </section>
	</form>
    </section>



    <!-- 메뉴바 -->
<section class="menubar_section">
        <ul class="menubar_list">
            <li  class="select_menubar"><a href="deal">
                <i class="fas fa-credit-card"></i>
                <span class="menubar_list_item">매매</span>
            </a></li>
            <li><a href="chart">
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
            <li><a href="dashboard">
                <i class="fas fa-columns"></i>
                <span class="menubar_list_item">대시보드</span>
            </a></li>
            <li><a href="sleepList">
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


</html>