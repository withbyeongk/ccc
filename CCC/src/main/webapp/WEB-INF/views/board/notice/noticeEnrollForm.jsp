 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
        #addAttach-area {width:100%;}
        #addAttach-area>tr {
        	background-color: lightgreen;
        }
        
    </style>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp"/>

    <div class="content">
        <br><br><br><br><br><br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
                <table algin="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${loginAdmin.aName }" name="noticeWriter" readonly></td>
                    </tr>
                    <tr>
                    	<th>공지 유형</th>
                    	<td>
                    		<select name="noticeTypeNo">
                    			<option value="1">대회</option>
                    			<option value="2">캐릭터</option>
                    			<option value="3">굿즈</option>
                    			<option value="4">기타</option>
                    		</select>
                    	</td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="noticeContent" required></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="button" id="addAttachBtn" value="파일추가">최대 5개까지 가능합니다.</td>
                    </tr>
                </table>
				<table algin="center" id="addAttach-table"></table>
                <br>
                <script>
               		var idx = 1;	// 현재 첨부파일 몇개가 있는지 확인해서 그 다음 수 대입
               		
                	$("#addAttachBtn").click(function(){
// 						console.log($("#addAttach-table tr").length);
						if($("#addAttach-table tr").length < 5){
	                		var addAttach = "<tr>"
	                					  + "<th><label for='upfile"+idx+"'></label></th>"
	                					  + "<td><input type='file' id='upfile"+idx+"' class='form-control-file border' name='multifile'></td>"
	                					  + "<td><a href='#this' name='delete' id='delete"+idx+"' class='btn'>삭제</a></td>";
	                		$("#addAttach-table").append(addAttach);
                		}
	                    
	                    $(("#delete"+idx)).on("click",function(e){
	                        e.preventDefault();
	                        fn_fileDelete($(this));
	                    });
	                    idx++;
                	});
                	
                	function fn_fileDelete(obj){
                		console.log("삭제 file idx : "+obj.parent().prev().children().attr("id"));	// id 확인
                        obj.parent().parent().remove();
                    }
                </script>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
<%--     <jsp:include page="../../common/footer.jsp"/> --%>
    
</body>
</html>