<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

  <title>자유게시판 글작성</title>
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
  <h2></h2>
  <p></p>
  <form action="insert.frbo" method="post"  enctype="multipart/form-data" >
    <div class="form-group">
      <label for="usr">제목 </label>
      <input type="text" class="form-control" id="frtitle" name="fTitle">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <input type="text" class="form-control" id="frcontent" name="fContent">
    </div>
<!--      글번호 히든으로 넘기기 -->
<%--      <input type="hidden" name="fNo" value="${fb.get(0).fNo}">  --%>
    
<!--      유저 번호 히든으로 넘기기 -->
    <input type="hidden" name="fWriterNo" value="${loginUser.memberNo}">
    <!-- 여기는 병철이형 꺼 따라해본구간  시작 -->
    <!-- 여기는 병철이형 꺼 따라해본구간  시작 -->
    <!-- 여기는 병철이형 꺼 따라해본구간  시작 -->
    <table>
			<tr>
		        <th>첨부파일</th>
		        <td><input type="button" id="addAttachBtn" value="파일추가">최대 5개까지 가능합니다.</td>
		    </tr>
    </table>
    
    <table algin="center" id="addAttach-table"></table>
    <br>
    
    <script>
    	var idx = 1; //현재 첨부파일 몇개가 있는지 확인해서 그다음 수를 대입하려 고 
    	
    	$("#addAttachBtn").click(function(){
    		if($("#addAttach-table tr").length < 5){
    			var addAttach = "<tr>"
							+ "<th><label for='upfile"+idx+"'></label></th>"
							+"<td><input type='file' id='upfile"+idx+"' class='form-control-file border' name='upfile'></td>"
    						+"<td><a href='#this' name='delete' id='delete"+idx+"' class='btn'>삭제</a></td>";
    			$("#addAttach-table").append(addAttach)				
    		}
    		
    		$("#delete"+idx).on("click",function(e){
    			e.preventDefault();
    			fn_fileDelete($(this));
    		});
   			idx++;
   		
    	});
    		//위에 눌렀을때 이벤트 실행되서  
    	function fn_fileDelete(obj){
    		obj.parent().parent().remove();
    	}
    	
    
    </script>
    
    
  	<!-- 여기는 병철이형 꺼 따라해본구간  끝 -->
  	<!-- 여기는 병철이형 꺼 따라해본구간  끝 -->
  	<!-- 여기는 병철이형 꺼 따라해본구간  끝 -->
  	
<!-- 	<input type="file" id="upfile" class="form-control-file border" name="upfile"> -->
<!-- 	<input type="file" id="upfile" class="form-control-file border" name="upfile">	     -->
	  	
    <button type="submit" class="btn btn-primary">글 등록하기</button>
  <br><br><br> <br><br><br> <br><br><br>
  </form>
</div>




</body>
</html>
