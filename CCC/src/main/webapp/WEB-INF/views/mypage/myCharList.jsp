<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		background:black;
		color:white;
		width:1000px;
		height:800px;
		margin:auto;  /*가운데 정렬*/
		margin-top:50px; /*위로부터 50px만큼 여백*/
	}
	.list-area{
		width:760px;
		margin:auto;
	}
	.thumbnail{
		border : 1px solid white;
		width : 220px;
		display : inline-block;
		margin : 15px;
	}
	.thumbnail:hover{
		cursor:pointer;
		opacity:0.7;
	}
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판 목록</h2>
		<br>
	
		<div class="list-area">
			<c:choose>
					<c:when test="${not empty chalist }">
						<c:forEach var="cha" items="${chalist}">
						    <div class="thumbnail" align="center">
							  <input type="hidden" value="${cha.characterNo}">
							  <img src="${cha.changeName}" width="200px" height="150px">
							  <p>
								캐릭터이름: ${cha.characterName} <br>
								캐릭터등록일: ${cha.characterCreateDate}<br>
							  </p>
						    </div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						조회된 게시글이 없습니다.
					</c:otherwise>
			 </c:choose>
		</div>
		<br>
		<br>
		<div id="buttonarea" align="center">
		   <button onclick="location.href='enrollForm.mychar'">내캐릭터 등록</button>
		   <button onclick="javascript:history.go(-1);" >마이페이지로</button>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".thumbnail").click(function(){
				location.href="chardetail.my?cNo="+$(this).children().eq(0).val();
			})
		})
	</script>

</body>
