<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>캐캐캐::문의게시판</title>
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
        
        .innerOuter button{
			font-size: 12px;
			border-radius: 3px;
			width: 110px;
			margin-bottom: 3px;
			background-color: #EA4F4D;
			color: white;
			border:0px;
			float:right;
			margin-right:30px;
		}
		
		.innerOuter button:hover{
			font-size: 13px;
			color: lightgray;
			font-weight: bold;
			background-color: rgb(243, 131, 131);
		}
    </style>
</head>
<body>
    
    <jsp:include page="../../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2 align="center;">문의게시판</h2>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${not empty loginUser}">
            	<button class="btn" onclick="insertQ();">글쓰기</button>
	            <button class="btn" onclick="mylistQ();">내 글 보기</button>
            </c:if>
            <script>
            	function insertQ(){
            		location.href="insert.qu";
            	}
            	function mylistQ(){
            		location.href="mylist.qu";
            	}
            </script>
            <!-- 관리자 로그인 시에만 보이는 체크박스 -->
            <c:if test="${ not empty loginAdmin }">
              	<button type="button" id="deleteChk" class="btn btn-secondary" style="float:right; margin-right:30px;">그룹 글삭제</button>
        	</c:if>
            <br>
            <br>
            <table id="questionList" class="table table-hover" align="center">
                <thead>
                    <tr align="center">
                    	<c:if test="${ not empty loginAdmin }">
                    		<th><input type="checkbox" id="allChkBtn"></th>
                    	</c:if>
                        <th>글번호</th>
                        <th>답변</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
	                <c:choose>
	                	<c:when test="${not empty list }">
			                <c:forEach var="q" items="${list }">
			                    <tr align="center">
		                    		<c:if test="${ not empty loginAdmin }">
				                    	<td>
				                    		<input type="checkbox" class="chkBtn">
				                    	</td>
		                    		</c:if>
			                        <td>${q.questionNo }</td>
			                        <td>
			                        	<!-- 답변이 되면 (LEVEL이 1) 답변 완료 표시 -->
			                        	<c:if test="${q.questionLevel eq 1 }">
			                        		[답변 완료]
			                        	</c:if>
			                        </td>
			                        
			                        <td>
			                        	<!-- 관리자이거나 글쓴이만 상세글을 볼 수 있도록 처리 -->
			                        	<c:choose>
				                        	<c:when test="${ (not empty loginAdmin) or (loginUser.memberName eq q.questionWriter)}">
		                        				<a href="detail.qu?qno=${q.questionNo}" style="color:black;">${q.questionTitle }</a>
			                        		</c:when>
			                        		<c:otherwise>
			                        			${q.questionTitle }
			                        		</c:otherwise>
			                        	</c:choose>
			                        </td>
			                        <td>${q.questionWriter }</td>
			                        <td>${q.questionCount }</td>
			                        <td>${q.questionCreateDate }</td>
			                    </tr>
			                </c:forEach>
		                </c:when>
	                	<c:otherwise>
	                		<tr align="center">
	                			<td colspan="6" style="font-weight:bold; font-size:20px; color:purple;">조회된 게시글이 없습니다.</td>
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
							<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1 }">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="list.qu?currentPage=${pi.currentPage-1 }">Previous</a></li>
						</c:otherwise>
                	</c:choose>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"><!-- 여기에 현재 페이지 bold 처리 해야 함 -->
						<li class="page-item"><a class="page-link" style='font-weight:bold;' href="list.qu?currentPage=${p}">${p }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage != pi.endPage}">
							<li class="page-item"><a class="page-link" href="list.qu?currentPage=${pi.currentPage+1 }">Next</a></li>
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
    	// 삭제할 코드. 클릭시 이동하는 코드 바꿈 
    	$("#questionList tbody tr").click(function(){
			// 클릭한 행 가져오기 
    		var tr = $(this);
//     		console.log(tr.text());
    		
    		// tr에 들어있는 정보 가져오기
    		// 순서대로 eq(0)~eq(4)까지
			var qNo = tr.find('td').eq(0).text();
			var qTitle = tr.find('td').eq(1).text();
			var qWriter = tr.find('td').eq(2).text();
			var qCount = tr.find('td').eq(3).text();
			var qCreateDate = tr.find('td').eq(4).text();
//     		console.log(qNo);
//     		console.log(qTitle);
//     		console.log(qWriter);
//     		console.log(qCount);
//     		console.log(qCreateDate);
    		
//     		location.href="detail.qu?qno="+qNo;
    		
    	});
    	
    	// 전체 선택, 전체 선택 해제
    	$("#allChkBtn").click(function(){
    		var isChecked = $("#allChkBtn").is(":checked");
    		var trArr = $("#questionList tbody tr");
    		
    		if(isChecked){
	    		$(trArr).find(':checkbox').prop("checked", true);
    		}
    		else{
    			$(trArr).find(":checkbox").prop("checked", false);
    		}
    	});
    	
    	$("#deleteChk").click(function(){

			var trArr = $("#questionList tbody tr");
// 			console.log("trArr : \n " + trArr);
// 			console.log("길이 : " + trArr.length);
// 			var temp = trArr.eq(0).find(':checkbox').parent().next().text();
// 			console.log(temp);			


			// 체크된 번호를 담아서 전달할 배열
			let chkArr = new Array();
			
			trArr.each(function (index, item){
				// index는 0부터 시작함
				var chkbox = $(item).find(":checkbox");
				var isChecked = chkbox.is(":checked");
				
				if(isChecked){
					console.log("체크O : " + index);
					var bno = chkbox.parent().next().text();
					console.log("bno : " + bno);
					chkArr.push(bno);
				}
			});
			console.log("삭제 글 리스트 : " + chkArr);
			if(chkArr.length==0){
				console.log("길이 : " + chkArr.length);
				window.alert("선택된 상품이 없습니다.");
			}
			else{
				location.href="deleteGroup.qu?chkArr="+chkArr;
			}
			
    	});
    </script>

<%--     <jsp:include page="../../common/footer.jsp"/> --%>
</body>
</html>