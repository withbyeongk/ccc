<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>캐캐캐::공지사항</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
/*             background-color:rgb(233, 35, 55); */
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
        
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
        
        /*
        	- 스타일 추가할 것
        	+ tr에 hover하면 변화줄 것. 클릭할 수 있다는 걸 알게끔
        */
        #noticeList tr:hover{
        	background-color : rgb(221, 255, 255);
        }
    </style>
</head>
<body>
    
    <jsp:include page="../../common/header.jsp"/>

    <div class="content">
        <br><br><br><br><br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2 align="center;">공지사항</h2>
            <br>
            <select id="boardLimit" name="boardLimit">
            	<option value="5">5</option>
            	<option value="10" selected>10</option>
            	<option value="20">20</option>
            </select>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <a class="btn btn-secondary" style="float:right;" href="insert.no">글쓰기</a>
            <br>
            <br>
            <table id="noticeList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 페이징 변경 기능 추가하면서 list.no와 함께 주석처리 -->
	                <c:choose>
	                	<c:when test="${not empty list }">
			                <c:forEach var="n" items="${list }">
			                    <tr>
			                        <td>${n.noticeNo }</td>
			                        <td>${n.noticeTitle }</td>
			                        <td>${n.noticeWriter }</td>
			                        <td>${n.noticeCount }</td>
			                        <td>${n.noticeCreateDate }</td>
			                    </tr>
			                </c:forEach>
		                </c:when>
	                	<c:otherwise>
	                		<tr align="center">
	                			<td colspan="5" style="font-weight:bold; font-size:20px; color:purple;">조회된 게시글이 없습니다.</td>
	                		</tr>
	                	</c:otherwise>
	                </c:choose>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1 }&boardLimit=${pi.boardLimit}">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage-1 }&boardLimit=${pi.boardLimit}">Previous</a></li>
						</c:otherwise>
                	</c:choose>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"><!-- 여기에 현재 페이지 bold 처리 해야 함 -->
						<li class="page-item"><a class="page-link" style='font-weight:bold;' href="list.no?currentPage=${p}&boardLimit=${pi.boardLimit}">${p }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage != pi.endPage}">
							<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage+1}&boardLimit=${pi.boardLimit}">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
            </div>

            <br clear="both"><br>

            <br><br>
        </div>
        <br><br>

    </div>
    <script>
    	
		$("#boardLimit").change(function(){
			var boardLimit = $("#boardLimit option:selected").val();
			
			location.href="list.no?boardLimit="+boardLimit;
		});
    	
		$("#noticeList tbody tr").click(function(){
    		console.log("click");
			// 클릭한 행 가져오기 
    		var tr = $(this);
    		console.log(tr.text());
    		
    		// tr에 들어있는 정보 가져오기
    		// 순서대로 eq(0)~eq(4)까지
			var nNo = tr.find('td').eq(0).text();
			var nTitle = tr.find('td').eq(1).text();
			var nWriter = tr.find('td').eq(2).text();
			var nCount = tr.find('td').eq(3).text();
			var nCreateDate = tr.find('td').eq(4).text();
    		console.log(nNo);
    		console.log(nTitle);
    		console.log(nWriter);
    		console.log(nCount);
    		console.log(nCreateDate);
    		
    		location.href="detail.no?nno="+nNo;
    		
    	});
		
		$(function(){
			var bl = $("#boardLimit option");
			for(var i=0; i<bl.length; i++){
				var viewBl = bl.eq(i).val();
				var conBl = ${ pi.boardLimit };
// 				console.log(viewBl);
// 				console.log(conBl);
// 				console.log("---");
				if( viewBl == conBl ){
					bl.eq(i).prop('selected', true);
				}
			}
		});
    </script>

<%--     <jsp:include page="../../common/footer.jsp"/> --%>
</body>
</html>