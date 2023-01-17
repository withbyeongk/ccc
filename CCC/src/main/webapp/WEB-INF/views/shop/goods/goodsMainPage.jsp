<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="resources/css/goods/img/favicon.png" type="image/png">
    <title>CHAx3 GoodsShop</title>

    <!-- Bootstrap CSS -->
    <link href="resources/css/goods/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/goods/css/themify-icons.css" rel="stylesheet">
    <link href="resources/css/goods/css/flaticon.css" rel="stylesheet">
    <link href="resources/css/goods/vendors/fontawesome/css/all.min.css" rel="stylesheet">
    <link href="resources/css/goods/vendors/animate-css/animate.css" rel="stylesheet">
    <link href="resources/css/goods/vendors/popup/magnific-popup.css" rel="stylesheet">
    <!-- main css -->
    <link href="resources/css/goods/css/style.css" rel="stylesheet">
    <link href="resources/css/goods/css/responsive.css" rel="stylesheet">
    
    <!-- Slide -->
	<!-- Stylesheets -->
	<link rel="stylesheet" href="resources/css/goodsSlide/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/goodsSlide/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="resources/css/goodsSlide/css/slicknav.min.css"/>
	<link rel="stylesheet" href="resources/css/goodsSlide/css/fresco.css"/>
	<link rel="stylesheet" href="resources/css/goodsSlide/css/slick.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="resources/css/goodsSlide/css/style.css"/>
	
	<style>
		.hero__section{
			position:relative;
			top:-200px;
		}
		#gallery21{
			position:relative;
			top:-200px;
		}
		#jini45{
			width:80%;
			margin:auto;
			position:relative;
			top:-200px;
		}
		/*리모콘*/
        .remoteDiv{
         	position: absolute;
/*         	border: 1px solid lightgray; */
        	right: 205px;
        	top: 20px;
        	font-size: 10px;
/* 			display: none; */
			color: black;
			float: right;
			z-index:100;
        }
		#logOutBtn{
        	border: none;
        	background-color:#F07D9C;
        	border-radius: 5px;
        	color: white;
        }
        /*검색*/
		.search-box53:hover{
		  /* box-shadow: 0px 0px .5px 1px #000000; */
		  width: 282px;
		}
		.search-btn53{
		  text-decoration: none;
		  float: right;
		  width: 30px;
		  height: 30px;
		  background-color: #fff;
		  border-radius: 50%;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  color: #000000;
		}
		.search-box53:hover > .search-btn{
		  background-color: #fff;
		}
		.search-txt{
		  display: flex;
		  padding: 0;
		  width: 0px;
		  border:none;
		  background: none;
		  outline: none;
		  float: left;
		  font-size: 1rem;
		  line-height: 30px;
		  transition: .4s;
		}
		.search-box53:hover > .search-txt{
		  width: 240px;
		  padding: 0 6px;
		}
		#logOutBtn{
        	border: none;
        	background-color:lightpink;
        	border-radius: 5px;
        }
        #gallery21{
        	margin:0 auto;
        }
        
	</style>
</head>

