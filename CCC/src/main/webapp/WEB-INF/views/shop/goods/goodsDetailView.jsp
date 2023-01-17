<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link rel="stylesheet" href="resources/css/gdetail/gdetail.css">
	
	<link rel="image_src" href="http://webimage.10x10.co.kr/image/basic/505/B005055471.jpg" />

	<link rel="SHORTCUT ICON" href="//fiximage.10x10.co.kr/icons/10x10_140616.ico" />
	<link rel="apple-touch-icon" href="/lib/ico/10x10TouchIcon_150303.png" />
	<link rel="search" type="application/opensearchdescription+xml" href="/lib/util/10x10_brws_search.xml" title="텐바이텐 상품검색" />
	<link rel="alternate" type="application/rss+xml" href="/shoppingtoday/shoppingchance_rss.asp" title="텐바이텐 신상품소식 구독" />
	<link rel="alternate" type="application/rss+xml" href="/just1day/just1day_rss.asp" title="텐바이텐 Just 1Day 구독" />
	<title>텐바이텐 10X10 : 심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반</title>
	<link rel="stylesheet" type="text/css" href="/lib/css/default.css" />
	<link rel="stylesheet" type="text/css" href="/lib/css/preVst/common.css" />
	<link rel="stylesheet" type="text/css" href="/lib/css/preVst/content.css?v=1.15" />
	<link rel="stylesheet" type="text/css" href="/lib/css/preVst/mytenten.css" />
	<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="/lib/css/preVst/ie.css" />
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="/lib/css/commonV18.css?v=1.20" />
	<link rel="stylesheet" type="text/css" href="/lib/css/productV15.css?v=1.10" />
	<link rel="stylesheet" type="text/css" href="/lib/css/contentV15.css?v=1.61" />
	<link rel="stylesheet" type="text/css" href="/lib/css/mytentenV15.css?v=1.00" />
	<!--link rel="stylesheet" href="https://js.appboycdn.com/web-sdk/1.6/appboy.min.css" /-->
	<!--[if lt IE 9]>
		<script src="/lib/js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="/lib/js/amplitude.js?v=1.04"></script>
	<script type="text/javascript" src="/lib/js/jquery-1.7.1.min.js"></script>
	

	<script type="text/javascript" src="/lib/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="/lib/js/jquery.slides.min.js"></script>
	<script type="text/javascript" src="/lib/js/swiper-2.1.min.js"></script>
	<script type="text/javascript" src="/lib/js/slick.min.js"></script>
	<script type="text/javascript" src="/lib/js/common.js?v=1.01"></script>
	<script type="text/javascript" src="/lib/js/tenbytencommon.js?v=1.4"></script>
	<script type="text/javascript" src="/lib/js/keyMovePage.js"></script>	
	<script type="text/javascript" src="/lib/js/buildV63.js"></script>
	<script type="text/javascript" src="https://cdn.branch.io/branch-2.52.2.min.js"></script>
	<script type="text/javascript" src="/lib/js/js.cookie.min.js"></script>
	<script type="text/javascript" src="/lib/js/errorhandler.js?v=4"></script>
	<script src="/shopping/api/pipeline.min.js"></script>
	<!--<script src="/shopping/api/pipeline-origin.js"></script>-->
	
<link rel="canonical" href="http://www.10x10.co.kr/shopping/category_prd.asp?itemid=5055471" />
<link rel="stylesheet" type="text/css" href="/lib/css/temp_w.css?v=1.00" />
<script type="text/javascript" src="/lib/js/jquery.numspinner.min.js"></script>
<script type="text/javascript">

// 확인 후 로그인 페이지로 이동
function jsChkConfirmLogin(msg) {
	if(msg=="") msg = "로그인이 필요합니다.";
	if(confirm(msg + "\n로그인 하시겠습니까?")){
		var winLogin = window.open('/login/PopLoginPage.asp','popLogin','width=400,height=300');
		winLogin.focus();
	}
} 

$(function() {
	//동영상 이미지 추가시(추후개발)
	//$(".photoSlideV15 .slidesjs-pagination > li:last-child").addClass('thumbVod');
	//$(".photoSlideV15 .slidesjs-pagination > li.thumbVod a").append('<em></em>');

	$('.infoMoreViewV15').mouseover(function(){
		$(this).children('.infoViewLyrV15').show();
	});
	$('.infoMoreViewV15').mouseleave(function(){
		$(this).children('.infoViewLyrV15').hide();
	});

	$('.infoMoreViewV15a').mouseover(function(){
		$(this).children('.infoViewLyrV15a').show();
	});
	$('.infoMoreViewV15a').mouseleave(function(){
		$(this).children('.infoViewLyrV15a').hide();
	});

	// recommend item tap view Control
	$(".itemNaviV15 li a").removeClass("on");
	$(".itemContV15").hide();

	if(!$("#rcmdPrd01").has("ul").length) {$(".itemNaviV15 .item01").hide();}
	if(!$("#rcmdPrd02").has("ul").length) {$(".itemNaviV15 .item02").hide();}
	if(!$("#rcmdPrd03").has("ul").length) {$(".itemNaviV15 .item03").hide();}

	if($("#rcmdPrd01").has("ul").length) {
		$(".itemNaviV15 .item01 a").addClass("on");
		$("#rcmdPrd01").show();
	} else if($("#rcmdPrd02").has("ul").length) {
		$(".itemNaviV15 .item02 a").addClass("on");
		$("#rcmdPrd02").show();
	} else if($("#rcmdPrd03").has("ul").length) {
		$(".itemNaviV15 .item03 a").addClass("on");
		$("#rcmdPrd03").show();
	} else {
		$(".recommendItemV15").hide();
	}

	$(".itemNaviV15 li").mouseenter(function() {
		$(this).siblings("li").find("a").removeClass("on");
		$(this).find("a").addClass("on");
		$(this).closest(".itemNaviV15").nextAll(".itemContainerV15:first").find(".itemContV15").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).show();
		return false;
	});

	// 상품후기, 상품문의
	$(".talkList .talkMore").hide();
	$(".talkList .talkShort").click(function(){
		if($(this).parent().parent().next('.talkMore').is(":hidden")){
			$(".talkList .talkMore").hide();
			$(this).parent().parent().next('.talkMore').show();
		} else {
			$(this).parent().parent().next('.talkMore').hide();
		}

		// 클릭 위치가 가려질경우 스크롤 이동
		if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
			$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
		}
	});

	// 상품문의
	$("#inquiryForm").hide();
	$("#inquiryBtn").click(function(){
		$("#inquiryForm").toggle();
	});

	/* for dev msg : PLUSE SALE 개선 작업 (2017.02.06) */
	/* dropdown */
	// common
	var select_root = $(".dropdown");
	var select_value = $(".btnDrop");
	var select_a = $(".dropdown>ul>li>a>div");
	
	// show
	function show_option(){
		$(this).toggleClass("on");
		$(this).parents(".dropdown:first").toggleClass("open");
		$(this).parents(".dropdown").css("z-index", "35");
	}
	
	// hide
	function hide_option(){
		var t = $(this);
		setTimeout(function(){
			t.parents(".dropdown:first").removeClass("open");
		}, 1);
	}
	
	// set anchor
	function set_anchor(){

		var v = $(this).text();
		$(this).parents("ul:first").prev(".btnDrop").text("").append(v);
		$(this).parents("ul:first").prev(".btnDrop").removeClass("on");
	}

	// anchor focus out
	$("*:not('.dropdown a')").focus(function(){
		$(".dropdownList").parent(".dropdown").removeClass("open");
		$(".dropdownList").parent(".dropdown").css("z-index", "0");
	});
	
	select_value.click(show_option);
	select_root.find("ul").css("position","absolute");
	select_root.removeClass("open");
	select_root.mouseleave(function(){$(this).removeClass("open");});
	select_a.click(set_anchor).click(hide_option);
	
	/* plus slae item list check */
	// for dev msg : PlUS SALE관련 상품일 경우에만 해당 스크립트 호출해주세요!
	plusSaleVItemCheck();
	function plusSaleVItemCheck() {
		$(".plusSaleVItem17").each(function(){
			var checkItem = $(this).children(".item").children("ul").children("li").length;
			if (checkItem == 1) {
				$(this).children(".item").addClass("one");
			}
		});
	}

	// 기획전 이미지 마우스오버
	$('.imgOverV15 span').append('<em></em>');
	$('.imgOverV15').mouseover(function(){
		$(this).find('em').show();
	});
	$('.imgOverV15').mouseleave(function(){
		$(this).find('em').hide();
	});

});

//앵커이동
function goToByScroll(id){
	// 해당메뉴 위치로 스크롤 변경 (스크롤 = 해당매뉴 위치 - 탑메뉴 높이)
	$('html,body').animate({scrollTop: $("#detail0"+id).offset().top-$(".pdtTabLinkV15").outerHeight()-20},'slow');
}

// 해외 직구 배송정보 안내 (Overseas Direct Purchase)
function ODPorderinfo(){
	var popwin=window.open('/shopping/popDirectGuide.asp','orderinfo','width=1000,height=640,scrollbars=yes,resizable=no');
	popwin.focus();
}
</script>
<script type="text/javascript" src="/lib/js/category_prd.js?v=1.1"></script>
<script>
    var menuTop=0;

    let cate1_name = "가구/수납";
    let cate2_name = "수납/정리";

    $(function() {
        let view_product_data = {
            itemid : "5055471"
            , keyword : ""
            , ABTest : "control"
            , productkeywords : ["책진열대","책보관","이동식선반","데스크테리어","책상정리","책정리","아이방","방꾸미기","필기구","휴지케이스","소품","펜꽃이","수납함","다용도","매거진랙","책"]
            , category_name_depth1  : cate1_name
            , category_name_depth2  : cate2_name
        };
        fnAmplitudeEventActionJsonData("view_product", JSON.stringify(view_product_data));

        if ($('.item-bnr .figure .image').length > 1) {
            $('.item-bnr .figure').slidesjs({
                width:145,
                height:145,
                navigation:{active:true, effect:"fade"},
                pagination:false,
                play:{interval:2000, active:false, effect:"fade", auto:true},
                effect:{fade:{speed:600, crossfade:true}}
            });
        }

        
                branch.init('key_live_hpOucoij2aQek0GdzW9xFddbvukaW6le');
            
            var branchContentsItemCustomData = {};
            var branchContentsItem = [{
                "$sku":"5055471",
                "$price":44910,
                "$product_name":"%EC%8B%AC%ED%94%8C%EB%A6%AC+%ED%99%94%EC%9D%B4%ED%8A%B8+5%EB%8B%A8+%EC%B1%85%EA%BD%82%EC%9D%B4+%ED%8A%B8%EB%A1%A4%EB%A6%AC+%EB%A7%A4%EA%B1%B0%EC%A7%84%EB%9E%99+%EC%9D%B4%EB%8F%99%EC%8B%9D+%EC%B1%85%EC%84%A0%EB%B0%98",
                "$quantity":1,
                "$currency":"KRW",
                "category":"%EA%B0%80%EA%B5%AC%2F%EC%88%98%EB%82%A9"
            }];
            branch.logEvent(
                "VIEW_ITEM",
                branchContentsItemCustomData,
                branchContentsItem,
                function(err) { console.log(err); }
            );
        

    });

    /*
    *  Start of Function About Amplitude
    * */
    function amplitude_click_shoppingbag_in_product(){
        let view_product_data = {
            itemid : "5055471"
            , category_name_depth1  : cate1_name
            , category_name_depth2  : cate2_name
        };
        fnAmplitudeEventActionJsonData('click_shoppingbag_in_product', JSON.stringify(view_product_data));
    }

    function amplitude_click_wish_in_product(){
        let view_product_data = {
            action : "on"
            , brand_id  : "luxiai"
            , brand_name  : "LUXIAI"
            , category_name_depth1  : cate1_name
            , category_name_depth2  : cate2_name
            , item_id  : "5055471"
            , product_name  : "심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반"
        };

        fnAmplitudeEventActionJsonData('click_wish_in_product', JSON.stringify(view_product_data));
    }
    /*
    * End of Function About Amplitude
    * */
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <style>
	  a {
	  text-decoration-line: none;
	}

    .btn13{ 
      text-decoration: none;
      font-size:1.2rem;
      padding:0px 10px 0px 10px;
      display:inline-block;
      border-radius: 5px;
      transition:all 0.1s;
      font-family: 'Nanum Pen Script', cursive;
      color:white;
    }
    .btn13:active{
      transform: translateY(3px);
    }
    .btn13.red{
      background-color: #ff521e;
      border-bottom:3px solid #c1370e;
    }
    .btn13.red:active{
      border-bottom:2px solid #c1370e;
    }
    
    
    
