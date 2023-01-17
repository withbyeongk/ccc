<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐캐캐::캐릭터 게시판</title>
 	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
	<!-- 여기부터 -->
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="resources/mainAdmin/assets/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="resources/mainAdmin/css/styles.css" rel="stylesheet" />
        	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	
	<style>
		/* outer */
		#charOuter{
			width: 60%;
			margin: auto;
		}
		/* 페이징 영역 */
		#pagingArea {width:fit-content; margin:auto;} 
		/* 썸네일 호버 */
		.thumbnail:hover {cursor:pointer; opacity: 0.5;}

		#searchForm {
			width:fit-content; margin:auto;
      	}
      	#searchForm>* {
			float:left;
			margin:5px;
		}
      .select { width:20%; }
      .text { width:53%; }
      .searchBtn { width:20%; }
      .likeBtn {
      	width:30px;
      	height:30px;
      }
      .likeBtn:hover { cursor : pointer; }
      .likeFont { font-weight : bold; }
      #insertCharacterBtn { border : 3px solid black; }
      
      /*버튼 만들기*/
	      
		    
  
    .btn13{
      text-decoration: none;
      font-size:1.5rem;
      color:white;
      padding:5px 20px 6px 20px;
      margin:100px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      font-family: 'Do Hyeon', sans-serif;
      font-family: 'Nanum Pen Script', cursive;
      font-family: 'Jua', sans-serif;
    }
    .btn13:active{
      transform: translateY(3px);
    }
    .btn13.red{
      background-color: #FF521E;
      border-bottom:4px solid #C1370E;
    }
    .btn13.red:active{
      border-bottom:2px solid #C1370E;
    }
		    
		    
        </style>
        
    </head>
    <body id="page-top">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
<!--             <div class="container"> -->
			<div id="charOuter">
                <div class="text-center">
                	<br><br><br><br><br><br>
                    <h2 class="section-heading text-uppercase">캐릭터 썸네일 게시판</h2>
                    
					<!-- 로그인 유저만 글작성 가능하도록 -->
                    <c:if test="${ not empty loginUser }">
						<a class="btn13 red" href="insert.ch">당신의 캐릭터를 등록하세요 !</a>
					</c:if>
                </div>
                
                <div class="row">
                	<c:choose>
                		<c:when test="${ not empty list }">
                			<c:forEach var="b" items="${ list }">
			                    <div class="col-lg-4 col-sm-6 mb-4">
			                        <!-- Portfolio item 1-->
			                        <div class="portfolio-item">
			                            <div class="thumbnail">
			                            	<input type="hidden" id="boardNo" name="boardNo" value="${ b.boardNo }">
			                                <img class="img-fluid" src="${ pageContext.request.contentType }${ b.changeName }" alt="..." />	                                
			                            </div>
			                            <div class="portfolio-caption">
			                                <div class="portfolio-caption-heading"></div>
			                                <div class="portfolio-caption-subheading text-muted"><p style="font-size:x-large;">${ b.boardTitle }</p></div>
			                      			
			   								<c:choose>
			   									<c:when test="${ b.memberLike eq 1 }">	   										              
			   										<span class="likeFont">좋아요 </span><img class="likeBtn" onclick="likeGo('${ b.boardNo }');" src="${ pageContext.request.contentType }resources/character/likeImg/free-icon-heart-true.png" title="heart icons"><br><span class="likeFont">좋아요 수 : ${ b.like }</span>   
			   									</c:when>
			   									<c:otherwise>		   																	                                        			   										
			   										<span class="likeFont">좋아요 </span><img class="likeBtn" onclick="likeGo('${ b.boardNo }');" src="${ pageContext.request.contentType }resources/character/likeImg/free-icon-heart-false.png" title="heart icons"><br><span class="likeFont">좋아요 수 : ${ b.like }</span>		                                        			   										
			   									</c:otherwise>
			   								</c:choose>
			                            </div>
			                        </div>
			                    </div> 
                			</c:forEach>
                		</c:when>
                		<c:otherwise>
                			조회된 캐릭터가 없습니다.
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <br><br>
        
	        <!-- 페이징 영역 -->
			<div id="pagingArea">
	            <ul class="pagination">
	            	<!-- currentPage 1이면 숨기기 -->
	            	<c:choose>
	            		<c:when test="${ pi.currentPage ne 1 }">
	                  		<li class="page-item"><a class="page-link" href="list.ch?currentPage=${ pi.currentPage -1 }">Previous</a></li>
	            		</c:when>
	            		<c:otherwise>
	                  		<li class="page-item disabled"><a class="page-link" href="list.ch?currentPage=${ pi.currentPage -1 }">Previous</a></li>
	            		</c:otherwise>
	            	</c:choose>
	            	<!-- controller에서 넘어온 pi의 startPage와 endPage생성 -->
            		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                  		<li class="page-item"><a class="page-link" href="list.ch?currentPage=${ p }">${ p }</a></li>
            		</c:forEach>	
	            	<!-- currentPage가 maxPage와 일치하면 숨기기 -->
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq pi.maxPage }">	                		
	                  <li class="page-item disabled"><a class="page-link" href="list.ch?currentPage=${ pi.currentPage +1 }">Next</a></li>
	            		</c:when>
	            		<c:otherwise>
	                  <li class="page-item"><a class="page-link" href="list.ch?currentPage=${ pi.currentPage +1 }">Next</a></li>
	            		</c:otherwise>
	            	</c:choose>
	            </ul>
			</div>
			<br>
			
			<!-- 검색바 영역 -->
			<form id="searchForm" action="search.ch" method="get" align="center">
		        <div class="selectCharacterBoardCondition">
		            <select class="selectCondition" name="condition" style="width:150px; height:30px;">
		                <option value="writer">창작자</option>
		                <option value="title">캐릭터이름</option>
		                <option value="content">캐릭터설명</option>
		            </select>
		            <input type="text" id="textkeyword" name="keyword" style="width:500px;">
			        <button type="submit" style="width:150px; height:30px; border:1px solid">검색</button>
		        </div>
			</form>
		<br><br><br>
        </section>
        
        <!-- 만약 condition에 검색 데이터가 있다면 -->
        <c:if test="${ not empty condition }">
        	<script>
        		$(function(){
        			$("#searchForm option[value=${ condition }]").attr("selected",true);
        		})
        	</script>
        </c:if>

        <!-- 썸네일 캐릭터를 클릭하면 해당 게시글의 번호를 가지고 상세조회 페이지로 넘어가도록 -->
		<script>
			$(function(){
				$(".thumbnail").click(function(){
					location.href="detail.ch?bno="+$(this).children().eq(0).val();
				});
			});
			
			//좋아요 등록 및 취소 (게시글 번호,로그인유저 번호,캐릭터 번호)
			function likeGo(charListBoardNo){
				$.ajax({
					url : "boardListLike.ch",
					data : { 
						refBno : charListBoardNo,
						memberNo : ${ loginUser.memberNo }
					},
					success : function(result){
						//통신성공하면 페이지 새로고침하도록
						location.reload();
					},
					error : function(){
						console.log("통신실패");
					}
				})
			}
		</script>
	</body>
</html>