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
   <jsp:include page="/WEB-INF/views/common/header2.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>팁 게시판</h2>
            <br>
   
            <a class="btn btn-danger" style="float:right;" href="insert.tp">글쓰기</a>
        
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr class="ct">
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <!-- <th>첨부파일</th> -->
                    </tr>
                </thead>
                <tbody>               	
       
                	<c:forEach var="B" items="${list}">
						<tr>
	                        <td>${B.tNo }</td>
	                        <td>${B.tTitle } </td>
	                        <td>${B.tWriter } </td>
	                        <td>${B.count }</td>
	                        <td>${B.tCreateDate }</td>
	                        <%-- <td>
	                        <c:if test="${not empty B.tTitleimg}">★
	                        </c:if>
	                        </td> --%>
	                    </tr>
                	</c:forEach>
           	
                    
                </tbody>
            </table>
            <br>
           <div id="pagingArea">
                <ul class="pagination">
                	<!-- currentPage가 1이면 숨기기 -->
                	<c:choose>
	                	<c:when test="${ pi.currentPage ne 1 }">
	                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
	                    </c:when>
	                    <c:otherwise><!-- currentPage가 1일경우 (1페이지) -->
	                    	<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage - 1 }">Previous</a></li>	                   
	                    </c:otherwise>
                	</c:choose>
                    	
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    <!-- currentPage가 maxPage와 일치하면 숨기기 -->
                    <c:choose>
	                    <c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">Next</a></li>
	                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <br clear="both"><br>
            <form id="searchForm" action="" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-danger">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>
    </div>

 	 
 	 <script>
	 	$(function(){
	 		 $("#boardList>tbody>tr").click(function(){
	 			 location.href="detail.tbo?bno="+$(this).children().eq(0).text();
	 			 console.log(this);
	 		 }) 	
	 	})
 	 </script>
</body>
</html>