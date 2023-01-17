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
    <link href="resources/css/goods/css/responsive.css" rel="stylesheet">
    
    <!-- jquery -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
    <style>
    	.search-box53{
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%,-50%);
		  height: 30px;
		  background-color: #fff;
		  border-radius: 30px;
		  transition: 0.4s;
		  width:30px;
		}
		#jini45{
			width:60%;
			margin:auto;
		}
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
		/*리모콘*/
        .remoteDiv{
         	position: absolute;
/*          	border: 1px solid lightgray;  */
        	right: 220px;
        	top: 17px;
        	font-size: 11px;
/* 			display: none; */
			color: black;
			float: right;
			z-index:100;
        }
		#logOutBtn{
			width: 90px;
			text-align: center;
        	background-color:#F07D9C;
        	border-radius: 5px;
        	color: white;
        }
        #remoteSpan3{
        	margin-right: 5px;
        }
    </style>
</head>
<body>
	<!-- 알람 메세지 영역 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	<c:choose>
		<c:when test="${not empty loginUser}">
			<div class="remoteDiv">
				<span id="remoteSpan1">Welcome </span>
				<span id="remoteSpan2">${loginUser.memberName}</span>
				<span id="remoteSpan3">님! </span>
				<a id="logOutBtn" href="logout.me"> &nbsp;&nbsp;Log out&nbsp;&nbsp; </a>
			</div>
		</c:when>
	</c:choose>
	<!-- 팝업 -->
   	<jsp:include page="popup1.jsp"/>
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
                    <a href="redirect:" class="logo">
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
                           <!-- <li><a id="search" href="javascript:void(0)"><i class="fas fa-search"></i></a></li> -->
                            <!-- <li><a id="search" href="javascript:void(0)"><i class="fas fa-search"></i></a></li> -->

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
									<li><a href="wishList.my">Wish</a></li>
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
        <!-- <div class="search_input" id="search_input_box">
            <div class="container">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div> -->
    </section>
    
    <script>
        function pleaseLogin(){
			window.alert("로그인 후 이용가능합니다.");
		}	
    	
    	/* 줄바꿈 */
    	//enter => <br>
			var text = $('textarea').val();
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			//<br> => enter
			var text = $('textarea').val();
			text = text.split('<br>').join("\r\n");
    </script>
    
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
                        	<li class="nav-item active"><a class="nav-link" href="goodsMain.go">Home</a></li>
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


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="resources/css/goods/js/jquery-2.2.4.min.js"></script>
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
<script src="resources/css/goods/js/theme.js"></script> -->
</body>
</html>