.bnr-coupon {display:block; margin-top:10px; margin-bottom:-10px; cursor:pointer;}
.bnr-coupon img {width:440px;}
.popup-lyr {display:none;}
.lyr-coupon {display:none; position:relative; width:412px; padding:40px 0; font-family:'Roboto', 'Noto Sans KR'; text-align:center; background-color:#fff; -webkit-border-radius:5px; border-radius:5px;}
.lyr-coupon h2 {font-weight:normal; font-family:inherit; font-size:21px; color:#444;}
.lyr-coupon .btn-close1 {position:absolute; top:0; right:0; width:60px; height:60px; font-size:0; color:transparent; background:url(//fiximage.10x10.co.kr/web2019/common/ico_x.png) no-repeat 50% / 20px;}
.lyr-coupon .cpn {width:189px; height:96px; margin:20px auto 18px; background:url(//fiximage.10x10.co.kr/web2019/common/bg_cpn.png) no-repeat 50% / 100%;}
.lyr-coupon .cpn .amt {padding-top:12px; font-size:24px; color:#fff; line-height:1.3;}
.lyr-coupon .cpn .amt b {margin-right:3px; font-weight:bold; font-size:37px; vertical-align:-2px;}
.lyr-coupon .cpn .txt1 {font-size:11px; color:#919ff2; letter-spacing:-1px;}
.lyr-coupon .cpn .txt1 b {display:inline-block; margin-right:2px; font-size:12px; vertical-align:-0.5px;}
.lyr-coupon .txt2 {font-size:14px; color:#999; line-height:1.6;}
.lyr-coupon .txt2 strong {font-weight:normal; color:#ff3434;}
.lyr-coupon .btn-area {margin-top:20px; font-size:0;}
.lyr-coupon .btn-area button {height:48px; font:inherit; font-size:15px; -webkit-border-radius:5px; border-radius:5px;}
.lyr-coupon .btn-area .btn-close2 {width:113px; background-color:#c2c2c2; color:#444;}
.lyr-coupon .btn-area .btn-down {width:149px; margin-left:9px; background-color:#222; color:#fff;}

.btnArea{
	position:relative;
	left : -250px;
}

#hardlogo{
	position:relative;
	left : -210px;
	top : -5px;
}
#hardfooter{
	position:relative;
	left : 30px;
	top : -40px;
}

#chaThumb img {
  transition: all 0.2s linear;
  overflow: hidden;
}
#chaThumb:hover img {
  transform: scale(1.1);
}
#chaThumb {
  overflow: hidden;
}
#preview{
				z-index: 9999;
				position:absolute;
				border:0px;
				padding:1px;
				display:none;
				color:#fff;
			}

</style>
<script>
function jsEvtCouponDown(stype, idx, cb) {
	
		jsChklogin('False');
		return;
	
}
function handleClicKBanner(link, bannerType, couponidx, lyrId, ampEvt){
	var couponType

	if(ampEvt != '') fnAmplitudeEventMultiPropertiesAction(ampEvt,'','')
	if(bannerType == 1){ // 링크배너
			window.location.href = link
	}else if(bannerType == 2){ // 쿠폰배너
		couponType = couponidx == 1190 ? 'month' : 'evtsel'
		jsEvtCouponDown(couponType, couponidx, function(){
			popupLayer(lyrId)
		})
	}else{ // 레이어팝업배너
		popupLayer(lyrId);
	}
}
function popupLayer(lyrId){
	viewPoupLayer('modal', $("#"+lyrId).html())
}
function handleClickBtn(url){
	window.location.href = url
}
function eventClicKBanner(link, actionEvent, actionEventProperty, actionEventPropertyValue){
	fnAmplitudeEventMultiPropertiesAction(actionEvent, actionEventProperty, actionEventPropertyValue)
	window.location.href = link
}

function branchAddToCartEventLoging() {
	var frm = document.sbagfrm;
	var branchQuantity;
	if (frm.itemea.value===undefined || frm.itemea.value=="") {
		branchQuantity = 1;
	} else {
		branchQuantity = frm.itemea.value;
	}
	
		branch.init('key_live_hpOucoij2aQek0GdzW9xFddbvukaW6le');
	
	var branchAddToCartCustomData = {};
	var branchAddToCartItem = [{
		"$sku":"5055471",
		"$price":44910,
		"$product_name":"%EC%8B%AC%ED%94%8C%EB%A6%AC+%ED%99%94%EC%9D%B4%ED%8A%B8+5%EB%8B%A8+%EC%B1%85%EA%BD%82%EC%9D%B4+%ED%8A%B8%EB%A1%A4%EB%A6%AC+%EB%A7%A4%EA%B1%B0%EC%A7%84%EB%9E%99+%EC%9D%B4%EB%8F%99%EC%8B%9D+%EC%B1%85%EC%84%A0%EB%B0%98",
		"$quantity":parseInt(branchQuantity),
		"$currency":"KRW",
		"category" : "%EA%B0%80%EA%B5%AC%2F%EC%88%98%EB%82%A9"		
	}];
	branch.logEvent(
		"ADD_TO_CART",
		branchAddToCartCustomData,
		branchAddToCartItem,
		function(err) { console.log(err); }
	);
}

function iniRentalPriceCalculation(period) {
	var inirentalPrice = 0;
	var iniRentalTmpValuePrd;
	if (period!="") {
		
			inirentalPrice = getIniRentalMonthPriceCalculation('44910', period);
		
		iniRentalTmpValuePrd = inirentalPrice.split('|');
		if (iniRentalTmpValuePrd[0]=="error") {
			inirentalPrice = 0;
			return;
		} else if (iniRentalTmpValuePrd[0]=="ok") {
			inirentalPrice = iniRentalTmpValuePrd[1]
		} else {
			inirentalPrice = 0;
			return;
		}
		$("#rentalmonth").val(period);
	} else {
		
			inirentalPrice = getIniRentalMonthPriceCalculation('44910', '12');
		
		iniRentalTmpValuePrd = inirentalPrice.split('|');
		if (iniRentalTmpValuePrd[0]=="error") {
			inirentalPrice = 0;
			return;
		} else if (iniRentalTmpValuePrd[0]=="ok") {
			inirentalPrice = iniRentalTmpValuePrd[1]
		} else {
			inirentalPrice = 0;
			return;
		}
		
			$("#rentalmonth").val('12');
		
	}
	inirentalPrice = inirentalPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원";
	$("#rentalMonthPrice").empty().html(" "+inirentalPrice);
}

// 관심 품목 담기 - 상품 페이지 전용 : 상품 코드로 변경
function TnAddFavoritePrd(iitemid){
    
	    location.href = '/login/loginpage.asp?backpath=' + encodeURIComponent(location.pathname + location.search);
	
}

function go_subscribe(){
    location.href="/shopping/category_prd.asp?hAmpt=sub&itemid=1496196";
}

function go_tenten_exclusive(){
    location.href="/search/search_result.asp?rect=텐텐단독";
}

function amplitudeDiaryStory() {
	fnAmplitudeEventAction('view_diarystory_main', 'place', 'product');
}
</script>

	<link href="/lib/js/jquery.magnify/magnify.min.css" rel="stylesheet">
	<script src="/lib/js/jquery.magnify/jquery.magnify.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	$('.bsImage').magnify({
		'timeout': 1,
		'limitBounds': false
	});
	});
	</script>
	<style type="text/css">
	.magnify > .magnify-lens {
	width: 260px;
	height: 260px;
	}

	.pdtSaleInfoV15{
		position: relative;
		left: 70px;
	}

	.pdtAddInfoV15{
		position: relative;
		left: 70px;
	}
	.bsImage{
		position: relative;
		left: -5px;
	}

	

	</style>


</head>
<body>
<!-- 네비바 -->
<jsp:include page="/WEB-INF/views/shop/goods/goodsNavi.jsp"/>

    <div class="wrap">
	
<script type="text/javascript" src="/lib/js/SearchAutoComplete.js"></script>
<script type="text/javascript">
var V_CURRENTYYYYMM = "2023-01-04";
</script>


<script>
$(function() {
	$('.head-util ul li').mouseover(function() {
		$(this).children('.util-layer').show();
	});
	$('.head-util ul li').mouseleave(function() {
		$(this).children('.util-layer').hide();
	});
	//GNB Control
	$('.gnbV18 li').mouseover(function() {
		if (IE7Under) return;
		
		$('.gnbV18 li').removeClass('on');
		$(this).addClass('on');
		$('.gnb-sub-wrap').show().unbind('mouseover').unbind('mouseleave')
			.mouseover(function() {$(this).show();})
			.mouseleave(function() {$(this).hide();});
		$('.gnb-sub').hide();
		var subGnbId = $(this).attr('name');
		
		try{
			var ictVar = eval("vCtHtml"+subGnbId.substring(3,6));
		}catch(e){
			return;
		}

		//추가
		if (ictVar!=""){
		   $(".gnb-sub-wrap").append(ictVar);
		   eval("vCtHtml"+subGnbId.substring(3,6)+"=''");
			// HOT
			jsHotCateShow(subGnbId.substring(3,6));
			
			if (IE8Under){
				$('.dept-unit-top li').unbind('mouseover').unbind('mouseleave')
				.mouseover(function() {
					$(this).addClass('current');
				})
				.mouseleave(function() {
					$(this).removeClass('current');
				});
		   }else{
				$('.dept-unit-top li').unbind('mouseover').unbind('mouseleave')
				.mouseover(function() {
					$(this).addClass('current');
					$('.gnbV18').children('span').show();
					//if ($(this).children('.subGroupWrapV15').length > 0){
					//	$(this).children('.subGroupWrapV15').show();
					//	$('.gnbBnrV15').children('span').show();
					//} else {
					//	$(this).children('.subGroupWrapV15').hide();
					//	$('.gnbBnrV15').children('span').hide();
					//}
				})
				.mouseleave(function() {
					$(this).removeClass('current');
					//$(this).children('.subGroupWrapV15').hide();
					$('.gnbV18').children('span').hide();
				});
		   }
		}
		
		$("div[class|='gnb-sub'][id|='"+ subGnbId +"']").show().unbind('mouseover').unbind('mouseleave')
			.mouseover(function() {
				$(this).show();
				$('.gnbV18 li[name="'+subGnbId+'"]').addClass('on');
			})
			.mouseleave(function() {
				$(this).hide();
				$('.gnbV18 li').removeClass('on');
			});
	});

	$('.gnbV18 li').mouseleave(function() {
		if (IE7Under) return;
		
		$(this).removeClass('on');
		$('.gnb-sub-wrap').hide();
	});
});
</script>
<script type="text/javascript" src="/chtml/dispcate/html/cate_menu_new_all.js?v=20221209141418"></script>
<script type="text/javascript" src="/chtml/dispcate/html/cate_menu_hot.js?v=20230104124501"></script>
<div class="gnbV18">
	
	
	<div class="gnb-sub-wrap">
	</div>
	
</div>
		</div>
	</div>




<script>
$(function() {
	//GNB


	$('.gnbV18 li').mouseover(function() {
		$('.gnbV18 li').removeClass('on');
		$(this).addClass('on');
		$('.gnb-sub-wrap').show()
			.mouseover(function() {$(this).show();})
			.mouseleave(function() {$(this).hide();});
		$('.gnb-sub').hide();
		var subGnbId = $(this).attr('name');
		$("div[class|='gnb-sub'][id|='"+ subGnbId +"']").show()
		.mouseover(function() {
			$(this).show();
			$('.gnbV18 li[name="'+subGnbId+'"]').addClass('on');
		})
		.mouseleave(function() {
			$(this).hide();
			$('.gnbV18 li').removeClass('on');
		});
	});

	$('.gnbV18 li').mouseleave(function() {
		$(this).removeClass('on');
		$('.gnb-sub-wrap').hide();
	});
});
</script>

<script type="text/javascript">
    /*
    * 모비온 스크립트
    * */
    (function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
    enp('create', 'common', 'your10x10', { device: 'W' });  // W:웹, M: 모바일, B: 반응형
    enp('send', 'common', 'your10x10');
</script>
	<div class="container">
		
<style>
    .diary2023_float{width:160px; height:128px; position:fixed; z-index:1001; bottom:40px; right:50%; margin-right:-630px;}
    .diary2023_float .float_img img{width:100px; height:100px; display:none; margin:0 auto;}
    .diary2023_float .float_img img.active{display:block;}
    .diary2023_float .float_close{height:20px; box-sizing:border-box; bottom:0; left:50%; transform:translateX(-50%); position:absolute; background:#fff; border-radius:50px; font-size:11px; line-height:13.2px; font-weight:600; padding:4px 8px; align-items:center;}
    .diary2023_float .float_close.on{height:20px; box-sizing:border-box; bottom:0; left:50%; transform:translateX(-50%); position:absolute; background:#fff; border-radius:50px; display:flex; flex-wrap:nowrap; font-size:11px; line-height:13.2px; font-weight:600; padding:4px 8px; align-items:center;}
    .diary2023_float .float_close img{width:12px; height:12px; margin-left:2px; vertical-align:top;}
    .diary2023_float .float_close01{white-space:nowrap;}
    .diary2023_float .float_close02{white-space:nowrap; position:relative; margin-left:12.5px; display:none;}
    .diary2023_float .float_close02::before{position:absolute; left:-6px; content:''; background:#ccc; width:0.5px; height:12px; top:50%; transform:translateY(-50%);}
    .diary2023_float .float_close02.on{display:block;}
</style>
<div class="diary2023_float">
    <a href="" onclick="fnDiaryStoryBannerLink();return false;">
        <div class="float_img">
            <img src="//webimage.10x10.co.kr/fixevent/event/2022/daccu2023/float_new.png?v=2" alt="" class="float01 active">
            <img src="//webimage.10x10.co.kr/fixevent/event/2022/daccu2023/float02.png?v=1.3" alt="" class="float02">
        </div>
    </a>
    <div class="float_close">
        <a href="" onclick="fnClose1DayDiaryStoryBanner();return false;"><p class="float_close01">닫기<img src="//webimage.10x10.co.kr/fixevent/event/2022/daccu2023/close03.png" alt=""></p></a>
        <a href="" onclick="fnClose15DayDiaryStoryBanner();return false;"><p class="float_close02">15일간 보지않기<img src="//webimage.10x10.co.kr/fixevent/event/2022/daccu2023/close03.png" alt=""></p></a>
    </div>
</div>

<script>
    $(function(){
        // $('.diary2023_float .float_img').mouseenter(function(e){
        //     $(this).find('img').removeClass('active').eq(1).addClass('active');
        // }).mouseleave(function(e){
        //     $(this).find('img').removeClass('active').eq(0).addClass('active');
        // })
        $('.diary2023_float .float_close').mouseenter(function(e){
            $(this).addClass('on');
            $(this).find('.float_close02').addClass('on');
        }).mouseleave(function(e){
            $(this).removeClass('on');
            $(this).find('.float_close02').removeClass('on');
        })
        mainDiaryBanner();
    })
    function fnClose15DayDiaryStoryBanner(){
        setDiaryBannerCookie("diaryStoryFloatingBannerCookie", "done", 15);
        $(".diary2023_float").hide();
        fnAmplitudeEventMultiPropertiesAction('close_diarystory_banner','place','product');
    }
    function fnClose1DayDiaryStoryBanner(){
        setDiaryBannerCookie("diaryStoryFloatingBannerCookie", "done", 1);
        $(".diary2023_float").hide();
        fnAmplitudeEventMultiPropertiesAction('close_diarystory_banner','place','product');
    }
    function fnDiaryStoryBannerLink(){
        fnAmplitudeEventMultiPropertiesAction('click_diarystory_banner','place','product');
        setTimeout(location.href="/diarystory2023/index.asp",1000);
    }
    // 쿠키 가져오기
    function getPopupCookie( name ) {
        var nameOfCookie = name + "=";
        var x = 0;
        while ( x <= document.cookie.length )
        {
            var y = (x+nameOfCookie.length);
            if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                    endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring( y, endOfCookie ) );
            }
            x = document.cookie.indexOf( " ", x ) + 1;
            if ( x == 0 )
                break;
        }
        return "";
    }
    function setDiaryBannerCookie( name, value, expiredays ) {
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    function mainDiaryBanner(){//팝업띄우기		
        var popCookie = getPopupCookie("diaryStoryFloatingBannerCookie");
        if(!popCookie){			
            $(".diary2023_float").show();
        }
    }
</script>

		<style>
			.container{position:relative;}
			.item-bnr .label{height:180px;}
		</style>
		
		<div id="contentWrap" class="categoryPrd">
			

			<p class="tPad10"><a href='https://www.10x10.co.kr/'>HOME</a>&nbsp;&gt;&nbsp;<a href="https://www.10x10.co.kr/shopping/category_list.asp?disp=121">디자인/미술</a>&nbsp;&gt;&nbsp;<a href="https://www.10x10.co.kr/shopping/category_list.asp?disp=121115">문구/완구</a>&nbsp;&gt;&nbsp;<a href="https://www.10x10.co.kr/shopping/category_list.asp?disp=121115105">데코레이션</a>&nbsp;&gt;&nbsp;<a href="https://www.10x10.co.kr/shopping/category_list.asp?disp=121115105107"><strong>${g.goodsCategory}</strong></a></p>

			
			<p id="lyItemEventBanner" class="tPad10" style="display:none;"></p>
			
			<div class="pdtInfoWrapV15">
				<div class="pdtPhotoWrap">
					<div class="pdtPhotoBox">
						<div class="photoSlideV15">
							<p id="chaThumb">
								<img class="bsImage" src="${g.goodsChangeName1}" alt="심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반" />
							</p>
						</div>
					</div>
				</div>
				<div class="pdtDetailWrap">
				
                    <!-- 텐텐 체크카드 배너 -->
                    
					<div class="pdtInfoV15">
						<div class="pdtSaleInfoV15">
						<form name="amplitudeFrm" method="post" action="" style="margin:0px;">
						    <input type="hidden" name="brand_id" value="luxiai">
						    <input type="hidden" name="brand_name" value='LUXIAI'>
						    <input type="hidden" name="category_name" value="">
						    <input type="hidden" name="item_id" value="5055471">
						    <input type="hidden" name="product_name" value="심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반">
						</form>
						<form name="sbagfrm" method="post" action="" style="margin:0px;">
						<input type="hidden" name="mode" value="add">
						<input type="hidden" name="itemid" value="5055471">
						<input type="hidden" name="sitename" value="">
						<input type="hidden" name="itemoption" value="">
						<input type="hidden" name="userid" value="">
						<input type="hidden" name="itemPrice" value="44910">
						<input type="hidden" name="isPhotobook" value="False">
						<input type="hidden" name="isPresentItem" value="False">
						<input type="hidden" name="IsSpcTravelItem" value="False">
						<input type="hidden" name="itemRemain" id="itemRamainLimit" value="100">
						<input type="hidden" name="rentalmonth" id="rentalmonth" value="">
							
							<div class="pdtBasicV15">
								<p class="pdtBrand">
									
									<a href="" id="zzimBrandCnt" onclick="TnMyBrandJJim('luxiai', 'LUXIAI'); return false;">
									<dfn id="zzimBr_luxiai" class="">찜브랜드</dfn></a> <a href="https://www.10x10.co.kr/street/street_brand.asp?makerid=luxiai&ab=012_a_1">
									<!-- 브랜드명 위치 -->
									<span>${g.goodsBrand}</span></a>
									<a href="https://www.10x10.co.kr/street/street_brand.asp?makerid=luxiai&ab=012_a_2" class="btn btnS6 btnGry2 fn lMar10" style="display:none;"><em class="whiteArr03">브랜드샵</em></a>
									
								</p>
								<h2><p class="pdtName">${g.goodsName}</p></h2>
								<!-- <h2><p class="pdtName">심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반</p></h2> -->
								<p class="pdtDesp"></p>
							</div>
							<div class="detailInfoV15">
								
									<dl class="saleInfo">
										<dt>판매가</dt>
										
											<dd><strong class="cBk0V15">
											<fmt:formatNumber value="${g.goodsPrice}" pattern="#,###" />원</strong></dd>
									</dl>
									
									<dl class="saleInfo">
										<dt>할인판매가</dt>
										<dd><strong class="cRd0V15">
											<fmt:formatNumber value="${g.goodsPrice*0.89}" pattern="#,###" />원  [11%]
										</strong></dd>
									</dl>
									
								<dl class="saleInfo">
									<dt>쿠폰적용가</dt>
									<dd>
										
										<strong class="cGr0V15">
											<fmt:formatNumber value="${g.goodsPrice*0.89*0.9}" pattern="#,###" />원  [10%]
										</strong>&nbsp;
										
                                             <a href="" onclick="goLoginPage(); return false;" class="btn btnS2 btnGrn fn btnW75"><span class="download">쿠폰다운</span></a>&nbsp; 
										<!-- '2013년 1월 1일부로 모든 카드 무이자혜택 제거 - 추후 필요하면 설정
										<div class="infoMoreViewV15">
											<span class="more1V15">무이자 할부 안내</span>
											<div class="infoViewLyrV15">
												<div class="infoViewBoxV15">
													<dfn></dfn>
													<div class="infoViewV15">
														<div class="pad15">무이자 할부 안내</div>
													</div>
												</div>
											</div>
										</div>
										//-->
									</dd>
								</dl>
								
							</div>

							<div class="detailInfoV15">
								
									
									
								<dl class="saleInfo">
									<dt>배송구분</dt>
									<dd>
									
										<span>업체무료배송</span>&nbsp;
										
									</dd>
								</dl>
								
							</div>
							
								<div class="detailInfoV15">
									<dl class="saleInfo">
										<dt>주문수량</dt>
										<dd id="lyItemEa" style="margin-top:-2px;">
										
											<input type="text" id="itemea" style="width:30px" class="txtInp ct" />
											<span class="orderNumAtc"></span>
											<script type="text/javascript">
											$("#itemea").numSpinner({min:1,max:100,step:1,value:1});
											</script>
										
										</dd>
									</dl>
								</div>
								
								<div class="detailInfoV15">
									
								</div>
							
							<!-- 플러스 할인 plus sale -->
							

							<!-- 간편선택 바구니 -->
							<div id="lySpBag" style="display:none;">
								<div class="easeCartV15">
									<div class="easeTxtV15">
										<p>다른옵션도 구매하시려면 옵션을 반복하여 선택해 주세요.</p>
									</div>
									<div class="optSelectListWrap">
										<table class="optSelectList">
											<caption>상품 옵션별 선택 리스트</caption>
											<colgroup>
												<col width="*" /><col width="100px" /><col width="75px" /><col width="18px" />
											</colgroup>
											<tbody id="lySpBagList"></tbody>
										</table>
									</div>
									<div class="totalPrice">
										<span>상품 금액 합계</span>
										<strong><span id="spTotalPrc">0원</span></strong>
									</div>
								</div>
								<p class="rt tPad10 cGy1V15">(쿠폰 적용은 주문결제 단계에서 가능합니다.)</p>
							</div>

							<!-- 주문 확인 사항 -->
							
						</form>
						<form name="BagArrFrm" method="post" action="" onsubmit="return false;" >
						<input type="hidden" name="mode" value="arr">
						<input type="hidden" name="bagarr" value="">
						<input type="hidden" name="giftnotice" value="False">
						</form>
						</div>
						<div class="pdtAddInfoV15">
							<div class="pdtTagV15">
								<p><img src="http://fiximage.10x10.co.kr/web2015/shopping/tag_best.png" alt="BEST" /></p>
							</div>
							<div class="interactInfoV15">
								<dl>
									<dt>상품코드</dt>
									<dd>#0000${g.goodsNo}</dd>
								</dl>
								<dl>
									<dt>Review</dt>
									<dd><img id="rtRvImg" src="//fiximage.10x10.co.kr/web2019/common/ico_review_star_00.png" alt="별점" /></dd>
									
									<dd>(<a href="" onClick="goToByScroll('2'); return false;">5</a>)</dd>
									
								</dl>
								
                                    <dl>
                                        <dt>Gift Talk
                                            <div class="infoMoreViewV15a">
                                                <span class="vMid">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="12" height="12" viewBox="0 0 12 12">
                                                        <g fill="none" fill-rule="evenodd">
                                                            <path fill="#555" d="M6.142 7.169c-.063.02-.127.031-.19.031-.251 0-.485-.159-.57-.41-.104-.315.066-.654.38-.76.36-.121 1.39-.61 1.39-1.23 0-.51-.321-.966-.801-1.134-.624-.22-1.31.109-1.531.733-.11.313-.452.477-.766.367-.312-.11-.476-.452-.366-.765.44-1.249 1.813-1.905 3.06-1.468.961.338 1.606 1.25 1.604 2.268 0 1.586-1.984 2.293-2.21 2.368M6.006 9.6c-.332 0-.603-.269-.603-.6 0-.332.265-.6.597-.6h.006c.331 0 .6.268.6.6 0 .331-.269.6-.6.6M6 0C2.686 0 0 2.686 0 6c0 3.313 2.686 6 6 6 3.313 0 6-2.687 6-6 0-3.314-2.687-6-6-6"/>
                                                        </g>
                                                    </svg>
                                                </span>
                                                <div class="infoViewLyrV15a">
                                                    <div class="infoViewBoxV15a">
                                                        <dfn></dfn>
                                                        <div class="infoViewV15a">
                                                            <div class="pad15">텐텐 가족들이 여러분의 선물 고민을 해결해 드립니다!<br />마음을 전하는 선물가이드, 텐바이텐 기프트톡!</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </dt>
                                        <dd>(<a href="" onClick="frmtalk.submit(); return false;">쓰기</a>)</dd>
                                    </dl>
                                
							</div>
						</div>
					</div>
						<br><br>
						<div class="btnArea">
						<span style="width:190px;">
							<c:choose>
								<c:when test="${not empty loginUser}">
									<a href="#" onclick="buyGoodsDirect();" class="btn btnB1 btnRed">바로구매</a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="pleaseLogin();" class="btn btnB1 btnRed">바로구매</a>			
								</c:otherwise>
							</c:choose>
						</span>
						<span class="lPad10 btnCartV15" style="width:190px;">
							<c:choose>
								<c:when test="${not empty loginUser}">
									<a href="#" onclick="addCart();" id="btn_shoppingbag" onclick="appierProductFunction('product_added_to_cart');FnAddShoppingBag(true);fnGaSendCheckValue(true); branchAddToCartEventLoging();return false;" class="btn btnB1 btnWhite">장바구니</a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="pleaseLogin();" id="btn_shoppingbag" onclick="appierProductFunction('product_added_to_cart');FnAddShoppingBag(true);fnGaSendCheckValue(true); branchAddToCartEventLoging();return false;" class="btn btnB1 btnWhite">장바구니</a>			
								</c:otherwise>
							</c:choose>
							<div class="alertLyrV15" style="display:none;">
								<div class="alertBox">
									<em class="closeBtnV15" onclick="$('.alertLyrV15').fadeOut('fast');">&times;</em>
									<div class="alertInner">
										<p><strong class="cBk0V15" id="alertMsgV15">선택하신 상품을<br />장바구니에 담았습니다.</strong></p>
										<p class="tPad10">
											<a href="#" onclick="$('.alertLyrV15').fadeOut('fast'); return false;" class="btn btnS1 btnRed">쇼핑 계속하기</a>
											<a href="https://www.10x10.co.kr/inipay/shoppingbag.asp" class="btn btnS1 btnWhite">장바구니 가기</a>
										</p>
									</div>
								</div>
							</div>
						</span>
						
							<!-- 좋아요 -->
							<span class="lPad10" style="*width:168px;">
								<c:choose>
									<c:when test="${not empty loginUser}">
										<a href="" id="wishBtn" onclick="addWish();" class="btn btnB1 btnWhite3 ">
											<em class="wishActionV15">관심 상품</em>
										</a>
									</c:when>
									<c:otherwise>
										<a href="" id="wishBtn" onclick="pleaseLogin();" class="btn btnB1 btnWhite3 ">
											<em class="wishActionV15">관심 상품</em>
										</a>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						
						
						
				
						
						
						
						
					

					<div class="evtSnsV17a">
						
						<!-- ### 관련 이벤트 event -->
						
						<ul class="pdtSnsV15">
							<li class="twShareV15"><a href="" onclick="shareProduct('tw','','',''); return false;">Twitter</a></li>
							<li class="fbShareV15"><a href="" onclick="shareProduct('fb','','',''); return false;">Facebook</a></li>
							<li class="ptShareV15"><a href="" onclick="shareProduct('pt','','',''); return false;">Pinterest</a></li>
						</ul>
					</div>
				</div>
			</div>

			
				<script type="text/javascript">
					
					var vIId='5055471', vDisp='121115105107';
					
				</script>
				<script type="text/javascript" src="./inc_happyTogether.js"></script>
				<div id="rcmdPrd"></div>
			

			<div class="pdtDetailV15 ">
				<!-- 상품 TAB -->
				<div id="lyrPrdTabLink" class="pdtTabLinkV15">
					<ul>
					
						<li id="tab01" onclick="goToByScroll('1');"><p>상품 설명</p></li>
						
						<li id="tab02" onclick="goToByScroll('2');"><p>상품 후기 <strong class="fs11"></strong></p></li>
						<li id="tab03" onclick="goToByScroll('3');" style="display:none;"><p>테스터 후기 <span class="fn"><strong class="fs11"><span id="lyTesterCnt"></span></strong></span></p></li>
						<li id="tab04" style="display:none;" onclick="goToByScroll('4');"><p>Q&amp;A <span class="fn"><strong class="fs11"><span id="lyQnACnt"></span></strong></span></p></li>
						
						<li id="tab06" onclick="goToByScroll('6');"><p>배송/교환/환불</p></li>
					
						<li id="tab07" onclick="goToByScroll('7');"><p>WISH COLLECTION</p></li>
					
					</ul>
					<!-- 다스배너 -->
					
				</div>

				<!-- 상품 설명 -->
				<div class="section pdtExplanV15" id="detail01">
                    
					<!-- (1/9) 주문 유의 사항&브랜드 공지 --------------------------->
					

					<!-- (2/9) 상품설명 -------------------------------->

<br><br>			
<!-- <h3>상품 설명</h3> -->

	<!-- <iframe id="itemPrdDetail" style="width:100%;" src="/shopping/inc_itemDescription_iframe.asp?itemid=5055471" frameborder="0" scrolling="no"></iframe> -->
	<!-- 여기에 사진 넣기 -->
	<div style="text-align:center;">	
		<img src="${g.goodsChangeName2}" >
		<img src="${g.goodsChangeName3}">
		<img src="${g.goodsChangeName4}">
	</div>
    <script>
        (function(){
            // 브라우저 상태에 따라 iframe 높이값 조정
            var frm = document.getElementById("itemPrdDetail");
            // 초기 로드시
            frm.onload = function() {
                resizeIframe(frm);
            }
            function resizeIframe(obj) {
                obj.style.height = 0;
                obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
            }
        })(jQuery);
    </script>


					<!-- (3/9) 상품 필수정보(고시정보) ----------------->
					<h3 class="tMar50">상품 필수 정보 <span class="fn cGy0V15 lPad05">전자상거래 등에서의 상품정보 제공 고시에 따라 작성 되었습니다.</span></h3>
<div class="pdtInforBox tMar05">
	<div class="pdtInforList">
	
				<span style="display:;"><em>품명 및 모델명</em> : 상세 내용 참조</span>
			
				<span style="display:;"><em>법의 의한 인증, 허가 확인사항</em> : 해당없음</span>
			
				<span style="display:;"><em>제조국 또는 원산지</em> : KH정보교육원</span>
			
				<span style="display:;"><em>제조자</em> : 어문경 강사님</span>
			<span><em>재질</em> : 상세 내용 참조</span><span><em>사이즈</em> : 상세 내용 참조</span>
				<span style="display:;"><em>A/S 책임자/전화번호</em> : 하드캐릭 고객행복센터 1644-0000</span>
			
	</div>
	
</div>


				</div>
				<!-- //상품 설명 -->

				<!-- 플러스 메인 상품일 경우 서브상품 표시, 서브상품일 경우 메인상품 표시-->
				

				<!-- 다스배너 -->
                

					<!-- (4/9) 상품후기 -------------------------------->
					

<script type="text/javascript">

	function fnChgEvalMove(pg) {		
		var sortMt = $("#sortMethod").val();
		var evalDiv = $("#evaldiv").val();
		var evalOpt = $("#evalopt").val();
		var str = $.ajax({
			type: "GET",
			url: "/shopping/act_itemEvaluate.asp",
			data: "itemid=5055471&sortMtd="+sortMt+"&itemoption="+evalOpt+"&page="+pg+"&evaldiv="+evalDiv,
			dataType: "text",
			async: false
		}).responseText;

		if(str!="") {
			$("#lyEvalContAll").empty().append(str);
			
				// 상품후기
				if(evalDiv == 'p'){
					$(".talkList .talkMore").show();
				}else{
					$(".talkList .talkMore").hide();
				}
				$(".talkList .talkShort").unbind("click").click(function(){
					if($(this).parent().parent().next('.talkMore').is(":hidden")){
						$(".talkList .talkMore").hide();
						$(this).parent().parent().next('.talkMore').show();
					}else{
						$(this).parent().parent().next('.talkMore').hide();
					};

					// 클릭 위치가 가려질경우 스크롤 이동
					if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
						$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
					}
				});
			

			//위치 확인
			if($("#detail02").offset().top < $(window).scrollTop()) {
				$('html,body').animate({scrollTop: $("#detail02").offset().top},'fast');
			}
		}
	}

	function chgEvalVal(md) {
		if(md=="p") {
			$("#evaldiv").val("p");
			$("#lyEvalSelBox").hide();
			$("#evalall").removeClass("on");
			$("#evaloff").removeClass("on");
			$("#evalph").addClass("on");
			$("#lyEvalAll").hide();
		}else if(md=="a") {
			$("#evaldiv").val("a");
			$("#lyEvalSelBox").show();
			$("#lyEvalAll").show();
			$("#evalall").addClass("on");
			$("#evalph").removeClass("on");
			$("#evaloff").removeClass("on");
		}else {
			$("#evaldiv").val("o");
			$("#lyEvalSelBox").show();
			$("#lyEvalAll").show();
			$("#evalall").removeClass("on");
			$("#evalph").removeClass("on");
			$("#evaloff").addClass("on");
		}
		fnChgEvalMove(1);
	}

	function popEvalList() {
		popEvaluate('5055471',$("#sortMethod").val());
	}

	/*삭제 가능*/
	/* function chk_myeval(v){
		$.ajax({
			type: "POST",
			url:"/shopping/act_myEval.asp?itemid="+v,
			dataType: "text",
			async: false,
	        success: function (str) {
	        	reStr = str.split("|");
				if(reStr[0]=="01"){
					alert(reStr[1]);
					return false;
				}else if (reStr[0]=="02"){
					if(confirm(reStr[1])){
					    location.href = '/login/loginpage.asp?backpath=' + encodeURIComponent(location.pathname + location.search);
					}
					return false;
				}else if (reStr[0]=="03"){
					alert(reStr[1]);
					return false;
				}else if (reStr[0]=="04"){
					alert(reStr[1]);
					AddEval(reStr[2],reStr[3],reStr[4],reStr[5]);
					return false;
				}else if (reStr[0]=="05"){
					AddEval(reStr[2],reStr[3],reStr[4],reStr[5]);
					return false;
				}else if (reStr[0]=="06"){
					alert(reStr[1]);
					return false;
				}else{
					alert("잘못된 오류입니다.");
					return false;
				}
	        }
		});
	} */
</script>
<div class="section review pdtReviewV15" id="detail02">
	<h3>상품 후기 </h3>
	<div class="sorting tMar05">
		
		<ul class="tabMenuV15">
			<li><a href="" id="evalall" class="on">전체 <!-- ( --><strong><!-- 5 --></strong><!-- ) --></a></li>
			<li><a href="" id="evalph">포토 <!-- ( --><strong><!-- 5 --></strong><!-- ) --></a></li>
            
			    <li><a href="" id="evaloff">매장 (<strong>0</strong>)</a></li>
			
		</ul>
		
		<input type="hidden" id="evaldiv" value="a">
		<input type="hidden" id="sortMethod" value="ne">
		<input type="hidden" id="evalopt" value="">

		<div class="option">
		<input type="hidden" name="itemoption" value="" />

			<span id="lyEvalSelBox">
			<select name="sortMtd" title="상품 후기 정렬 옵션" class="optSelect2" onchange="$('#sortMethod').val(this.value);fnChgEvalMove(1)">
				<option value="ne">최신후기순</option>
				<!-- <option value="be">우수상품후기순</option> -->
			</select>
			</span>
		
			<span id="lyEvalAll"><a href="" onclick="popEvalList(); return false;" class="btn btnS2 btnGry2">상품후기 전체보기</a></span>
			
			<a href="reviewForm.go?gno=${g.goodsNo}" class="btn btnS2 btnRed"><span class="whiteArr03">후기 작성하기</span></a>
		</div>
	</div>
	<span id="lyEvalContAll">
	
		<table class="talkList">
			<caption>상품후기 목록</caption>
			<colgroup>
				<col width="140" /><col width="" /><col width="116" /><col width="120" /><col width="95" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">평점</th>
				<th scope="col">내용</th>
				<th scope="col">작성일자</th>
				<th scope="col">작성자</th>
				<th scope="col">뱃지</th>
			</tr>
			</thead>
			<tbody>
			
			<c:if test="${empty list}">
				<br>
				<div style="text-align:center;"> 작성된 후기가 없습니다. </div>
			</c:if>
			
			<c:forEach var="r" items="${list}">
				<tr>
					<td>
						<!-- <img src="//fiximage.10x10.co.kr/web2019/common/ico_review_star_05.png" alt="별5개" /> -->
						
						<c:choose>
							 <c:when test="${r.grScore eq 5}">
							 	<img src="resources/css/goods/img/star5.jpg" alt="별5개"/>
							 </c:when>
							 <c:when test="${r.grScore eq 4}">
							 	<img src="resources/css/goods/img/star4.jpg" alt="별4개"/>
							 </c:when>
							<c:when test="${r.grScore eq 3}">
							 	<img src="resources/css/goods/img/star3.jpg" alt="별3개"/>
							 </c:when>
							 <c:when test="${r.grScore eq 2}">
							 	<img src="resources/css/goods/img/star2.jpg" alt="별2개"/>
							 </c:when>
							 <c:when test="${r.grScore eq 1}">
							 	<img src="resources/css/goods/img/star1.jpg" alt="별1개"/>
							 </c:when>
						</c:choose>
						
					</td>
					<td class="lt">
						<c:if test="${not empty r.changeName }">
							<a href="" onclick="return false;" class="talkShort"><img src="${r.changeName }" alt="포토" style="width:100px;" class="thumbnailjini"/></a>
						</c:if>
					</td>
					<td class="lt" style="width:400px;">
						${r.grContent }
					</td>
					<td>${r.grCreateDate}</td>
					<td>${r.memberName}</td>
					<td>
						<p class="badgeView tPad01"> <span><img src="http://fiximage.10x10.co.kr/web2015/common/badge/badge15_09.png" title="컬러홀릭" /></span> <span><img src="http://fiximage.10x10.co.kr/web2015/common/badge/badge15_10.png" title="텐텐 트윅스" /></span> <span><img src="http://fiximage.10x10.co.kr/web2015/common/badge/badge15_03.png" title="위시 메이커" /></span></p>
					</td>
				</tr>
			</c:forEach>
			
			
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                 
                var xOffset = 10;
                var yOffset = 30;

                $(document).on("mouseover",".thumbnailjini",function(e){ //마우스 오버시
					
					$("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' /></p>"); //보여줄 이미지를 선언						 
					$("#preview")
						.css("top",(e.pageY - xOffset) + "px")
						.css("left",(e.pageX + yOffset) + "px")
						.fadeIn("fast"); //미리보기 화면 설정 셋팅
				});
				
				$(document).on("mousemove",".thumbnailjini",function(e){ //마우스 이동시
					$("#preview")
						.css("top",(e.pageY - xOffset) + "px")
						.css("left",(e.pageX + yOffset) + "px");
				});
				
				$(document).on("mouseout",".thumbnailjini",function(){ //마우스 아웃시
					$("#preview").remove();
				});
                 
            });
        </script>
        
			
			</tbody>
		</table>
	
	<div class="pageWrapV15 tMar20"><div class="paging">
	<a href="#" title="첫 페이지" class="first arrow" onclick="fnChgEvalMove(1);return false;"><span style="cursor:pointer;">맨 처음 페이지로 이동</span></a>
	<a href="#" title="이전 페이지" class="prev arrow" onclick="return false;"><span style="cursor:pointer;">이전페이지로 이동</span></a>
	<a href="#" title="1 페이지" class="current" onclick="fnChgEvalMove(1);return false;"><span style="cursor:pointer;">1</span></a>
	<a href="#" title="다음 페이지" class="next arrow" onclick="return false;"><span style="cursor:pointer;">다음 페이지로 이동</span></a>
	<a href="#" title="마지막 페이지" class="end arrow" onclick="fnChgEvalMove(1);return false;"><span style="cursor:pointer;">맨 마지막 페이지로 이동</span></a>
</div>
</div>
	
	</span>
</div>
<script type="text/javascript">
//상품 별점 수정
$("#rtRvImg").attr("src","//fiximage.10x10.co.kr/web2019/common/ico_review_star_05.png");
//후기 영역 더블클릭 해제
$("#detail02").dblclick(function(e){
	e.preventDefault(); return false;
});
</script>


					<!-- (5/9) 테스트후기 ------------------------------>
					

					<!-- (6/9) Q&A ------------------------------------->
					
<script type="text/javascript">

	// 탭표시
	$("#lyQnACnt").html("4");
	$("#tab04").show();

	// 페이지이동
	function fnChgQnAMove(pg) {
		var str = $.ajax({
			type: "GET",
			url: "/shopping/act_itemQnA.asp",
			data: "itemid=5055471&page="+pg,
			dataType: "text",
			async: false
		}).responseText;

		if(str!="") {
			$("#lyQnAContAll").html(str);
			$(".talkList .talkMore").hide();
			$(".talkList .talkShort").unbind("click").click(function(){
				if($(this).parent().parent().next('.talkMore').is(":hidden")){
					$(".talkList .talkMore").hide();
					$(this).parent().parent().next('.talkMore').show();
				}else{
					$(this).parent().parent().next('.talkMore').hide();
				};

				// 클릭 위치가 가려질경우 스크롤 이동
				if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
					$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
				}
			});

			//위치 확인
			if($("#detail04").offset().top < $(window).scrollTop()) {
				$('html,body').animate({scrollTop: $("#detail04").offset().top},'fast');
			}
		}
	}

	// 상품문의 메일 체크
	function check_form_email(email){

		var pos;
		pos = email.indexOf('@');
		if (pos < 0){				//@가 포함되어 있지 않음
			return(false);
		} else {
			pos = email.indexOf('@', pos + 1)
			if (pos >= 0){			//@가 두번이상 포함되어 있음
				return(false);
			}
		}

		pos = email.indexOf('.');
		if (pos < 0){				//@가 포함되어 있지 않음
			return false;
		}
		return(true);
	}

	// 상품 문의 등록
	function GotoItemQnA(){
		var frm = document.qnaform;

		if($("#qnaEmail").is(":checked")) {
			if (frm.usermail.value == "") {
				alert("이메일을 입력하세요.");
				frm.usermail.focus();
				 return;
			}

			if(!check_form_email(frm.usermail.value)){
				alert("이메일 형식이 올바르지 않습니다.");
				frm.usermail.focus();
				return;
			}
		}


		if($("#qnaHp").is(":checked")) {
			if ((frm.userhp1.value == "") || (frm.userhp2.value == "") || (frm.userhp3.value == "")) {
				alert("핸드폰번호를 입력하세요.");
				frm.userhp1.focus();
				 return;
			}

			var hp = frm.userhp1.value + "-" + frm.userhp2.value + "-" + frm.userhp3.value;
				if ((validateHP(hp) != true) && (hp != "--")) {
				alert("잘못된 핸드폰번호입니다.");
				frm.userhp1.focus();
				return;
			}
		}

		if(frm.contents.value.length < 1){
			alert("내용을 적어주셔야 합니다.");
			frm.contents.focus();
			return;
		}

		if(confirm("상품에 대해 문의 하시겠습니까?")){
			frm.submit();
		}
	}

	// 상품문의 쓰기 취소
	function cancelItemQnA(inum,itotal) {
		var frm = document.qnaform;
		frm.contents.value = "";
		$("#inquiryForm").hide();
	}

	// 상품 문의 삭제
	function delItemQna(iid){
		if(confirm("상품문의를 삭제 하시겠습니까?")){
			document.qnaform.id.value = iid;
			document.qnaform.mode.value = "del";
			document.qnaform.submit();
		}
	}

	// 상품 문의 수정
	function modiItemQna(iid,itotal){
		if ($("#inquiryForm").css("display")=="none"){
			$.ajax({
				type: "GET",
				url: "act_ItemQnA_XML.asp?idx=" + iid,
				dataType: "xml",
				cache: false,
				async: false,
				timeout: 5000,
				success: function(xml) {
					// 상품문의 쓰기 내용 접수/넣기
					if($(xml).find("list").find("item").length>0) {
						$("#inquiryForm").show();

						// item노드 폼에 대입
						document.qnaform.usermail.value=$(xml).find("list").find("item").find("email").text();
						if($(xml).find("list").find("item").find("emailchk").text()=="Y") {
							$("#qnaEmail")[0].checked = true;
							$("#emailok").val('Y');
						} else {
							$("#qnaEmail")[0].checked = false;
							$("#emailok").val('N');
						}

						document.qnaform.qnaSecret.value=$(xml).find("list").find("item").find("secretchk").text();
						if($(xml).find("list").find("item").find("secretchk").text()=="Y") {
							$("#qnaSecret")[0].checked = true;
							$("#secretyn").val('Y');
						} else {
							$("#qnaSecret")[0].checked = false;
							$("#secretyn").val('N');
						}
						
						var uhp = $(xml).find("list").find("item").find("userhp").text();
						if(uhp!='') {
							uhp = uhp.split("-");
							document.qnaform.userhp1.value=uhp[0];
							document.qnaform.userhp2.value=uhp[1];
							document.qnaform.userhp3.value=uhp[2];
						}

						document.qnaform.contents.value=$(xml).find("list").find("item").find("contents").text();

						// 폼 값변경
						document.qnaform.id.value = iid;
						document.qnaform.mode.value = "modi";
					}
				}
			});
		} else {
			$("#inquiryForm").hide();
		}

	}

	function validateHP(phone) {
		var re = /^[0-9]{2,4}-[0-9]{2,4}-[0-9]{2,4}$/;
		return re.test(phone);
	}

//
</script>
<div class="section qnaV15" id="detail04">
	<div class="sorting">
		<h3>Q&amp;A <span class="fn fs11">(<strong>4</strong>)</span></h3>
		<div class="option">
			<a href="" onclick="return false;" id="inquiryBtn" class="btn btnS2 btnRed">상품 문의하기</a>
		</div>
	</div>
	<div id="inquiryForm" class="boardForm tMar05">
	
		<form name="qnaform" method="post" action="searchGoods.go">
			<input type="hidden" name="id" value="" />			
			<fieldset>
				<legend>상품문의 입력 폼</legend>
					<div class="sorting">
						<h4><strong>상품문의</strong></h4>
						<div class="option">
							<input type="hidden" id="emailok" name="emailok" value="N">
							<input type="hidden" id="secretyn" name="secretyn" value="N">
							<span>
								<input type="checkbox" name="qnaEmail" class="check" id="qnaEmail" onclick="GotoItemQnA();" /> <label for="qnaEmail">이메일 답변 받기</label>
								<input type="text" name="usermail" title="usermail value="" class="txtInp emailInfo"  onclick="jsCheckLimit();"/>
							</span>
							<span class="lPad20"><input type="checkbox" class="check" id="qnaSecret" name="qnaSecret" onclick="jsQNACheck('s');" /> <label for="qnaSecret">비밀글로 문의하기</label></span>
						</div>
					</div>
					<div>
						<textarea name="contents" id="qnaMsg" cols="100" rows="6" placeholder="문의하실 글을 작성해주세요."></textarea>
						<!-- <textarea name="contents" id="qnaMsg" cols="100" rows="6" onclick="jsCheckLimit();" placeholder="문의하실 글을 작성해주세요."></textarea> -->
					</div>
					<ul class="list01V15">
						<li>주문 후 주문/배송/취소 등에 관한 문의는 마이텐바이텐 &gt; <a href="/my10x10/qna/myqnalist.asp">1:1 상담</a>을 이용해주시기 바랍니다. <a href="/my10x10/qna/myqnalist.asp" class="more2V15">주문/배송/취소 문의</a></li>
						<li>고객님이 작성하신 문의 및 답변은 마이텐바이텐 &gt; <a href="/my10x10/myitemqna.asp">상품 Q&amp;A</a> 에서도 확인이 가능합니다.</li>
						<li>텐바이텐 APP을 이용하시면 좀 더 편리하게 답변을 받으실 수 있습니다.</li>
						<li>상품과 관련없는 문의는 강제 삭제 될 수 있습니다.</li>
					</ul>
					<div class="btnArea ct tMar30">
						<a href="goodsQna.go" class="btn btnS1 btnRed btnW100">등록</a>
						<a href="" class="btn btnS1 btnGry btnW100" onclick="$('#inquiryForm').hide();return false;">취소</a>
					</div>
			</fieldset>
		</form>
	</div>

	<span id="lyQnAContAll">
		<table class="talkList">
			<caption>Q&amp;A 목록</caption>
			<colgroup>
				<col width="140" /> <col width="" /> <col width="90" /> <col width="120" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">답변여부</th>
				<th scope="col">답변내용</th>
				<th scope="col">작성일자</th>
				<th scope="col">작성자</th>
			</tr>
			</thead>
			<tbody>
		
			<tr class='secretV17'>
				<td><strong>&lt;답변완료&gt;</strong></td>
				<td class="lt">
					
						비밀글 입니다.
					
				</td>
				<td>2022/12/26</td>
				<td>peperofrie**</td>
			</tr>
			<tr class="talkMore secretV17">
				<td colspan="4">
					<div class="qnaList">
						<div class="question">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문" /></strong>
							<div class="account">
								
									비밀글 입니다.
								
							</div>
						</div>
						
						<div class="answer">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변" /></strong>
							<div class="account">
							
									<p>비밀글 입니다.</p>
								
							</div>
						</div>
						
					</div>
				</td>
			</tr>
			
			<tr class='secretV17'>
				<td><strong>&lt;답변완료&gt;</strong></td>
				<td class="lt">
					
						비밀글 입니다.
					
				</td>
				<td>2022/12/26</td>
				<td>amy63**</td>
			</tr>
			<tr class="talkMore secretV17">
				<td colspan="4">
					<div class="qnaList">
						<div class="question">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문" /></strong>
							<div class="account">
								
									비밀글 입니다.
								
							</div>
						</div>
						
						<div class="answer">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변" /></strong>
							<div class="account">
							
									<p>비밀글 입니다.</p>
								
							</div>
						</div>
						
					</div>
				</td>
			</tr>
			
			<tr class='secretV17'>
				<td><strong>&lt;답변완료&gt;</strong></td>
				<td class="lt">
					
						비밀글 입니다.
					
				</td>
				<td>2022/12/22</td>
				<td>fjdrb4**</td>
			</tr>
			<tr class="talkMore secretV17">
				<td colspan="4">
					<div class="qnaList">
						<div class="question">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문" /></strong>
							<div class="account">
								
									비밀글 입니다.
								
							</div>
						</div>
						
						<div class="answer">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변" /></strong>
							<div class="account">
							
									<p>비밀글 입니다.</p>
								
							</div>
						</div>
						
					</div>
				</td>
			</tr>
			
			<tr class='secretV17'>
				<td><strong>&lt;답변완료&gt;</strong></td>
				<td class="lt">
					
						비밀글 입니다.
					
				</td>
				<td>2022/12/19</td>
				<td>peperofrie**</td>
			</tr>
			<tr class="talkMore secretV17">
				<td colspan="4">
					<div class="qnaList">
						<div class="question">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문" /></strong>
							<div class="account">
								
									비밀글 입니다.
								
							</div>
						</div>
						
						<div class="answer">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변" /></strong>
							<div class="account">
							
									<p>비밀글 입니다.</p>
								
							</div>
						</div>
						
					</div>
				</td>
			</tr>
			
			</tbody>
		</table>
		
		<div class="pageWrapV15 tMar20"><div class="paging">
	<a href="#" title="첫 페이지" class="first arrow" onclick="fnChgQnAMove(1);return false;"><span style="cursor:pointer;">맨 처음 페이지로 이동</span></a>
	<a href="#" title="이전 페이지" class="prev arrow" onclick="return false;"><span style="cursor:pointer;">이전페이지로 이동</span></a>
	<a href="#" title="1 페이지" class="current" onclick="fnChgQnAMove(1);return false;"><span style="cursor:pointer;">1</span></a>
	<a href="#" title="다음 페이지" class="next arrow" onclick="return false;"><span style="cursor:pointer;">다음 페이지로 이동</span></a>
	<a href="#" title="마지막 페이지" class="end arrow" onclick="fnChgQnAMove(1);return false;"><span style="cursor:pointer;">맨 마지막 페이지로 이동</span></a>
</div>
</div>
		
	</span>
</div>

					<!-- (8/9) 배송/교환/환불 -------------------------->
					
<div class="section conditionV15" id="detail06">
	<div class="sorting">
		<h3>배송/교환/환불</h3>
		<div class="option">
		
			<a href="https://www.10x10.co.kr/my10x10/order/order_return_detail.asp" class="btn btnS2 btnRed"><span class="whiteArr03 fn">반품/환불 신청하기</span></a>
		
		</div>
	</div>
	<table>
	
		<caption>배송정보 및 교환/환불 AS안내</caption>
		<colgroup>
			<col width="145" /> <col width="*" />
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">배송정보</th>
			<td>
				<ul class="list01V15">
					<li>배송기간은 주문일(무통장입금은 결제완료일)로부터 1일(24시간) ~ 5일정도 걸립니다.</li>
					<li>단, 지정일 배송이 가능한 플라워 상품이나, 제작기간이 별도로 소요되는 상품의 경우에는 상품설명에 있는 제작기간과 배송시기를 숙지해 주시기 바랍니다.</li>
					<li>업체조건배송 상품은 해당 브랜드 배송기준으로 배송비가 부여됩니다. 업체착불배송 상품은 해당 브랜드 배송기준 및 배송지에 따라 배송비가 착불로 부과됩니다.</li>
					<li>가구 및 플라워 등의 상품의 경우에는 지역에 따라 추가 배송비용이 발생할 수 있음을 알려드립니다.</li>
					<li>해외배송 표시가 되어 있는 상품은 해외 주소로 배송이 가능합니다. (배송방법 : EMS)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th scope="row">교환/환불/AS안내</th>
			<td>
				<ul class="list01V15">
					<li>교환/반품 신청은 배송완료 후 7일 이내 가능합니다.</li>
					<li>변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
					<li>상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
					<li>출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
					<li>쥬얼리를 포함한 주문제작 상품/카메라/밀봉포장상품/플라워 등은 변심으로 인한 반품/환불이 불가합니다.</li>
					<li>완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
					<li>상품페이지에 교환/환불/AS에 대한 브랜드 개별기준이 있는 경우에는  해당 내용이 우선 적용 됩니다.</li>
					
				</ul>
			</td>
		</tr>
		<tr>
			<th scope="row">기타 기준 사항</th>
			<td>
				<ul class="list01V15">
					<li>구매자가 미성년자인 경우에는 상품 구입시 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인이 구매취소 할 수 있습니다.</li>
				</ul>
			</td>
		</tr>
		</tbody>
	
	</table>
</div>

					<!-- (8/9) wish 컬렉션 -------------------------->
					
						<script type="text/javascript">
							$.ajax({
								url: "act_categoryBestItem.asp?itemid=5055471&catecode=121115105107",
								async: true,
								success: function(vRst) {
									if(vRst!="") {
										$("#lyrCateBest").empty().html(vRst);
										$("#tab07").empty().html('<p>CATEGORY BEST</p>');
									}
									else
									{
										$('#lyrCateBest').hide();
										$("#tab07").hide();
									}
								}
								,error: function(err) {
									//alert(err.responseText);
									$('#lyrCateBest').hide();
									$("#tab07").hide();
								}
							});
						</script>
						<div id="lyrCateBest"></div>
					<!--div id="detail07"><div id="lyrWishCol"></div></div-->
					<script type="text/javascript">
						/*
						$.ajax({
							type: "get",
							url: "act_wishCollection.asp?itemid=5055471",
							success: function(message) {
								if(message) {
									$("#lyrWishCol").empty().html(message);
								} else {
									$("#tab07").hide();
								}
							}
						});
						*/
					</script>
				
			</div>
		</div>
	</div>

	<form name="frmtalk" method="post" action="https://www.10x10.co.kr/gift/talk/write.asp">
	<input type="hidden" name="isitemdetail" value="o">
	<input type="hidden" name="ritemid" value="5055471">
	<script>
	$(function() {
		// 탑메뉴위치값 저장
		if ($("#lyrPrdTabLink").length){
			menuTop = $("#lyrPrdTabLink").offset().top;
		}
		$("#tab01").addClass("current");

		$(window).scroll(function(){
			//메뉴표시 (스크롤 위치가 해당메뉴 위치값을 지나면 탑메뉴 선택표시)
			$('.pdtTabLinkV15 ul li').removeClass('current');
            
			$('.pdtTabLinkV15 ul li').each(function(){
				if ($(this).css("display") != "none"){
					var idnumber = $(this).attr("id");
					idnumber = idnumber.substring(3,5);

					if($("#detail"+idnumber).length < 7) {
						// 아래 셀렉터로 엘리먼트를 찾지 못한경우를 보호
						if ($("#detail"+idnumber).offset() != null) {
							if($(window).scrollTop()>=$("#detail"+idnumber).offset().top-$(".pdtTabLinkV15").outerHeight()-25) {
								$('.pdtTabLinkV15 ul li').removeClass('current');
								$("#tab"+idnumber).addClass("current");
							}
						}
					}else{
						if( $(window).scrollTop()>=$("#detail07").offset().top-$(".pdtTabLinkV15").outerHeight()-160 || $(window).scrollTop()>=($(document).height()-$(window).height())) {
							$('.pdtTabLinkV15 ul li').removeClass('current');
							if($("#tab07").css("display")!="none") {
								$("#tab07").addClass("current");
							} else {
								$("#tab06").addClass("current");
							}
						}
					}
				}
			})

			//탑메뉴 플로팅
			if( $(window).scrollTop()>=menuTop ) {
				//스크롤 위치가 탑메뉴의 위치 보다 크면 플로팅
				$(".pdtTabLinkV15").css("position","fixed");
                $('.bnr-diary').css('display','none' );
			} else {
				//스크롤 위치가 탑메뉴의 위치 보다 작으면 원래위치
				$(".pdtTabLinkV15").css("position","absolute");
				$("#tab01").addClass("current");
                $('.bnr-diary').css('display','block');
			}
		});

		if($('.photoSlideV15 p').length>1) {
			$('.photoSlideV15').slidesjs({
				width:500,
				height:500,
				start:1,
				navigation:{active:true, effect:"fade"},
				pagination:{active:true, effect:"fade"},
				effect:{
					fade:{speed:200, crossfade:true}
				}
			});
			$('.photoSlideV15 .slidesjs-container').mouseover(function(){
				$('.photoSlideV15 .slidesjs-navigation').fadeIn();
			});
			$('.photoSlideV15').mouseleave(function(){
				$('.photoSlideV15 .slidesjs-navigation').fadeOut();
			});
			$('.photoSlideV15 .slidesjs-pagination > li a').append('<span></span>');
			//photo thumbnail pagination control
			$('.photoSlideV15 p img').each(function(i){
				$('.photoSlideV15 .slidesjs-pagination > li').eq(i).children("a").css('background-image', 'url('+$(this).attr("thumb")+')');
			});
			//mouse page control
			$('.photoSlideV15 .slidesjs-pagination > li a').mouseenter(function(){
				$('a[data-slidesjs-item="' + $(this).attr("data-slidesjs-item") + '"]').trigger('click');
			});
		} else {
			$('.photoSlideV15 p img').css({"width":500,"height":500});
			/* $('.photoSlideV15').append('<ul class="slidesjs-pagination"><li><a href="" class="active" onclick="return false;"><span></span></a></li></ul>'); */
			$('.photoSlideV15 .slidesjs-pagination > li').css('background-image', 'url('+$('.photoSlideV15 p img').attr("thumb")+')');
		}
	});

	// 품절입고알림 팝업
	function popStock() {
		
			goLoginPage();
		
		return false;
	}
	</script>
	</form>
	<hr />
<div class="footer-wrap">
	<div class="foot-nav">
		<ul>
			<li><a href="http://company.10x10.co.kr/" target="_blank">회사소개</a></li>
			<li><a href="http://company.10x10.co.kr/Recruit/List/" target="_blank"><span class="icoV18 ico-new2">채용정보</span></a></li>
			<li><a href="https://www.10x10.co.kr/common/join.asp"><strong>이용약관</strong></a></li>
			<li><a href="https://www.10x10.co.kr/common/private.asp"><strong>개인정보 처리방침</strong></a></li>
			<li><a href="https://www.10x10.co.kr/common/youth.asp"><strong>청소년 보호정책</strong></a></li>
			<li><a href="" onclick="fnPopAlliance('a'); return false;">제휴/광고</a></li>
			<li><a href="" onclick="fnPopAlliance('s'); return false;">입점문의</a></li>
			<li><a href="https://www.10x10.co.kr/offshop/index.asp" target="_blank">매장안내</a></li>
			<!-- 다스배너 -->
<!--			<li class="diary notice"><a href="https://www.10x10.co.kr/diarystory2021/index.asp"><span>NOTICE</span>2021 다이어리 스토리</a></li>-->
		</ul>
	</div>
	<div class="footerV18">
		<!-- <span class="logo">HARD-CHARAC</span> -->
		<!-- <span class="logo">HARD-CHARAC</span> -->
		<div id="hardlogo">
			<img src="resources/css/gdetail/chalogo3.jpg">	
		</div>
		<div id="hardfooter">
			<div class="foot-cont company">
				<em>㈜하드캐릭</em>
				<p>대표이사 :&nbsp&nbsp&nbsp&nbsp오상희&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp원종우&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp이재영&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp추지은&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp김병철&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp조진희 </p>
				<p>서울특별시 영등포구 선유동2로 57 이레빌딩</p>
				<p>사업자등록번호 : 123-45-678910 / 통신판매업 신고 : 제 01-1968호 <a href="" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2118700620', 'bizCommPop', 'width=750, height=700;');return false;" class="btn-linkV18 link2 lMar05">사업자 정보확인 <span></span></a></p>
				<p>개인정보보호책임자 : 조진희 / 소비자피해보상보험 SGI 서울보증 <a href="javascript:usafe(2118700620);" class="btn-linkV18 link2 lMar05">서비스 가입 사실 확인 <span></span></a></p>
				<p class="tPad15">호스팅서비스:㈜하드캐릭</p>
				<p class="copyright">COPYRIGHT &copy; HARD-CHARAC ALL RIGHTS RESERVED.</p>
			</div>
		</div>
		<div class="foot-cont cs">
			
				<div class="foot-cscenter">
                    <a href="/cscenter/">
                        <p class="tit">고객센터 바로가기</p>
                        <div class="open-time"><span>운영시간</span> <span class="time">오전 10시 ~ 오후 5시 (주말, 공휴일 휴무)</span></div>
                        <div class="open-time"><span>점심시간</span> <span class="time">오후 12시 30분 ~ 오후 1시 30분</span></div>
                    </a>
                </div>
			

		</div>
        <div class="foot-sns">
            <a href="https://instagram.com/your10x10/"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_instagram.png" alt="insta"></a>
            <a href="https://www.facebook.com/your10x10"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_facebook.png" alt="facebook"></a>
            <a href="https://www.youtube.com/user/10x10x2010/"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_you.png" alt="yotube"></a>
        </div>
		<p class="goTopV18"><span class="icoV18"></span>TOP</p>
	</div>
</div>

	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">
		try {  kakaoPixel('6348634682977072419').pageView(); kakaoPixel('6348634682977072419').viewContent({id:'5055471'}); } catch (error) {  console.log(error.name)  } 
	</script>

	
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-16971867-1', 'auto');
		ga('require','displayfeatures');
		ga('require', 'linkid', 'linkid.js');
		ga('set','dimension1','5055471');


		ga('send', 'pageview');
	</script>

	
	<!-- Global site tag (gtag.js) - AdWords: 1013881501 -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=AW-851282978"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'AW-851282978');
	</script>
	 <script> 	gtag('event', 'page_view', { 	 'send_to': 'AW-851282978', 	 'ecomm_pagetype': 'product', 	 'ecomm_prodid': '5055471', 	 'ecomm_totalvalue': 44910 	});  </script> 
	<script type="module">
	// Import the functions you need from the SDKs you need
	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.10.0/firebase-app.js";
	import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.10.0/firebase-analytics.js";
	// TODO: Add SDKs for Firebase products that you want to use
	// https://firebase.google.com/docs/web/setup#available-libraries

	// Your web app's Firebase configuration
	// For Firebase JS SDK v7.20.0 and later, measurementId is optional
	const firebaseConfig = {
		apiKey: "AIzaSyCWqZqP-w_OixKc8XJNKfL-Io3WISK_vuQ",
		authDomain: "tenbyten-1010.firebaseapp.com",
		projectId: "tenbyten-1010",
		storageBucket: "tenbyten-1010.appspot.com",
		messagingSenderId: "909756477465",
		appId: "1:909756477465:web:80f833860c847238b6ba88",
		measurementId: "G-4SK926ZKSP"
	};

	// Initialize Firebase
	const app = initializeApp(firebaseConfig);
	const analytics = getAnalytics(app);
	</script>

	<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,document,'script','//connect.facebook.net/en_US/fbevents.js');
