<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>자유게시판 수정하기</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
:root {
  --bgColor: #3a3a3a;
  --hoverBg: #616161;
  --text: #bbb;
}

.container {
  width: clamp(0px, 100%, 512px);
  margin: 32px auto;
  text-align: center;
}

.label {
  width: 100%;
  height: 100%;
  margin: 0px auto;
  cursor: pointer;
  background-color: var(--bgColor);
}

.inner {
  width: 100%;
  height: 128px
  margin: 64px auto;
  border-radius: 8px;
  font-size: 16px;
  line-height: 128px;
  background-color: var(--bgColor);
  color: var(--text);
}

@media (any-hover: hover){
  .inner:hover{
    background-color: var(--hoverBg);
  }
}

.label--hover{
  background-color: var(--hoverBg);
}

.preview-title{
  font-size: 32px;
  margin-bottom: 8px;
}

.preview {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  padding: 16px;
  margin-bottom: 16px;
  border-radius: 8px;
  align-items: center;
  background-color: var(--bgColor);
}

.embed-img{
  width: 100%;
  height: 128px;
  object-position: center;
  object-fit: cover;
  border-radius: 8px;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <br><br><br><br><br><br>
<div class="container">
  <h1>자유게시판 수정하는곳이다아</h1>
  <p></p>
  
  
  <form action="update.frboen" method="post"  enctype="multipart/form-data" >
    <div class="form-group">
     
      <label for="usr">수정할제목 </label>
      <input type="text" class="form-control" id="fTitle" name="fTitle" value=" ${fb.get(0).fTitle}">
    </div>
    <!-- 글번호 히든으로 넘기기 -->
    <input type="hidden" name="fNo" value="${fb.get(0).fNo}">
    
    
    <div class="form-group">
    	
      <label for="content">수정할 내용을 입력하세요  </label>
      <input type="text" class="form-control" id="frcontent" name="fContent" value="${fb.get(0).fContent }">
    </div>

<%--   		<input type="hidden" name="originName" value="${frba.faOrginName}"> --%>
<%--     	<input type="hidden" name="changeName" value="${frba.faChangeName}"> --%>
    				
	<input type="file" id="upfile" class="form-control-file border" name="upfile">
	<input type="file" id="upfile" class="form-control-file border" name="upfile">	   
	<input type="file" id="upfile" class="form-control-file border" name="upfile">
	<input type="file" id="upfile" class="form-control-file border" name="upfile">	
	<input type="file" id="upfile" class="form-control-file border" name="upfile">
	
	<!-- 아래는 병철이형 버전으로 진행하기 !!!! -->
	<!-- 아래는 병철이형 버전으로 진행하기 !!!! -->
	<!-- 아래는 병철이형 버전으로 진행하기 !!!! -->
	<!-- 아래는 병철이형 버전으로 진행하기 !!!! -->
	<br><br><br>
	<table algin="center">
		<tr>
			<th><label for="upfile">첨부파일</label></th>
			<td id="na-area">
			현재 업로드된 파일 :
			<br>
			                <c:forEach var="fr" items="${frba }" varStatus="var">
	           			   	   	<div>
	                            	<a href="" id="" download="${fr.faChangeName }">${fr.faOrginName }</a>
<%-- 	                            	<input type="hidden" id="na_${var.index }" name="oldNa" value="${fr.faNo }"> --%>
	                            	<input type="button" id="deleteAttachBtn_${var.index }" value="파일삭제"><br>
                            	</div>
                           	</c:forEach>
                           	<br><br><br>
                           	
                           	새로 업로드할 파일 : <br>
							<input type="button" id="addAttachBtn" value="파일추가" disabled><br>
		      				<div id="newNa-area" name="upfile">   </div>
	        </td>
		</tr>
	 </table> 	
	 
	 
	<!-- 위에는는 병철이형 버전으로 진행하기 !!!!-->
	<!-- 위에는 병철이형 버전으로 진행하기 !!!! -->
	<!-- ㅇ ㅟ에는 병철이형 버전으로 진행하기 !!!!-->
	<!-- 위에는 병철이형 버전으로 진행하기 !!!!  -->
	
  <br><br><br> <br><br><br> <br><br><br>
	
    <button type="submit" class="btn btn-primary">글 수정하기</button>
  </form>
	</div>
	<script>
		 <!--바로아래는  파일추가 버튼 클릭했을때  -->
		 for(var i=0; i<$("#na-area a").length; i++){
		 	$("#deleteAttachBtn_"+i).click(function(){
		// 			console.log($(this).attr("id"));
					$(this).parent().remove();
		 	});
		};
			
			$("#addAttachBtn").click(function(){
		//		console.log("addAttachBtn클릭");
		
				if( $("#na-area a").length  < 6){
					var addAttach = "<div><input type='file' class='form-control-file border' name='multifile'><br>"
		   					  + "<a href='#this' name='delete' class='btn deleteAttachBtn'>삭제</a><br><div>";
					$("#newNa-area").append(addAttach);
				}
		 	
		 	$(".deleteAttachBtn").click(function(){
					$(this).parent().remove();
		 	});
		});
		
	
	
	</script>


</body>
</html>
