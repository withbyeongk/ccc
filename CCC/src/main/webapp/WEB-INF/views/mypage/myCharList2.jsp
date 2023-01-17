<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 캐릭터</title>
<meta name="description"
	content="Grid Loading and Hover Effect: Recreating Samsung's grid loading effect" />
<meta name="keywords"
	content="grid loading, swipe, effect, slide, masonry, web design, tutorial" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="resources/myPage/bootstrap/myCharList2/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="resources/myPage/bootstrap/myCharList2/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/myPage/bootstrap/myCharList2/css/component.css" />
<script
	src="resources/myPage/bootstrap/myCharList2/js/modernizr.custom.js"></script>
<!-- 제이쿼리 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 	
</head>
<body>
	<%--<jsp:include page="/WEB-INF/views/common/header.jsp"/>   --%>

	<div class="container">
		<!-- Top Navigation -->
		<div class="codrops-top clearfix">
			<a class="codrops-icon codrops-icon-prev"
				onclick="javascript:history.go(-1);""><span
				style="font-size: 30px;">마이페이지</span></a> <span class="right"><a
				class=" href=" http://tympanus.net/codrops/?p=19069"><span></span></a></span>
		</div>
		<header class="codrops-header">
			<h1>
				CCC My Character<span style="font-size: 30px;">내가 만든 나만의 캐릭터<a
					href="#">&nbsp; Create.Challenge.Choose</a></span>
			</h1>
			<nav class="codrops-demos">
				<a href="index.html">Create</a> <a class="current-demo"
					href="index2.html">Challenge</a> <a href="index3.html">Choose</a>
			</nav>
			<br>
			<br> <a class="btn btn-primary" id="today-order"
				href="enrollForm.mychar;" role="button"
				style="margin-left: 2px; background-color: #EA4F4D; color: white;width:90px; ">새 캐릭터 등록</a>
		</header>
		<section class="grid-wrap">
			<ul class="grid swipe-down" id="grid">
				<li class="title-box">
					<h2>
						Illustrations by <a href="#">${loginUser.memberName}</a>
					</h2>
				</li>
				<!-- 이미지 돌려주는 반복문 -->
				<c:forEach var="cha" items="${chalist}">
					<!-- 캐릭터번호 hidden -->
					<input type="hidden" value="${cha.characterNo}" id="hidden">
					<!-- 이미지 -->
					<li><a href="#" onclick="chardetail('${cha.characterNo}');"><img src="${cha.changeName}"class="thumbnail" alt="dummy"
							style="width: 400px; height: 500px;">
						<h3>${cha.characterName}&nbsp; &nbsp; &nbsp;
								${cha.characterCreateDate}</h3></a></li>
				</c:forEach>
			</ul>
		</section>
		
		<section class="related">
			<p style="color: red;font-weight: bold;">HARD CHARAC</p>
		</section>
		<script type="text/javascript">
		  
		  //캐릭터 목록에서 누르면 상세보기 화면으로 가는 스크립트
		  function chardetail(characterNo) {
			location.href="chardetail.my?characterNo="+characterNo;
		  }  
		
		</script>

	</div>
	<!-- /container -->
	<script
		src="resources/myPage/bootstrap/myCharList2/js/masonry.pkgd.min.js"></script>
	<script
		src="resources/myPage/bootstrap/myCharList2/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/myPage/bootstrap/myCharList2/js/classie.js"></script>
	<script
		src="resources/myPage/bootstrap/myCharList2/js/colorfinder-1.1.js"></script>
	<script src="resources/myPage/bootstrap/myCharList2/js/gridScrollFx.js"></script>
	<script>
		new GridScrollFx(document.getElementById('grid'), {
			viewportFactor : 0.4
		});
	</script>
</body>
</html>