fbq('init', '260149955247995');
fbq('init', '889484974415237');
if (Array.from){fbq('track','PageView');
fbq('track', 'ViewContent',{content_ids:['5055471'],content_type:'product'});}</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=260149955247995&ev=PageView&noscript=1" /></noscript>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=889484974415237&ev=PageView&noscript=1" /></noscript>
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		
	<script type="text/javascript">
		try {
			if (!wcs_add) var wcs_add={};
			wcs_add["wa"] = "s_1167df6db7ef";
			if (!_nasa) var _nasa={};
			wcs.inflow("10x10.co.kr");
			wcs_do(_nasa);
		} catch (error) {
			console.log(error.name);
		}
	</script>
	
	<script type="text/javascript">
		
	</script>


<script type="text/javascript">
	$(function(){
		//'탑으로 가기
		$('.footer .right2').click(function(){
			$('html, body').animate({scrollTop:0}, 'slow');
		});
	});
	//제휴(a), 입점(s) 문의 팝업
	function fnPopAlliance(gb){
		if(gb=='a'){
			var Alliance = window.open('http://company.10x10.co.kr/Views/pop/PopAlliance.asp','PopAlliance','width=920,height=820,scrollbars=yes');
		}else if(gb=='s'){
			var Alliance = window.open('http://company.10x10.co.kr/Views/pop/PopAlliance2.asp','PopAlliance','width=920,height=820,scrollbars=yes');
		}else{
			alert('잘못된 접속 입니다.');
			parent.location.reload();
			return;
		}
		Alliance.focus();
		return;
	}
