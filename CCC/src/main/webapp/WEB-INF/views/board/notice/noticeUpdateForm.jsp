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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp"/>

    <div class="content">
        <br><br><br><br><br><br>
        <div class="innerOuter">
            <h2>공지사항 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
                <table algin="center">
                    <tr>
		            	<input type="hidden" id="nno" name="noticeNo" value="${n.noticeNo }">
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${n.noticeTitle }" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${n.noticeWriter }" name="noticeWriter" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="noticeContent" required>${n.noticeContent }</textarea></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td id="na-area">
                          	현재 업로드된 파일 : <br>
                            <c:forEach var="na" items="${naList }" varStatus="var">
                            	<div>
                            	<a href="" id="" download="${na.noticeAttachChangeName }">${na.noticeAttachOriginName }</a>
                            	<input type="hidden" id="na_${var.index }" name="oldNa" value="${na.noticeAttachNo }">
                            	<input type="button" id="deleteAttachBtn_${var.index }" value="파일삭제"><br>
                            	</div>
                           	</c:forEach>
                     		새로 업로드할 파일 : <br>
                       		<input type="button" id="addAttachBtn" value="파일추가"><br>
                     		<div id="newNa-area">
                        	</div>
                        </td>
                    </tr>
                </table>
                <script>
                	for(var i=0; i<$("#na-area a").length; i++){
	                	$("#deleteAttachBtn_"+i).click(function(){
// 	               			console.log($(this).attr("id"));
							$(this).parent().remove();
	                	});
                	};
                	
                	$("#addAttachBtn").click(function(){
//                 		console.log("addAttachBtn클릭");
						if( $("#na-area a").length  < 5){
							var addAttach = "<div><input type='file' class='form-control-file border' name='multifile'><br>"
			          					  + "<a href='#this' name='delete' class='btn deleteAttachBtn'>삭제</a><br><div>";
          					$("#newNa-area").append(addAttach);
						}
	                	
	                	$(".deleteAttachBtn").click(function(){
							$(this).parent().remove();
	                	});
                	});
                	
                	
                </script>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
<%--     <jsp:include page="../../common/footer.jsp"/> --%>
    
</body>
</html>