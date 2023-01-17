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
/*             background-color:rgb(247, 245, 245); */
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
		
		.detailQBtn{
			height: 30px;
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
		
		.detailQBtn:hover{
			font-size: 13px;
			color: white;
			font-weight: bold;
			background-color: rgb(243, 131, 131);
		}
		
        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>문의게시판 상세보기</h2>
            <br>
            <button class="detailQBtn" style="float:right;" onclick="listQ();">목록으로</button>
            <br><br>
            <script>
            	function listQ(){
            		location="list.qu";
            	}
            </script>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${q.questionTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${q.questionWriter }</td>
                    <th>작성일</th>
                    <td>${q.questionCreateDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                    <th>유형</th>
                    <!-- 카테고리 기능 추가해야 함 -->
                    <td>${q.questionTypeNo }</td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${q.questionContent }</p></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"></td>
                </tr>
                <c:choose>
                	<c:when test="${not empty qaList}">
                		<c:forEach var="qa" items="${qaList }">
                			<tr>
                				<th></th>
                				<td colspan="3"><a href="" download="">${qa.questionAttachOriginName }</a></td>
                			</tr>
                		</c:forEach>
                	</c:when>
                	<c:otherwise>
                		<tr>
                			<th></th>
                			<td colspan="3">없음</td>
                		</tr>
                	</c:otherwise>
                </c:choose>
               	<tr>
               		<th>답변</th>
                	<c:choose>
                		<c:when test="${q.questionLevel eq 1 }">
	                		<td>${q.questionResponse }</td>
	                	</c:when>
	                	<c:otherwise>
	                		<td></td>
	                	</c:otherwise>
	                </c:choose>
               	</tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <c:if test="${ (not empty loginUser) and (loginUser.memberName eq q.questionWriter) }">
	                <button class="detailQBtn" onclick="updateForm();">수정하기</button>
                </c:if>
                <button class="detailQBtn" onclick="deleteQ();">삭제하기</button>
                <c:if test="${not empty loginAdmin }">
                	<button class="detailQBtn" onclick="responseForm();">답변하기</button>
                </c:if>
            </div>
            <script>
            	function updateForm(){
            		location.href="updateForm.qu?qno="+${q.questionNo }
            	}
            	function deleteQ(){
            		location.href="delete.qu?qno="+${q.questionNo }
            	}
            	function responseForm(){
            		location.href="responseForm.qu?qno="+${q.questionNo }
            	}
            </script>
            <br><br>
        </div>
    </div>
    
<%--     <jsp:include page="../../common/footer.jsp"/> --%>
    
</body>
</html>