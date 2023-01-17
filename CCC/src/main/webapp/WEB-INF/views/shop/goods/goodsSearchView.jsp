<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Sticker List Page</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/listView/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/listView/css/animate.css">
    
    <link rel="stylesheet" href="resources/css/listView/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/listView/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/listView/css/magnific-popup.css">

    <link rel="stylesheet" href="resources/css/listView/css/aos.css">

    <link rel="stylesheet" href="resources/css/listView/css/ionicons.min.css">
    
    <link rel="stylesheet" href="resources/css/listView/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/listView/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/listView/css/style.css"> -->
    
    <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300;400;700&family=Jua&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Single+Day&family=Stylish&display=swap" rel="stylesheet">
 	
 	<style>
 		#jini1{
 			position: relative;
 			right:-230px;
 			top : -25px;
 			color : rgb(196, 0, 0);
 		}
 		#jini2{
 			position: relative;
 			top : -20px;
 			color : black;
 		}
 		a:link {color : gray;}
		a:hover {color : rgb(230, 127, 183);}
		a:active {color : rgb(230, 127, 183);}
		
		.img img {
		  transition: all 0.2s linear;
		  overflow: hidden;
		}
		.img:hover img {
		  transform: scale(1.1);
		}
		.img {
		  overflow: hidden;
		}
		
		/* 슬라이드 */
		.banner-container{
		  width:100vw;
		  height:500px;
		  overflow:hidden;
		  margin: auto;
		}
		.banner{
		  width:calc(100vw*4);
		  height:100%;
		  display:flex;
		  animation: animation1 10s infinite;
		  /*기본 전환 animation을 위한 설정*/
		  -webkit-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
		  -moz-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
		  -o-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
		  -ms-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
		  transition: all 0.5s cubic-bezier(1, .01, .32, 1);
		}
		.banner>div{
		  width:100vw;
		  height:100%;
		}
		.banner>div:nth-child(1){
		  background-image: url(resources/css/listView/images/20230109_021309.jpg);
		}
		.banner>div:nth-child(2){
		  background-image: url(resources/css/listView/images/20230109_0209262.jpg);
		}
		.banner>div:nth-child(3){
		  background-image: url(resources/css/listView/images/20230109_021109.jpg);
		}
		.banner>div:nth-child(4){
		  background-image: url(resources/css/listView/images/20230109_021334.jpg);
		}
		.list-button{
		  width:100%;
		  height:10px;
		  display:flex;
		  justify-content:center;
		  margin-top:-30px;
		  position:absolute;
		  z-index:2;
		}
		.list-button-item{
		  width:10px;
		  height:10px;
		  border-radius:5rem;
		  background-color:black;
		  cursor: pointer;
		  display: inline-block;
		  margin:6px;
		}
		.list-button-item.active{
		  background-color:white;
		}
		@keyframes animation1 {
		  0% {margin-left: 0}
		  20% {margin-left: 0}
		  25% {margin-left: -100%}
		  45% {margin-left: -100%}
		  50% {margin-left: -200%}
		  70% {margin-left: -200%}
		  75% {margin-left: -300%}
		  95% {margin-left: -300%}
		  100% {margin-left: 0}
		}
		@keyframes animation2 {
		  0% {margin-left: -100%}
		  20% {margin-left: -100%}
		  25% {margin-left: -200%}
		  45% {margin-left: -200%}
		  50% {margin-left: -300%}
		  70% {margin-left: -300%}
		  75% {margin-left: 0}
		  95% {margin-left: 0}
		  100% {margin-left: -100%}
		}
		@keyframes animation3 {
		  0% {margin-left: -200%}
		  20% {margin-left: -200%}
		  25% {margin-left: -300%}
		  45% {margin-left: -300%}
		  50% {margin-left: 0}
		  70% {margin-left: 0}
		  75% {margin-left: -100%}
		  95% {margin-left: -100%}
		  100% {margin-left: -200%}
		}
		@keyframes animation4 {
		  0% {margin-left: -300%}
		  20% {margin-left: -300%}
		  25% {margin-left: 0}
		  45% {margin-left: 0}
		  50% {margin-left: -100%}
		  70% {margin-left: -100%}
		  75% {margin-left: -200%}
		  95% {margin-left: -200%}
		  100% {margin-left: -300%}
		}

 	</style>
 	
    
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<!-- 네비바 -->
 	<jsp:include page="/WEB-INF/views/shop/goods/goodsNavi.jsp"/>
 	
 	
 	<!-- 슬라이드 -->
 	<div class="banner-container">
	  <div class="banner">
	    <div data-index=1></div>
	    <div data-index=2></div>
	    <div data-index=3></div>
	    <div data-index=4></div>
	    
	  </div>
	</div>
	<div class="list-button">
	  <span class="list-button-item active"></span> 
	  <span class="list-button-item"></span> 
	  <span class="list-button-item"></span> 
	  <span class="list-button-item"></span> 
	</div>

	
	<div class="frame">

	<script>
		let interval;
		let activeIndex = 1;
	
		$(document).ready(function(){
		  interval = setInterval(changeActiveIndex,2500);
			$('.list-button-item').on('click',function(){
		  	// list button의 색상 변경
		    const index = $(this).index();
		    activeIndex = index;
		    changeActiveIndex();
		    clearInterval(interval);
		    // animation 재설정을 위해 animation을 잠시 제거한다.
		    $('.banner').css('animation','none');
		   	// animation 재설정
		    $('.banner').animate({marginLeft:`${-100*index}%`},1,function(){
		    	//1초의 시간 여유(해당 이미지로 이동하는 animation을 위한 시간)를 두고 다시 animation을 설정한다.
		    	setTimeout(function(){
		    		$('.banner').css('animation',`animation${index+1} 10s infinite`)
		  
		  		interval = setInterval(changeActiveIndex,2500);
		      }, 1000)
		    })
		  })
		})
		function changeActiveIndex(){
			if(activeIndex>3) {
		  	activeIndex%=4;
		  }
		  changeActiveBtn();
			activeIndex+=1;
		}
		function changeActiveBtn(){
		  $('.list-button-item').removeClass('active');
		  $(`.list-button span:eq(${activeIndex})`).addClass('active');
		}
	</script>
	

 	
    <div class="container">
        <div class="row justify-content-center pb-5">
			
		</div>
    
    
    	<div class="row">
        <!-- 리스트 뽑기 -->
	        <c:choose>
				<c:when test="${ not empty list }">
					<c:forEach var="g" items="${ list }">
				        <div class="col-md-6 col-lg-4 ftco-animate">
			                <div class="project">
			                    <div class="img">
			                    	<a href="detail.go?gno=${g.goodsNo}" id="jinimg"><img src="${g.goodsChangeName1}" class="img-fluid" alt="${g.goodsChangeName1}"></a>
			                    </div>
			                    
			                    <div class="text">
			                    
			                        <!-- <h4 class="price"><span class="old-price mr-2">$500</span>$400</h4> -->
			                        <span style="color:#a3be89;">${g.goodsCategory}</span><br>
			                        <span>${g.goodsBrand}</span><br>
			                        
			                        <h5 id="jini1"><img src="resources/css/listView/images/gift.jpg"> ${g.goodsPrice}원</h4>
									                        																		<%-- <h4 id="jiniposition2"><a href="destination.html">${g.goodsName}</a></h4> --%>
			                        <h4 id="jini2"><a href="destination.html">${g.goodsName}</a></h4>
			                        <div class="star d-flex clearfix">
			                            <div class="mr-auto float-left">
			                                <span class="ion-ios-star"></span>
			                                <span class="ion-ios-star"></span>
			                                <span class="ion-ios-star"></span>
			                                <span class="ion-ios-star"></span>
			                                <span class="ion-ios-star"></span>
			                            </div>

			                        </div>
			                        <br>
			                    </div>
			                    <a href="resources/css/listView/images/destination-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
			                        <span class="icon-expand"></span>
			                    </a>
			                </div>
			            </div>
	                </c:forEach>
				</c:when>
				<c:otherwise>
					조회된 게시글이 없습니당...
				</c:otherwise>
			</c:choose>
            
            
            <!-- 기존 -->
            
            <!--  
            <div class="col-md-6 col-lg-4 ftco-animate">
                <div class="project">
                    <div class="img">
                        <a href="destination.html"><img src="resources/css/listView/images/destination-1.jpg" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="text">
                        <h4 class="price"><span class="old-price mr-2">$500</span>$400</h4>
                        <span>15 Days Tour</span>
                        <h3><a href="destination.html">Gurtnellen, Swetzerland</a></h3>
                        <div class="star d-flex clearfix">
                            <div class="mr-auto float-left">
                                <span class="ion-ios-star"></span>
                                <span class="ion-ios-star"></span>
                                <span class="ion-ios-star"></span>
                                <span class="ion-ios-star"></span>
                                <span class="ion-ios-star"></span>
                            </div>
                            <div class="float-right">
                                <span class="rate"><a href="#">(120)</a></span>
                            </div>
                        </div>
                    </div>
                    <a href="resources/css/listView/images/destination-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="icon-expand"></span>
                    </a>
                </div>
            </div>
            -->
        </div>
    </div>
</section>

<br><br><br><br><br><br><br>


	<c:if test="${not empty loginUser}">
		<!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
		<a class="btn btn-secondary" style="float:left;" href="insert.bo">글쓰기</a>
	</c:if>
	<a class="btn btn-secondary" style="float:left;" href="insert.go">글쓰기</a>

	<section class="ftco-section">

 <!--  <script src="resources/css/listView/js/jquery.min.js"></script>
  <script src="resources/css/listView/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/css/listView/js/popper.min.js"></script>
  <script src="resources/css/listView/js/bootstrap.min.js"></script>
  <script src="resources/css/listView/js/jquery.easing.1.3.js"></script>
  <script src="resources/css/listView/js/jquery.waypoints.min.js"></script>
  <script src="resources/css/listView/js/jquery.stellar.min.js"></script>
  <script src="resources/css/listView/js/owl.carousel.min.js"></script>
  <script src="resources/css/listView/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/css/listView/js/aos.js"></script>
  <script src="resources/css/listView/js/jquery.animateNumber.min.js"></script>
  <script src="resources/css/listView/js/scrollax.min.js"></script>  
  <script src="resources/css/listView/js/main.js"></script> -->
    
  </body>
</html>