<body>
    <c:choose>
		<c:when test="${not empty loginUser}">
			<div class="remoteDiv">
				<span id="remoteSpan1">Welcome </span>
				<span id="remoteSpan2">${loginUser.memberName}</span>
				<span id="remoteSpan3">님! </span>
				<button id="logOutBtn" onclick="logOut();"> Log out</button>
			</div>
		</c:when>
	</c:choose>
	<script>
		function logOut(){
			location.href="logout.me";
		}
	</script>
    <!-- 팝업 -->
    <%-- 	<jsp:include page="popup1.jsp"/> --%>
    <jsp:include page="popup2.jsp"/>
    
    <!-- 알람 메세지 영역 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
    <!--================ Start header Top Area =================-->
    <section class="header-top" style="height:80px;">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-6 col-lg-4">
                    <div class="float-left">
                        <ul class="header_social">
                            <li><a href="#"><i class="ti-facebook"></i></a></li>
                            <li><a href="#"><i class="ti-twitter"></i></a></li>
                            <li><a href="#"><i class="ti-instagram"></i></a></li>
                            <li><a href="#"><i class="ti-skype"></i></a></li>
                            <li><a href="#"><i class="ti-vimeo"></i></a></li>
                        </ul>   
                    </div>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 logo-wrapper">
                    <a href="goodsMain.go" class="logo">
                        <!-- <img src="resources/css/goods/img/logo.png" alt=""> -->
                        <img src="resources/css/goods/img/chalogo3.jpg" alt="">
                        
                        <!-- <h1 style="color: rgb(253, 108, 169);">CHAx3</h1> -->
                    </a>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 search-trigger">
                    <div class="right-button">
                        <ul>
                            <li>
                            	<div class="search-box53">
							      	<input type="text" class="search-txt" id="keyword" name="keyword" placeholder="검색어를 입력해주세요">
							      	<a class="search-btn53" href="#" onclick="searchGoods();">
							      		<i class="fas fa-search"></i>
							      	</a>
							    </div>
                            </li>
                            <script>
                            	function searchGoods(){
//                             		console.log("아무말");
                            		location.href="searchGoods.go?keyword="+$("#keyword").val();
                            	}
                            </script>
                            <c:choose>
			            		<c:when test="${not empty loginUser }">
									<li><a href="cart.ca">Cart</a></li>
			            		</c:when>
			            		<c:otherwise>
			                		<li><a href="#" onclick="pleaseLogin();">Cart</a></li>
			            		</c:otherwise>
			                </c:choose>
			                <c:choose>
			            		<c:when test="${empty loginUser }">
									<li><a href="loginform.me">Login</a></li>
			            		</c:when>
			            		<c:otherwise>
			                		<li><a href="mypage.me">MyPage</a></li>
			            		</c:otherwise>
			                </c:choose>
                             <c:choose>
			            		<c:when test="${not empty loginUser }">
									<li><a href=""wishList.my"">Wish</a></li>
			            		</c:when>
			            		<c:otherwise>
			                		<li><a href="#" onclick="pleaseLogin();">Wish</a></li>
			            		</c:otherwise>
			                </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function pleaseLogin(){
                window.alert("로그인 후 이용가능합니다.");
            }	
        </script>
