<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>캐캐캐::공지사항</title>
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

        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp"/>

    <div class="content">
        <br><br><br><br><br><br>
        <div class="innerOuter">
            <h2>공지사항 상세보기</h2>
            <br>
            <a class="btn btn-secondary" style="float:right;" href="list.no">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${n.noticeTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${n.noticeWriter }</td>
                    <th>작성일</th>
                    <td>${n.noticeCreateDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                    <th>유형</th>
                    <td>여기 카테고리 기능 추가해야 함.${n.noticeTypeNo }</td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${n.noticeContent }</p></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"></td>
                </tr>
                <c:choose>
                	<c:when test="${not empty naList}">
                		<c:forEach var="na" items="${naList }">
                			<tr>
                				<th></th>
                				<td colspan="3"><a href="" download="">${na.noticeAttachOriginName }</a></td>
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
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" href="updateForm.no?nno=${n.noticeNo }">수정하기</a>
                <a class="btn btn-danger" href="delete.no?nno=${n.noticeNo }">삭제하기</a>
            </div>
            <br><br>

            
        </div>
        <br><br>
        <script>
//         $(function(){
//         	selectReplyList();
//         });
// 		function selectReplyList(){
// 			$.ajax({
// 				url : "selectReplyList.no",
// 				data : {nno : ${ n.noticeNo }
// 				},
// 				success : function(rlist){
// 					console.log(rlist);
// 					var str = "";
// 					for(var i in rlist){
// 						str += "<tr><td>"+rlist[i].replyNo+"</td>"
// 						+ "<td>"+rlist[i].replyContent+"</td>"
// 						+ "<td>"+rlist[i].replyWriter+"</td></tr>";
// 					}
// 					$("#replyArea>tbody").html(str);
// 					//$("#rcount").val( ${ rlist.size() } );	// 숫자 표시 안됨
// 				},
// 				error : function(){
// 					console.log("통신 실패");
// 				}
// 			})
// 		};
		
// 		function addReply(){
// 			var $vali = $("#content");
			
// 			// 공백 제거 후 댓글이 작성되었는지 확인
// 			if($vali.val()==" "){
// 				alert("공백은 입력할 수 없습니다.");
// 			}
// 			else{
// 				$.ajax({
// 					url : "insert.re",
// 					data : { refNno : ${ notice.noticeNo }
// 							,replyContent : $vali.val()
// 							,replyWriter : "${loginAdmin}"
// 					},
// 					success : function(result){
// 						console.log("insert.re 성공");
// 						if(result>0){
// 							selectReplyList();
// 							$vali.val("");
// 						}
// 						else{
// 							alert("댓글 등록 실패");
// 						}
// 					},
// 					error : function(){
// 						console.log("insert.re 실패");
// 					}
// 				});
// 			}
// 		};
	</script>

    </div>
    
<%--     <jsp:include page="../../common/footer.jsp"/> --%>
    
</body>
</html>