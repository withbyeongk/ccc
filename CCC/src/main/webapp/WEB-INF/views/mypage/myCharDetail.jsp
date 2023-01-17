<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

.outer {
		background: black;
		color: white;
		width: 1000px;
		margin: auto;
		/*가운데 정렬*/
		margin-top: 50px;
		/*위로부터 50px만큼 여백*/
	}

</style>

</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/> 
   <div class="outer">
   <h3>특정캐릭터 상세보기</h3>
   <table align="center">
   <tr>
      <th>캐릭터명</th>
      <td>${cha.characterName}</td>
   </tr>
   <tr>
      <th>캐릭터내용</th>
      <td>${cha.characterContent}</td>
   </tr>

    <tr>
    <c:choose>
	    <c:when test="${not empty mchalist }">
		    <td colspan="3">
		   
				    <c:forEach var="mca" items="${ mchalist }">

				   		 <img src="${mca.changeName}" download="${ mca.originName }" width="150" height="120"></a>
				    </c:forEach>
		    </td>
	    </c:when>
	    <c:otherwise>
		    <td colspan="3">
		      조회된 첨부파일이 없습니다.
		    </td>
	    </c:otherwise>
    </c:choose>
   </tr>
   </table>
   </div>   
   
   <br><br><br>
   <div class="buttonArea" align="center">
     <button onclick="location.href='updateForm.my?cNo='+${cha.characterNo}">수정</button>
     <button onclick="location.href='delete.my?cNo='+${cha.characterNo}">삭제</button>
     <button onclick="location.href='list.mychar'">목록</button>
   </div>

</body>
</html>