<!--         <div class="search_input" id="search_input_box"> -->
<!--             <div class="container"> -->
<!--                 <form class="d-flex justify-content-between search-inner"> -->
<!--                     <input type="text" class="form-control" id="search_input" placeholder="Search Here"> -->
<!--                     <button type="submit" class="btn"></button> -->
<!--                     <span class="ti-close" id="close_search" title="Close Search"></span> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
    </section>
    <!--================ End header top Area =================-->

   <!-- Start header Menu Area -->
    <header id="header" class="header_area">
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        	<li class="nav-item active"><a class="nav-link" href="${ pageContext.request.contextPath }">Home</a></li>
                        	<!-- 데코 드롭다운 -->
                       		<li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Decoration</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=sticker">Stiker</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=poster">Poster</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=masking">Masking tape</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=gift">Gift wrapping</a></li>
                                    <li class="nav-item"><a class="nav-link" href="detail.go">Badge / Wapen</a></li>
                                </ul>
                            </li>
                            <!-- 다이어리 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Diary/Planner</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=diary">Diary</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=planner">Planner</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=calendar">Calendar</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=scheduler">Scheduler</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=organizer">Organizer</a></li>
                                </ul>
                            </li>
                            <!-- 노트 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Note/Memo</a>
                                <ul class="dropdown-menu">
                                	<li class="nav-item"><a class="nav-link" href="list.go?menu=postit">Post it</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=memo">Memo paper</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=basic">Basic Note</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=hardcover">Hardcover Note</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=spring">Spring Note</a></li>
                                </ul>
                            </li>
                            <!-- 사무용풍 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Office Supplies</a>
                                <ul class="dropdown-menu">
                                	<li class="nav-item"><a class="nav-link" href="list.go?menu=pen">Pen</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=card">Card / Envelope</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=binder">File binder</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=art">Art tools</a></li>
                                </ul>
                            </li>
                            <!-- 패션 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Fashion accessories</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=pouch">Pouch / Wallet</a></li>
                                	<li class="nav-item"><a class="nav-link" href="list.go?menu=bag">Bag</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=umbrella">Umbrella</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=carrier">Carrier</a></li>
                                </ul>
                            </li>
                            <!-- 디지털용품 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Digital</a>
                                <ul class="dropdown-menu">
                                	<li class="nav-item"><a class="nav-link" href="list.go?menu=phone">Phone</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=tablet">Tablet</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=pc">PC / Laptop</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=camera">Camera</a></li>
                                </ul>
                            </li>
                             <!-- 뷰티용품 드롭다운 -->
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Beauty</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=make">Make up</a></li>
                                	<li class="nav-item"><a class="nav-link" href="list.go?menu=skin">Skin care</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=cleansing">Cleansing</a></li>
                                    <li class="nav-item"><a class="nav-link" href="list.go?menu=hair">Hair / body</a></li>
                                </ul>
                            </li>
                                                        
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- End header MEnu Area -->
    
    <!--================Fullwidth block Area =================-->

    <section class="fullwidth-block area-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-lg-6 col-xl-5">
                    <div class="single-blog">
                        <div class="thumb">
                            <!-- 사진 -->
                            <img class="img-fluid" src="resources/css/goods/img/Ardium-Pop-illustration-message-card-envelope-set-01__90557.jpg" alt="">
                        </div>
                        <div class="short_details">
                            <div class="meta-top d-flex">
                                <a href="#">Decoration & Sticker</a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>'HAVE A NICE DAY' removable deco sticker pack 리무버블 스티커 팩 세트</h4>
                            </a>
                            <div class="meta-bottom d-flex" >
                                <a href="#">March 12 , 2019 . </a>
                                <a class="dark_font" href="#">By Alen Mark</a>
                            </div>
                        </div>
                    </div>    
                </div>

                <div class="col-md-6 col-lg-6 col-xl-4">
                    <div class="single-blog style_two">
                        <div class="thumb">
                            <!-- 사진 -->
                            <img class="img-fluid" src="resources/css/goods/img/Ardium-Square-paper-point-deco-sticker-19__51207.jpg" alt="">
                        </div>
                        <div class="short_details text-center ">

                            <div class="meta-top d-flex justify-content-center">
                                <a href="#">Decoration & Sticker</a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>Puppy picture gift wrapping package - 인더무드 스티커 팩 </h4>
                            </a>
                            <div class="meta-bottom d-flex justify-content-center">
                                <a href="#">March 12 , 2019 . </a>
                                <a href="#">By Alen Mark</a>
                            </div>
                        </div>
                    </div>    
                </div>

                <div class="col-lg-12 col-xl-3">
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-xl-12">
                           <div class="single-blog style-three m_b_30">
                                <div class="thumb">
                                    <img class="img-fluid" src="resources/css/goods/img/Ardium-Square-paper-point-deco-sticker-18__75048.jpg" alt="">
                                </div>
                                <div class="short_details">

                                    <div class="meta-top d-flex justify-content-center">
                                        <a href="#">Note & Memo</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4>Congraturation - 응원 메시지를 담은 떡메모지 세트 (100 pages)</h4>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-xl-12">
                            <div class="single-blog style-three">
                                <div class="thumb">
                                    <img class="img-fluid" src="resources/css/goods/img/Ardium-Pop-illustration-message-card-envelope-set-10__81148.jpg" alt="">
                                </div>
                                <div class="short_details">

                                    <div class="meta-top d-flex justify-content-center">
                                        <a href="#">Lifestyle</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4>The abundantly brought after day fish there image</h4>
                                    </a>
                                </div>
                            </div>    
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    
    
    
    
    


    
    <!--================Fullwidth block Area end 슬라이드  =================-->

	<!-- Hero Section -->
	<section class="hero__section">
		<div class="hero-slider">
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlides/img/hero-slider/1.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/1.jpg" alt="">
				</a>
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlide/img/hero-slider/2.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/2.jpg" alt="">
				</a>
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlide/img/hero-slider/3.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/3.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlides/img/hero-slider/4.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlides/img/hero-slider/4.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlide/img/hero-slider/5.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/5.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlide/img/hero-slider/6.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/6.jpg" alt="">
				</a>	
			</div>
			<div class="slide-item">
				<a class="fresco" href="resources/css/goodsSlide/img/hero-slider/7.jpg" data-fresco-group="projects">
					<img src="resources/css/goodsSlide/img/hero-slider/7.jpg" alt="">
				</a>	
			</div>
		</div>
		<div class="hero-text-slider">
			<div class="text-item">
				<h2>─ Goods Sticker ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Pouch/Wallet ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Pop up Card ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Goods Sticker ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Goods Sticker ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Pone Case ─</h2>
				<p>HARD-CHARAC</p>
			</div>
			<div class="text-item">
				<h2>─ Goods Diary ─</h2>
				<p>HARD-CHARAC</p>
			</div>
		</div>
	</section>
	
	<!--====== Javascripts & Jquery ======-->
	<script src="resources/css/goodsSlide/js/vendor/jquery-3.2.1.min.js"></script>
	<script src="resources/css/goodsSlide/js/jquery.slicknav.min.js"></script>
	<script src="resources/css/goodsSlide/js/slick.min.js"></script>
	<script src="resources/css/goodsSlide/js/fresco.min.js"></script>
	<script src="resources/css/goodsSlide/js/main.js"></script>
			

   


	<br><br>
	
	
    <!--================ Editors Picks section end =================-->      


    <div id="jini45">
	    <img src="resources/css/goods/img/mainjini2.jpg">
    </div>
    
    
    
     <!--================ First block section start =================-->     

    <br><br><br><br><br><br><br>



	<div class="position-relative overflow-hidden w-100" id="gallery21">
      <div class="container-fluid">

          <div class="col-12">
            <div class="row vw-100 px-0 py-vh-5 d-flex align-items-center scrollx" >
           
           		<div class="col-md-2" data-aos="fade-up" data-aos-delay="200">
                
              </div>
              <div class="col-md-2" data-aos="fade-up" data-aos-delay="200">
                <img src="resources/mainView/img/im1.jpg" class="img-fluid rounded shadow" alt="nice gallery image" width="1164"
                  height="776">
              </div>

              <div class="col-md-3" data-aos="fade-up" data-aos-delay="400">
                <img src="resources/mainView/img/im2.jpg" class="img-fluid rounded shadow" alt="nice gallery image" width="844"
                  height="1054">
              </div>

              <div class="col-md-3" data-aos="fade-up" data-aos-delay="600">
                <img src="resources/mainView/img/im3.jpg" class="img-fluid rounded shadow" alt="nice gallery image"
                  width="844" height="562">
              </div>
              
            </div>
          </div>
 
      </div>

    </div>
    
    <br><br><br><br><br>


    <div id="gallery21" style="text-align:center">
	    <img src="resources/css/goods/img/footerJini2.jpg">
    </div>



<!-- ================ End footer Area ================= -->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="resources/css/goods/js/jquery-2.2.4.min.js"></script>
<script src="resources/css/goods/js/popper.js"></script>
<script src="resources/css/goods/js/bootstrap.min.js"></script>
<script src="resources/css/goods/js/stellar.js"></script>
<script src="resources/css/goods/vendors/popup/jquery.magnific-popup.min.js"></script>
<script src="resources/css/goods/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/css/goods/js/waypoints.min.js"></script>
<script src="resources/css/goods/js/mail-script.js"></script>
<script src="resources/css/goods/js/contact.js"></script>
<script src="resources/css/goods/js/jquery.form.js"></script>
<script src="resources/css/goods/js/jquery.validate.min.js"></script>
<script src="resources/css/goods/js/mail-script.js"></script>
<script src="resources/css/goods/js/theme.js"></script>
</body>
</html>