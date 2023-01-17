<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
    
    	
		.w-btn-pink-outline {
		    border: 3px solid #eedfe5;
		    color: #6e6e6e;
		}
		
		.w-btn-pink-outline:hover {
		    background-color: #f199bc;
		    color: #d4dfe6;
		  
		}
    
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        
        
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}
        #pagingArea {width:fit-content; margin:auto;}
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <br><br><br><br><br><br>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h1>자유게시판</h1>
            <br>
   
            <a class="w-btn-pink-outline" style="float:right;" href="insert.fpom" >글쓰기</a>
        
            <br>
            <br>
            <table id="boardList" class="table table-hover"  align="center">
                <thead>
                    <tr class="ct">
                    	<th><input type="checkbox"></th>
                        <th>글번호</th>
                        <th>제목</th>
               		    <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>               	
       
                	<c:forEach var="B" items="${list}">
						<tr>
							<td data-index="1"><input type="checkbox" name="check" id="multiCheck" value="${B.fNo}"></td>
	                        <td data-index="2">${B.fNo }</td>
	                        <td data-index="3" class="goDetailFr">${B.fTitle }</td>
	                    	<td data-index="4">${B.mId } </td>
	                        <td data-index="5">${B.fCount }</td>
	                        <td data-index="6">${B.fCreateDate }</td>
	                        <td>
	                        <c:if test="${!B.fTitleimg.isEmpty()}">★
	                        </c:if>
	                        </td>
	                    </tr>
                	</c:forEach>
           	
                    
                </tbody>
            </table>
            
            <!--      글번호 히든으로 넘기기 -->
			<input type="hidden" name="fWriterNo" value="${loginUser.memberNo}">
			
            <br>
           <div id="pagingArea">
                <ul class="pagination">
                	<!-- currentPage가 1이면 숨기기 -->
                	<c:choose>
	                	<c:when test="${ pi.currentPage ne 1 }">
	                    	<li class="page-item"><a class="page-link" href="list.fr?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
	                    </c:when>
	                    <c:otherwise><!-- currentPage가 1일경우 (1페이지) -->
	                    	<li class="page-item disabled"><a class="page-link" href="list.fr?currentPage=${ pi.currentPage - 1 }">Previous</a></li>	                   
	                    </c:otherwise>
                	</c:choose>
                    	
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="list.fr?currentPage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    <!-- currentPage가 maxPage와 일치하면 숨기기 -->
                    <c:choose>
	                    <c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="list.fr?currentPage=${ pi.currentPage + 1 }">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.fr?currentPage=${ pi.currentPage + 1 }">Next</a></li>
	                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            
            	<!-- 삭제버튼 구현 --> 
          	<div id="deleteKey" style="float:right">
   				<a class="w-btn-pink-outline"  id="checkAll">전체선택</a>
   				<a class="w-btn-pink-outline" id="unCheckAll">전체해제</a>
   				<a class="w-btn-pink-outline"  onclick="deleteClick()">선택된 글 삭제</a>
			</div>
            
         	<div id="search-area">
					<form action="search.fr" method="get">
						<input type="hidden" name="currentPage" value="1">
						<select name="category">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="keyword" value="${keyword }">
						<button type="submit">검색</button>			
					</form>
			</div>
			
			<!-- 		category에 데이터가 있으면 -->
			<c:if test="${ not empty category }">
				<script>
					$(function(){
						$("#search-area option[value=${category}]").attr("selected",true);
					})
				</script>
			</c:if>
            <br><br>
        </div>
        <br><br>
    </div>

 	 
 	 <script>
 	$(function(){
//  		 $("#boardList>tbody>tr").click(function(){
//  			 location.href="detail.fbo?fno="+$(this).children().eq(1).text();
//  			 console.log(this);
//  		 })
 		 $(".goDetailFr").click(function(){
 			 location.href="detail.fbo?fno="+$(this).prev().text();
 			 console.log(this);
 		 })
 	})
 	

 	
 	function deleteClick(){
 		var checkBoxArr = [];

 		$("input:checkbox[name='check']:checked").each(function(){
 			checkBoxArr.push($(this).val()); //
 			console.log(checkBoxArr);
 		});
 		
 		//아래는 ajax 를 이용 
 		var delConfirm=confirm("선택된 글을 삭제하시겠습니까?");
 			
 			if(delConfirm==true){
 				$.ajax({
 					url : "deleteClickFrboard.ad",
 					data: {checkBoxArr : checkBoxArr},
 					success : function(result){
 						console.log("선택된글 삭제 통신성공");
 						console.log(result);
		 					if(result == "yes"){
		 						alert ("글 삭제 되었습니다.");
		 						$("#multiCheck").val("");
		 						location.href="list.fr";
		 					}else{
		 						alert("글 삭제 실패");
		 					}
						},
					error :function(){
						console.log("통신실패");
					}
 					
			})
		}
 	}
 	
 	 //체크박스 전체선택,전체해제
    $(document).ready(function(){
    
        $("#checkAll").click(function() {
            $("input[name=check]:checkbox").prop("checked",true); // name이 chkbox인 input 타입들의 checked값을 "true"로 바꿈
        });
        
        $("#unCheckAll").click(function() {
            $("input[name=check]:checkbox").prop("checked",false); // name이 chkbox인 input 타입들의 checked값을 "false"로 바꿈
        });
    });
 	
 	 </script>
</body>
</html>