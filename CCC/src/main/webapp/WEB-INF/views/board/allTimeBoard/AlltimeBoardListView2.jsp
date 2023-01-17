<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

	<title>CCC Awards</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />



	<link href="resources/css/freeboard/style_fr.css" rel="stylesheet">
	
	<style>
	
	
		.alltimeBtn{
			height: 33px;
        	font-size: 20px;
        	font-weight: bold;
		}
		.alltimeBtn:hover{
			font-size: 21px;
		}
		.thisMonthBtn{
			border-radius: 3px;
			width: 250px;
			margin-bottom: 3px;
			background: linear-gradient( 90deg, rgba(129, 230, 217, 1) 0%, rgba(79, 209, 197, 1) 100% );
			color: black;
			border:0px;
			margin-right: 50px;
		}
		.thisYearBtn{
			border-radius: 3px;
			width: 220px;
			margin-bottom: 3px;
			background-color: coral;
			color: black;
			border:0px;
		}
	</style>
   
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/board/allTimeBoard/popup.jsp"/>
<%-- 	<jsp:include page="/WEB-INF/views/shop/goods/goodsNavi.jsp"/> --%>

<div id="month202212" class="month-timeline d_timeline ">

	

	<div class="sec-week-wrap" style="margin:100px;" >
	
				
					
					
		<div class="fix-timeline">
			<div class="green-box">
				<span class="frame_g"></span>	
			</div>
		</div>
		<div class="area">
				<h1><b>CCC 역대 수상작</b></h1>
			<div class="sec-title">
				<h2>
					 <button type="button" class="alltimeBtn thisMonthBtn"  onclick="ThisMonthLikes();">이번달 좋아요 높은순</button>
		  	
		 		 	 <button type="button" class="alltimeBtn thisYearBtn"  onclick="ThisYearLikes();">올해 좋아요 높은순</button>
				</h2>
			</div>
		</div>

		<div class="area-type2">
			<div class="weekly-result-set"> <!-- 유저정보를 불러욜 경우 Type2를 붙혀준다 -->
				<div class="list-section">
					<div class="img-area">
						
						<div></div> <!-- 여기 div는 썸네일마냥 1등만 크게 띄워주는곳  -->
						<span class="n1"></span><!-- 클래스 n1 ~ n5 -->						
						
					</div>
					<div class="list-area">
						<ul>
<!-- //////////////////////////////////////////여기 아래는 1등///////////////////////// -->
							<li class="num01">
								<div class="vote-info">
									<div class="vote-rate">
										<div class="rank-area"> <!--rank-area지우면 안됌  -->
											<span class="rank n01">순위</span>
											좋아요 👍
											<p class="score1">1등 좋아요 갯수는 과연?<span class="txt">👍</span>👍👍</p>
									
										</div>
											
										<div class="graph-area type1">
											<!--  -->
											<div class="rankName">
												
												1등 캐릭터 명 :
													<!-- 여기 아래는 div는 1등한 캐릭터 이름  -->
												<div>
												
												</div>
										
											
											</div>
			
										</div>
									</div>
								</div>
							</li>
<!-- //////////////////////////////////////////여기 아래는 2등///////////////////////// -->
							<li class="num02">
								<div class="vote-info">
									<div class="vote-rate">
										<div class="rank-area">
											<span class="rank n02">순위</span>
												좋아요 👍
											<p class="score2">2등 좋아요 갯수는 과연?<span class="txt">👍👍</span></p>
										</div>
										<div class="graph-area type1">
											<!-- 복수 아티스트 -->
												<div class="rankName2">
													
													2등 캐릭터 명 :
														<!-- 여기 아래는 div는 1등한 캐릭터 이름  -->
													<div>
														<b></b>
													</div>
											
												
												</div>
											<div class="vote-rate2">
												<p>좋아요 2등!!!!</p>
												
											
												
											</div>
										</div>
									</div>
								</div>
							</li>
	
