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
        
        .responseQ{
			font-size: 12px;
			height: 30px;
			border-radius: 3px;
			width: 110px;
			margin-bottom: 3px;
			background-color: #EA4F4D;
			color: white;
			border:0px;
			float:right;
			margin-right:30px;
		}
		
		.responseQ:hover{
			font-size: 13px;
			color: lightgray;
			font-weight: bold;
			background-color: rgb(243, 131, 131);
		}

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>문의글 답변하기</h2>
            <br>

            <form id="responseForm" method="post" action="response.qu">
                <table algin="center" style="width:100%;">
                    <tr>
		            	<input type="hidden" id="qno" name="questionNo" value="${q.questionNo }">
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${q.questionTitle }" name="questionTitle" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${q.questionWriter }" name="questionWriter" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="questionContent" readonly>${q.questionContent }</textarea></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td id="qa-area">
                          	현재 업로드된 파일 : <br>
                            <c:forEach var="qa" items="${qaList }" varStatus="var">
                            	<div>
                            	<a href="" id="" download="${qa.questionAttachChangeName }">${qa.questionAttachOriginName }</a>
                            	<input type="hidden" id="qa_${var.index }" name="oldQa" value="${qa.questionAttachNo }">
                            	<button type="button" class="responseQ" id="deleteAttachBtn_${var.index }" value="파일삭제"></button><br>
                            	</div>
                           	</c:forEach>
                        </td>
                    </tr>
                    <tr>
                    	<th><label for="response">답변</label></th>
                    	<td><textarea id="response" class="form-control" rows="10" style="resize:none;" name="questionResponse" required>${q.questionResponse }</textarea></td>
                    </tr>
                </table>
                <script>
                	for(var i=0; i<$("#qa-area a").length; i++){
	                	$("#deleteAttachBtn_"+i).click(function(){
// 	               			console.log($(this).attr("id"));
							$(this).parent().remove();
	                	});
                	};
                	
                	var idx = 0;
                	$("#addAttachBtn").click(function(){
//                 		console.log("addAttachBtn클릭");
						if( $("#qa-area a").length  < 5){
							var addAttach = "<label for='upfile"+idx+"'></label><br>"
			          					  + "<input type='file' id='upfile"+idx+"' class='form-control-file border' name='multifile'><br>"
			          					  + "<a href='#this' name='delete' id='deleteAttachBtn' class='btn'>삭제</a><br>";
         					$("#newQa-area").append(addAttach);
//           				console.log("조건문"+($("#qa-area a").length +idx));
          					idx++;
						}
                	});
                	
                	$("#deleteAttachBtn").click(function(){
//	               		console.log($(this).attr("id"));
						$(this).parent().remove();
                	});
                	
                	
                </script>
                <br>

                <div align="center">
                    <button type="submit" class="responseQ">답변하기</button>
                    <button type="button" class="responseQ" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
<%--     <jsp:include page="../../common/footer.jsp"/> --%>
    
</body>
</html>