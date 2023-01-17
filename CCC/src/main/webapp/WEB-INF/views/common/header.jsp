<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="h-100" lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
  <meta name="description" content="A growing collection of ready to use components for the CSS framework Bootstrap 5">
  <link rel="apple-touch-icon" sizes="180x180" href="resources/mainView/img/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="resources/mainView/img/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="resources/mainView/img/favicon-16x16.png">
  <link rel="icon" type="image/png" sizes="96x96" href="resources/mainView/img/favicon.png">
  <meta name="author" content="Holger Koenemann">
  <meta name="generator" content="Eleventy v2.0.0">
  <meta name="HandheldFriendly" content="true">
  <title>CHAx3 HARD-CHARAC</title>
  <link rel="stylesheet" href="resources/mainView/css/theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <style>
    /* inter-300 - latin */
    @font-face {
      font-family: 'Inter';
      font-style: normal;
      font-weight: 300;
      font-display: swap;
      src: local(''),
        url('./fonts/inter-v12-latin-300.woff2') format('woff2'),
        /* Chrome 26+, Opera 23+, Firefox 39+ */
        url('./fonts/inter-v12-latin-300.woff') format('woff');
      /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
    }

    @font-face {
      font-family: 'Inter';
      font-style: normal;
      font-weight: 500;
      font-display: swap;
      src: local(''),
        url('./fonts/inter-v12-latin-500.woff2') format('woff2'),
        /* Chrome 26+, Opera 23+, Firefox 39+ */
        url('./fonts/inter-v12-latin-500.woff') format('woff');
      /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
    }

    @font-face {
      font-family: 'Inter';
      font-style: normal;
      font-weight: 700;
      font-display: swap;
      src: local(''),
        url('./fonts/inter-v12-latin-700.woff2') format('woff2'),
        /* Chrome 26+, Opera 23+, Firefox 39+ */
        url('./fonts/inter-v12-latin-700.woff') format('woff');
      /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
    }
    #fadejini1{
    	position:relative;
    	
    }
    #fadejini2,#fadejini3{
    	position:absolute;

    }
    
    #fadejini4{
    	position:relative;
    	top:1100px;
    	
    }
    
    //드롭다운
    .dropdown22 {
	  position: relative;
	  display: inline-block;
	  background-color: #EA4F4D;
	  text-decoration:none;
	  color:rgb(255, 255, 255);
	  font-size:15px;
	  font-weight:600;
	  border: none;
	}
	 
	.dropdown-content {
	  display: none;
	  border: 0px;
	  position: absolute;
	  background-color: rgb(255, 255, 255);
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	  font-size:15px;
	}
	 
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  font-size:15px;
	}
	.dropdown-content a:hover {background-color: #EA004D; color:white;font-size:15px;}
	.dropdown22:hover .dropdown-content {display: block;}
	.dropdown22:hover .dropbtn {background-color: #E42525; color:white;}
   
        /*리모콘*/
        .remoteDiv{
          	position: absolute; 
/*           	border: 1px solid lightgray; */
         	right: 90px; 
         	top: 46px; 
        	font-size: 12px;
        	font-family: '맑은고딕';
/*  			display: none; */
/*			color: black;
			float: right;
			z-index:100;*/
        }
        #logOutBtn{
        	width: 67px;
        	border: none;
        	background-color: #EA4F4D;
        	color:white;
        	border-radius: 10px;
        }
        #logOutBtn:hover{
        	background-color: #E92421;
        }
    </style>
</head>