<!-- //////////////////////////////////////////여기 아래는 3등///////////////////////// -->
							<li class="num03">
								<div class="vote-info">
									<div class="vote-rate">
										<div class="rank-area">
											<span class="rank n03">순위</span>
											좋아요 👍
											<p class="score3">3등 좋아요 갯수는 과연?<span class="txt">👍</span>👍</p>
										</div>
										<div class="graph-area type1">
											<!-- 복수 아티스트 -->
												<div class="rankName3">
												
													3등 캐릭터 명 :
														<!-- 여기 아래는 div는 1등한 캐릭터 이름  -->
													<div>
														<b></b>
													</div>
											
												
												</div>
										
											<div class="vote-rate3">
												<p>좋아요3등 !!!!  </p>
												  	 
													  
											</div>
										</div>
									</div>
								</div>
							</li>


						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="area">
			<div class="btn-area-allview"><a href="#a1" class="btn-allview d_click_log_area" data-click-log="페이지이동,,투표결과,전체보기,,,," data-award-mon="202212" data-award-week="5"><span class="visible">전체보기</span></a></div>
		</div>
	</div>


	
</div>

	<script type="text/javascript">
		$(function(){
			
		})
		
		//아래는 이번달 좋아요 
		function ThisMonthLikes(){
			
			$.ajax({
				url : "ThisMonthLikes.li",
				success : function(result){
					console.log(result)
					console.log("연결성공");
	
			
			var resultStr = ""; 	 // 좋아요만
			var resultStr2 = "";	 //좋아요만
			var resultStr3 = "";	 //좋아요만 
			var resultStrimg = "";   //이미지
			var resultStrimg2 = "";   //이미지
			var resultStrimg3 = "";   //이미지
			var resultStrName= ""; //1등 이름
			var resultStrName2= ""; //2등 이름
			var resultStrName3= ""; //3등 이름
			
			
			///////아래1등 좋아요만//////
			
			resultStr += "<div>"
				                +"<div >" +result[0].like + "</div>"
			            +"</div>";
			
			    //아래는 1등이미지         
            resultStrimg += "<div>"
				                +"<div >" +"<p ><img src='" + result[0].changeName  + "' style='height: 100%; width: 100%;'></p>👍👍👍👍👍👍👍👍좋아요1등👍👍👍👍👍👍👍👍</div>"
				           +"</div>";            
			  //1등 이름
           resultStrName += "<div>"
				                +"<div >" + result[0].charName  + "</div>"
				           +"</div>"; 	           
			            
				           
		 //////////아래 좋아요2222222222222222222등///////		           
  		 //////////아래 좋아요2222222222222222222등///////
   		 //////////아래 좋아요2222222222222222222등///////

           resultStr2 += "<div>"
       					    +"<div>" + result[1].like + "</div>"
			           +"</div>";
			           
           resultStrName2 += "<div>"
				                +"<div >" + result[1].charName  + "</div>"
				           +"</div>"; 
           //아래는 2등이미지         
            resultStrimg2 += "<div>"
				                +"<div >" +"<img src='" + result[1].changeName  + "' style='height: 20%; width: 70%;'></div>"
				           +"</div>";
           
		 //////////아래 좋아요33333333333333333333등///////
		 //////////아래 좋아요33333333333333333333등///////
         //////////아래 좋아요33333333333333333333등///////
         
           resultStr3 += "<div>"
          				     +"<div>" + result[2].like + "</div>"
				         +"</div>";
				         
         resultStrName3 += "<div>"
				                +"<div >" + result[2].charName  + "</div>"
				           +"</div>"; 
          //아래는 3등이미지         
           resultStrimg3 += "<div>"
			                +"<div >" +"<p ><img src='" + result[2].changeName  + "' style='height: 20%; width: 70%;'></p></div>"
			          	 +"</div>";
				         
			          $(".score1").html(resultStr); //1등좋아요  
					  $(".rankName> div").html(resultStrName); //1등 이름 
					  $(".img-area div").html(resultStrimg); //1등은 이미지만 
					  
					  $(".score2").html(resultStr2); //2등좋아요
					  $(".rankName2> div").html(resultStrName2); //2등 이름 
					  $(".vote-rate2").html(resultStrimg2); //2등은 이미지만
					  
					  $(".score3").html(resultStr3); //3등좋아요
					  $(".rankName3> div").html(resultStrName3); //3등 이름 
					  $(".vote-rate3").html(resultStrimg3); //2등은 이미지만
				},
				error : function(){
					console.log("통신실패");
				}	
			
			});
		}
	
		//아래는 올해 좋아요 순 
		function ThisYearLikes(){
			$.ajax({
				url : "ThisYearLikes.li",
				success : function(result){
					console.log(result)
					console.log("연결성공");
	
			
			var resultStr = ""; 	 // 좋아요만
			var resultStr2 = "";	 //좋아요만
			var resultStr3 = "";	 //좋아요만 
			var resultStrimg = "";   //이미지
			var resultStrimg2 = "";   //이미지
			var resultStrimg3 = "";   //이미지
			var resultStrName= ""; //1등 이름
			var resultStrName2= ""; //2등 이름
			var resultStrName3= ""; //3등 이름
			
			
			///////아래1등 좋아요만//////
			
			resultStr += "<div>"
				                +"<div >" +result[0].like + "</div>"
			            +"</div>";
			
			    //아래는 1등이미지         
            resultStrimg += "<div>"
				                +"<div >" +"<p ><img src='" + result[0].changeName  + "' style='height: 100%; width: 100%;'></p>👍👍👍👍👍👍👍👍좋아요1등👍👍👍👍👍👍👍👍</div>"
				           +"</div>";            
			  //1등 이름
           resultStrName += "<div>"
				                +"<div >" + result[0].charName  + "</div>"
				           +"</div>"; 	           
			            
				           
		 //////////아래 좋아요2222222222222222222등///////		           
  		 //////////아래 좋아요2222222222222222222등///////
   		 //////////아래 좋아요2222222222222222222등///////

           resultStr2 += "<div>"
       					    +"<div>" + result[1].like + "</div>"
			           +"</div>";
			           
           resultStrName2 += "<div>"
				                +"<div >" + result[1].charName  + "</div>"
				           +"</div>"; 
           //아래는 2등이미지         
            resultStrimg2 += "<div>"
				                +"<div >" +"<img src='" + result[1].changeName  + "' style='height: 20%; width: 70%;'></div>"
				           +"</div>";
           
		 //////////아래 좋아요33333333333333333333등///////
		 //////////아래 좋아요33333333333333333333등///////
         //////////아래 좋아요33333333333333333333등///////
         
           resultStr3 += "<div>"
          				     +"<div>" + result[2].like + "</div>"
				         +"</div>";
				         
         resultStrName3 += "<div>"
				                +"<div >" + result[2].charName  + "</div>"
				           +"</div>"; 
          //아래는 3등이미지         
           resultStrimg3 += "<div>"
			                +"<div >" +"<p ><img src='" + result[2].changeName  + "' style='height: 20%; width: 70%;'></p></div>"
			          	 +"</div>";
				         
			          $(".score1").html(resultStr); //1등좋아요 
			          $(".count").html(resultStr); //1등좋아요  
			          $(".count").html(resultStr); //1등좋아요  
					  $(".rankName> div").html(resultStrName); //1등 이름 
					  $(".img-area div").html(resultStrimg); //1등은 이미지만 
					  
					  $(".score2").html(resultStr2); //2등좋아요
					  $(".rankName2> div").html(resultStrName2); //2등 이름 
					  
					  $(".vote-rate2").html(resultStrimg2); //2등은 이미지만
					  
					  $(".score3").html(resultStr3); //3등좋아요
					  $(".rankName3> div").html(resultStrName3); //3등 이름 
					  $(".vote-rate3").html(resultStrimg3); //2등은 이미지만
				},
				error : function(){
					console.log("통신실패");
				}	
			});
		}
		
		
	</script>


</body>
</html>