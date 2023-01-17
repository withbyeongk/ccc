<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐릭터 게시판 게시글 수정 페이지</title>
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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="content">
        <br><br><br><br><br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.ch" enctype="multipart/form-data">
            	<input type="hidden" name="boardNo" value="${ cb.boardNo }">
            	<input type="hidden" name="charNo" value="${ cb.charNo }">
                <table algin="center">
                    <tr>
		            	<!-- 글번호 히든으로 넘기기 -->
                        <th><label for="boardTitle">제목</label></th>
                        <td><input type="text" id="boardTitle" class="form-control" value="${ cb.boardTitle }" name="boardTitle"></td>
                    </tr>
                    <tr>
                        <th><label for="charName">캐릭터 이름</label></th>
                        <td><input type="text" id="charName" class="form-control" value="${ cb.charName }" name="charName"></td>
                    </tr>
                    <tr>
                        <th><label for="boardWriterName">작성자</label></th>
                        <td><input type="text" id="boardWriterName" class="form-control" value="${ cb.boardWriterName }" name="boardWriterName" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="boardContent">캐릭터 설명</label></th>
                        <td><textarea id="boardContent" class="form-control" rows="10" style="resize:none;" name="boardContent">${ cb.boardContent }</textarea></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td id="ca-area">
                        	현재 업로드된 파일 :
                        	<br>
                       			<c:forEach var="ca" items="${ caList }" varStatus="var">	
                       				<div>
			                    		<a href="${ ca.originName }" download="${ ca.originName }">${ var.index +1 }번째 첨부파일 : ${ ca.originName }</a>
			                    		<input type="hidden" id="ca_${ var.index }" name="oldCa" value="${ ca.level }">                     												
			                    		<input type="button" id="deleteAttachBtn_${ var.index }" value="파일삭제"><br>                   												
                       				</div>
                       			</c:forEach>
                        	새로 업로드할 파일 :
                        	<br>
                        	<div id="newCa-area">
                        		<input type="button" id="addAttachBtn" value="파일추가"><br>
                        	</div>
                        </td>
                    </tr>
                </table>
                <br>
                
                <script>
                	//해당 페이지가 실행되면 첨부파일의 개수를 체크
					$(document).ready(function(){
						if( $("#ca-area a").length == 4 ){
                			$("#addAttachBtn").attr("value","추가불가");
                		}
					});
                
                	//기존 업로드된 파일의 이름을 지워주는 메소드
                	//id=ca-area안의 a태그 수만큼 반복하는 반복문
	                for(var i=0; i<$("#ca-area a").length; i++){
	                	//현재 업로드된 파일의 id에 인덱스로 번호를 붙여 해당 파일의 버튼을 클릭했을 때 실행되는 메소드 ()
	                	$("#deleteAttachBtn_"+i).click(function(){
// 	              			console.log( $(this).attr("id") );
							//클릭된 요소 button(id=deleteAttachBtn_인덱스번호)의 부모요소 div영역을 지워준다.
							//바로위에 hidden요소로 controller에 파일의 고유 번호(level)를 보낸다.
	              			$(this).parent().remove();
							
	              			if( $("#ca-area a").length < 4){
	                			$("#addAttachBtn").attr("value","파일추가");
	                		}else{
	                			$("#addAttachBtn").attr("value","추가불가");
	                		}
	              			
	                	});
	            	}
	            	
	            	var idx = 1; //삭제 버튼의 인덱스를 부여하는 변수
	            	//파일추가 버튼을 누르면 실행되는 메소드
                	$("#addAttachBtn").click(function(){
                		//id=ca-area안의 a태그 수만큼 반복하는 반복문 (첨부파일 총 개수가 4개보다 적으면 파일첨부 버튼 생성)
						if( $("#ca-area a").length < 4 ){
							
							var addAttach = "<div><label for='upfile'></label><br>"
			          					  + ($("#ca-area a").length+1)+"번째 첨부파일"+"<input type='file' id='upfile' class='form-control-file border' name='multifile'><br>"
			          					  + "<a href='#this' name='delete' id='deleteNewAttachBtn"+idx+"' class='btn'>삭제</a><div><br>";
          					$("#newCa-area").append(addAttach);
							
          					//첨부파일의 총 개수(기존 첨부파일 포함)가 4개(최대개수)에 도달하면 추가불가 버튼으로 변경
							if( $("#ca-area a").length == 4 ){
								$("#addAttachBtn").attr("value","추가불가");
								$("#addAttachBtn").css("disabled","disabled");
							}
						}
		            	$(("#deleteNewAttachBtn"+idx)).on("click",function(){
							$(this).parent().remove();
							
							//첨부파일의 총 개수(기존 첨부파일 포함)가 4개 이하라면 파일추가 버튼으로 변경
							if( $("#ca-area a").length < 4 ){
								$("#addAttachBtn").attr("value","파일추가");
							}
						})
						idx++;
                	});
                </script>

                <div align="center">
                    <button type="button" class="btn btn-primary" onclick="return badLanguage();">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>
        
    </div>
    
    <script>
   		let checkFile = $("#upfile").val();
   		let checkTitle = $("#boardTitle").val();
   		let checkCharName = $("#charName").val();
   		let checkContent = $("#boardContent").val();
   		
   		//게시글 제목,캐릭터 이름,게시글 내용,첨부파일이 작성되었는지 체크
   		function badLanguage(){
    		
    		//첨부파일 개수 체크
    		if($("#ca-area a").length == 0){
    			alert("첨부파일은 한개 이상 등록해주셔야 합니다.");
    			return false;
    		}
    		
    		//게시글 내용 체크
    		if( !checkTitle ){
    			alert("게시글 제목을 입력해 주세요!");
    			return false;
    		}else if( !checkCharName ){
    			alert("캐릭터 이름도 지어주세요!");    			
    			return false;
    		}else if( !checkContent ){
    			alert("게시글 내용을 입력해 주세요!");
    			return false;
    		}
    		
    		//금지어 필터링
    		$.ajax({
    			url : "badLanguage.ch",
    			data : {
    				boardTitle : checkTitle,
    				charName : checkCharName,
    				boardContent : checkContent
    			},
    			success : function(result){
    				
    				console.log(result);
    				
    				if(result == "NNNNY"){ //비속어가 있는 경우
	    				alert("비속어가 있어요! 다시 입력해주세요!");
	    				$("#boardTitle").val("");
	    				$("#charName").val("");
	    				$("#boardContent").val("");
	    				
	    				return false;
	    				
    				}else if( result == "NNNNN" ){ //비속어가 없는 경우
			    		//최종 수정 컨펌
			    		let updateResult = confirm("게시글을 수정하시겠습니까?");
    				
    					console.log(updateResult);
    					
			    		if(updateResult){
			    			$("#updateForm").submit();
			    		}else{
			    			return false;
			    		}
    				}
    			},
    			error : function(){
    				console.log("통신실패..");    				
    			}
    		})	
    		
    	}
    </script>
    
    <br><br><br>
    
</body>
</html>