<body data-bs-spy="scroll" data-bs-target="#navScroll">
	<!-- 
	<c:choose>
		<c:when test="${not empty loginUser}">
			<div class="remoteDivs">
				<span id="remoteSpan1">${loginUser.memberName}</span>
				<span id="remoteSpan2">님 환영합니다! </span>
				<button id="logOutBtn" onclick="logOut();"> 로그아웃</button>
			</div>
		</c:when>
	</c:choose>
	 -->
	<script>
		function logOut(){
			location.href="logout.me";
		}
	</script>
	<!-- 알람 메세지 영역 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
  <nav id="navScroll" class="navbar navbar-expand-lg navbar-light fixed-top" tabindex="0" >
    <div class="container">
      <a class="navbar-brand pe-4 fs-4" href="/">
        <img src="resources/mainView/img/chalogo2.jpg">
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <div class="dropdown22">
		          <li class="nav-item">
		            <a href="${ pageContext.request.contextPath }" class="nav-link" style="font-weight:bold">
		              &nbsp;&nbsp;&nbsp; Home &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		          </li>
	          </div>
	        <div class="dropdown22">
		          <li class="nav-item">
		            <a class="nav-link" style="font-weight:bold;">
		              Board &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		           	  <div class="dropdown-content">
						  <a href="list.no">Notice</a>
						  <a href="list.fr">Free Board</a>
						  <a href="list.qu">Question</a>
					  </div>
		          </li>
	          </div>
	           <div class="dropdown22">
		          <li class="nav-item">
		            <a class="nav-link" style="font-weight:bold;">
		              Character &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		           	  <div class="dropdown-content">
		           	  	  <a href="contest.go">Contest</a>
						  <a href="list.ch">Character</a>
						  <a href="list.alltimelistgo">CHAx3 Award</a>
						  <a href="worldCupForm.ut">World Cup</a>
					  </div>
		          </li>
	          </div>
	          
	          <div class="dropdown22">
		          <li class="nav-item">
		            <a href="playground.fr" class="nav-link" style="font-weight:bold;">
		              Play Ground &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		          </li>
	          </div>
	          
	          <div class="dropdown22">
		          <li class="nav-item">
		            <a href="goodsMain.go" class="nav-link" style="font-weight:bold;">
		              Goods &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		          </li>
	          </div>
	          
	        </ul>
	        
	       
	        
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<c:choose>
            	<c:when test="${empty loginUser }">
		          <div class="dropdown22">
			          <li class="nav-item">
			            <a href="loginform.me" class="nav-link" style="color:#EA4F4D; font-weight:bold;">
			              Login &nbsp;&nbsp;&nbsp;&nbsp;
			            </a>
			          </li>
			      </div>
		      </c:when>
            <c:otherwise>
		      <div class="dropdown22">
		          <li class="nav-item">
		            <a href="mypage.me" class="nav-link" style="color:#EA4F4D; font-weight:bold;">
		              My Page &nbsp;&nbsp;&nbsp;&nbsp;
		            </a>
		          </li>
		      </div>
		    </c:otherwise>
            </c:choose>
            
            <c:choose>
            	<c:when test="${not empty loginUser }">
			      <div class="dropdown22">
			          <li class="nav-item">
			            <a href="cart.ca" class="nav-link" style="color:#EA4F4D; font-weight:bold; text-shadow: 5px 5px 5px 5px white;">
			              Cart &nbsp;&nbsp;&nbsp;&nbsp;
			            </a>
			          </li>
			      </div>
			</c:when>
            <c:otherwise>
            	<div class="dropdown22">
			          <li class="nav-item">
			            <a href="#" class="nav-link" onclick="pleaseLogin();" style="color:#EA4F4D; font-weight:bold; text-shadow: 5px 5px 5px 5px white;">
			              Cart &nbsp;&nbsp;&nbsp;&nbsp;
			            </a>
			          </li>
			      </div>
            </c:otherwise>
            </c:choose>
                
          <div class="dropdown22">
          
	          <c:choose>
		          <c:when test="${empty loginAdmin }">
			          <li class="nav-item">
			            <a href="login.ad" class="nav-link" style="color:#EA4F4D; font-weight:bold; text-shadow: 5px 5px 5px 5px white;">
			              Admin &nbsp;&nbsp;&nbsp;&nbsp;
			            </a>
			          </li>
		          </c:when>
				  <c:otherwise>
				  	 <li class="nav-item">
			            <a href="mainAdmin.ad" class="nav-link" style="color:#EA4F4D; font-weight:bold; text-shadow: 5px 5px 5px 5px white;">
			              Admin &nbsp;&nbsp;&nbsp;&nbsp;
			            </a>
			          </li>
				  </c:otherwise>
			  </c:choose>
	      </div>
	      <c:choose>
			<c:when test="${not empty loginUser}">
				<div class="remoteDiv">
			      <div class="dropdown22">
			          <li class="nav-item">
							<span id="remoteSpan1">${loginUser.memberName}</span>
							<span id="remoteSpan2">님 환영합니다! </span>
							<button id="logOutBtn" onclick="logOut();"> Log out</button>
			          </li>
			      </div>
				</div>
			</c:when>
		  </c:choose>

        </ul>
        
        <script>
		    function pleaseLogin(){
				window.alert("로그인 후 이용가능합니다.");
			}
	    </script>

      </div>
    </div>
  </nav>

  <script src="resources/mainView/js/bootstrap.bundle.min.js"></script>
  <script src="resources/mainView/js/aos.js"></script>
  <script>
    AOS.init({
      duration: 800, // values from 0 to 3000, with step 50ms
    });
  </script>

  <script>
    let scrollpos = window.scrollY;
    const header = document.querySelector(".navbar");
    const header_height = header.offsetHeight;

    const add_class_on_scroll = () => header.classList.add("scrolled", "shadow-sm");
    const remove_class_on_scroll = () => header.classList.remove("scrolled", "shadow-sm");

    window.addEventListener('scroll', function () {
      scrollpos = window.scrollY;

      if (scrollpos >= header_height) { add_class_on_scroll(); }
      else { remove_class_on_scroll(); }

      console.log(scrollpos);
    })
  </script>
  
</body>

</html>