</script>

<script type="text/javascript">
var NeoclickConversionDctSv="type=1,orderID=,amount=";
var NeoclickConversionAccountID="22505";
var NeoclickConversionInnAccountNum="895";
var NeoclickConversionInnAccountCode="6124a52c47e704b805000009";
</script>
<script type="text/javascript" src="//ck.ncclick.co.kr/NCDC_V2.js"></script>

</div>

    
    <script type="text/javascript">
        /*
        window._rblq = window._rblq || [];
        _rblq.push(['setVar','cuid','0f8265c6-6457-4b4a-b557-905d58f9f216']);
        _rblq.push(['setVar','device','PW']);
        _rblq.push(['setVar','itemId','5055471']);
    //	_rblq.push(['setVar','userId','{$userId}']); // optional
        _rblq.push(['setVar','searchTerm','']);
        _rblq.push(['track','view']);
        (function(s,x){s=document.createElement('script');s.type='text/javascript';
        s.async=true;s.defer=true;s.src=(('https:'==document.location.protocol)?'https':'http')+
        '://assets.recobell.io/rblc/js/rblc-apne1.min.js';
        x=document.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);})();
        */
    </script>

    <script>
    // 구글 애널리틱스 관련
    function fnGaSendCheckValue(bool)
    {
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-16971867-10', 'auto');

        // 구글 애널리틱스 값
        if (bool==true){
            ga('send', 'event', 'UX', 'click', 'add');
        }
        else
        {
            ga('send', 'event', 'UX', 'click', 'DO1');
        }
    }

	function goLoginPage() {
        location.href = '/login/loginpage.asp?backpath=' + encodeURIComponent(location.pathname + location.search);
    }

    // 상품 공유
    
    function shareProduct(gubun, pre, tag, img) {
        let share_method;
        switch(gubun) {
            case 'tw' : share_method = 'twitter'; break;
            case 'fb' : share_method = 'facebook'; break;
            case 'pt' : share_method = 'pinterest'; break;
        }

        popSNSPost(gubun, '%EC%8B%AC%ED%94%8C%EB%A6%AC+%ED%99%94%EC%9D%B4%ED%8A%B8+5%EB%8B%A8+%EC%B1%85%EA%BD%82%EC%9D%B4+%ED%8A%B8%EB%A1%A4%EB%A6%AC+%EB%A7%A4%EA%B1%B0%EC%A7%84%EB%9E%99+%EC%9D%B4%EB%8F%99%EC%8B%9D+%EC%B1%85%EC%84%A0%EB%B0%98', 'http%3A%2F%2F10x10%2Eco%2Ekr%2F5055471', pre, tag, img);
    }
    </script>

    
    <script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
    <script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: 8262},
        { event: "setEmail", email: "" },
        { event: "setSiteType", type: deviceType},
        { event: "viewItem", item: "5055471" }
    );
    </script>
    

    <script type="text/javascript">
        let Advertisement_image_url = "http://thumbnail.10x10.co.kr/webimage/image/basic/505/B005055471.jpg?cmd=thumb&w=400&h=400&fit=true&ws=false";
        /*
        * 모비온 광고 스크립트
        * */
        var ENP_VAR = {
            collect: {},
            conversion: { product: [] }
        };
        ENP_VAR.collect.productCode = '5055471';
        ENP_VAR.collect.productName = '%EC%8B%AC%ED%94%8C%EB%A6%AC+%ED%99%94%EC%9D%B4%ED%8A%B8+5%EB%8B%A8+%EC%B1%85%EA%BD%82%EC%9D%B4+%ED%8A%B8%EB%A1%A4%EB%A6%AC+%EB%A7%A4%EA%B1%B0%EC%A7%84%EB%9E%99+%EC%9D%B4%EB%8F%99%EC%8B%9D+%EC%B1%85%EC%84%A0%EB%B0%98';
        ENP_VAR.collect.price = '50500';
        ENP_VAR.collect.dcPrice = '44910';
        ENP_VAR.collect.soldOut = 'N';
        ENP_VAR.collect.imageUrl = Advertisement_image_url;
        ENP_VAR.collect.topCategory = '가구/수납';

        (function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
        /* 상품수집 */
        enp('create', 'collect', 'your10x10', { device: 'W' });
        /* 장바구니 버튼 타겟팅 (이용하지 않는 경우 삭제) */
        enp('create', 'cart', 'your10x10', { device: 'W', btnSelector: '#btn_shoppingbag' });
        /* 찜 버튼 타겟팅 (이용하지 않는 경우 삭제) */
        enp('create', 'wish', 'your10x10', { device: 'W', btnSelector: '#wsIco5055471' });

        /*
        * 애피어 스크립트
        * */
        !function(q,g,r,a,p,h,js) {
            if(q.qg)return;
            js = q.qg = function() {
                js.callmethod ? js.callmethod.call(js, arguments) : js.queue.push(arguments);
            };
            js.queue = [];
            p=g.createElement(r);p.async=!0;p.src=a;h=g.getElementsByTagName(r)[0];
            h.parentNode.insertBefore(p,h);
        } (window,document,'script','https://cdn.qgr.ph/qgraph.df0854decfeb333174cb.js');

        appierProductFunction("product_viewed");

        function appierProductFunction(caller_name, product_type){
            if(typeof qg !== "undefined"){
                let appier_product_data = {
                    "category_name_depth1" : cate1_name
                    , "category_name_depth2" : cate2_name
                    , "brand_id" : "luxiai"
                    , "brand_name" : "LUXIAI"
                    , "product_id" : "5055471"
                    , "product_name" : "심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반"
                    , "product_image_url" : Advertisement_image_url
                    , "product_url" : "https://m.10x10.co.kr/category/category_itemPrd.asp?itemid=5055471"
                    , "product_price" : parseInt("50500")
                };

                switch (caller_name){
                    case "product_viewed" : case "product_added_to_wishlist" :
                        appier_product_data.keyword = "책진열대,책보관,이동식선반,데스크테리어,책상정리,책정리,아이방,방꾸미기,필기구,휴지케이스,소품,펜꽃이,수납함,다용도,매거진랙,책";
                        qg("event", caller_name, appier_product_data);
                        break;
                    case "product_added_to_cart" : case "click_directorder_in_product" :
                        
                            appier_product_data.quantity =  document.sbagfrm.itemea.value;
                            appier_product_data.product_select = null;
                            appier_product_data.product_variant = null;
                            if(caller_name == "click_directorder_in_product"){
                                appier_product_data.type = product_type;
                            }
                            qg("event", caller_name, appier_product_data);
                        
                        break;
                }
            }
        }
    </script>

    <script type="application/ld+json">
    {
        "@context": "http://schema.org/",
        "@type": "Product",
        "name": "심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반",
        
        "image": "http://thumbnail.10x10.co.kr/webimage/image/basic600/505/B005055471.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false",
        
        "mpn": "5055471",
        "brand": {
            "@type": "Brand",
            "name": "LUXIAI"
        },
        "description": "심플리 화이트 5단 책꽂이 트롤리 매거진랙 이동식 책선반. 판매가: 50,500 원. 할인판매가: 44,910 원 [11%]. 배송구분: 업체무료배송",
        "offers": {
            "@type": "Offer",
            "url": "https://www.10x10.co.kr/shopping/category_prd.asp?itemid=5055471",
            "priceCurrency": "KRW",
            "availability": "https://schema.org/InStock",
            "priceValidUntil": "2024-01-04",
            "price": "50500"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "5",
            "reviewCount": "5"
        }
    }
    </script>
    <script>
    	function buyGoodsDirect(){
    		var quantity = $("#itemea").val();
    		var gno = ${g.goodsNo};
//     		console.log(ono,quantity);
    		location.href="buyGoodsDirect.go?gno="+gno+"&qtt="+quantity;
    	}
    	
    	function addCart(){
    		var quantity = $("#itemea").val();
    		var gno = ${g.goodsNo};
    		$.ajax({
				url : "addCartByGno.ca",
				data : {
					gno : gno,
					qtt : quantity
				},
				success : function(result){
					console.log("결과는 : " + result);
					if(result > 0){
						window.alert("장바구니에 추가되었습니다!");
						var temp = window.confirm("장바구니로 이동할까요?");
						if(temp){
							location.href="cart.ca";
						}
					}
					else{
						window.alert("장바구니에 이미 있습니다!");
						var temp = window.confirm("장바구니로 이동할까요?");
						if(temp){
							location.href="cart.ca";
						}
					}
				},
				error : function(){
					console.alert("checkWish 실패");
				}
			});
    	};
    	
    	function addWish(){
    		var gno = ${g.goodsNo};
    		$.ajax({
				url : "addWishByGno.ca",
				data : {
					gno : gno
				},
				success : function(result){
					console.log("결과는 : " + result);
					if(result > 0){
						window.alert("관심상품 추가!");
						var temp = window.confirm("관심상품 페이지로 이동할까요?");
						if(temp){
							location.href="wishList.my";
						}
					}
					else{
						window.alert("관심상품 삭제!");
						var temp = window.confirm("관심상품 페이지로 이동할까요?");
						if(temp){
							location.href="wishList.my";
						}
					}
				},
				error : function(){
					console.alert("checkWish 실패");
				}
			});
    	};
    	
    	function pleaseLogin(){
    		window.alert("로그인 후 이용가능합니다.");
    	}
    </script>

</body>
</html>
<script language="JavaScript" type="text/javascript" SRC="/lib/js/todayview.js"></script>