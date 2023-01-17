<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
            width:100%;
            margin:auto;
            padding:5% 5%;
            background-color:white;
        }
       .attitle { 
	        position: relative;   
			overflow: hidden; 
			width: 200px; 
			height: 300px; 
			background-color: #e0e0e0; 
       } 
 
	    img {
		    max-width: 100%;
			width: auto;
		}
		
        table * {margin:5px;}
        table {width:100%;}
		
        
    </style>
</head>
<body>
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br><br><br><br><br><br>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>자유게시글 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="${ pageContext.request.contextPath }">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
       
           	<c:forEach var="F" items="${fb}" >
                <tr>
                    <th width="10">제목</th>
                    <td colspan="3">${F.fTitle}</td>
                
                </tr>

                <tr>
                    <th>작성자</th>
                    <td>${F.mId }</td>
                    <th>작성일</th>
                    <td>${F.fCreateDate }</td>
                </tr>
               
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${F.fContent }</p></td>
                </tr>
           </c:forEach>
      
                <tr>
                	<th>이미지</th>
                	<td colspan="3"></td>
                </tr>
			<!--frba list가  0 이면  -->
		 <c:if test="${frba.size()==0}">
   			 	비어있음
       	 </c:if>
       	 
       	 
       	 
 			<!-- 아래는 frba list가  1이면  -->
          <c:if test="${frba.size()==1}">
		    	<c:choose>
                	<c:when test="${!frba.get(0).faChangeName.isEmpty()}">
         	              <tr>
			              	<td class="attitle">
			               		<p style="height:150px;">
			               			<input type="checkbox" name="all"><img src="${frba.get(0).faChangeName }" >
			               		</p>
			              	</td>
			              </tr>
	              	</c:when>
	          	</c:choose>
          </c:if> 	
          
          
          
   	<!-- 아래는 frba list가  1이면  -->
        <c:if test="${frba.size()==2}">
		    	<c:choose>
                	<c:when test="${!frba.get(0).faChangeName.isEmpty()}">
         	              <tr>
			              	<td class="attitle">
			            		  	<input type="checkbox" name="all" onclick='selectAll(this)'/>전체선택 <br>
			               		<p style="height:150px;">
			               			<input type="checkbox" name="all"><img src="${frba.get(0).faChangeName }">
			               		</p>
			              	</td>
			              </tr>
	              	</c:when>
	          	</c:choose>
	          
         	<c:if test="${!frba.get(1).faChangeName.isEmpty() }">
			               <tr>
			                	<td class="attitle">
			                		<p style="height:150px;">
			                			<input type="checkbox" name="all"><img src="${frba.get(1).faChangeName }">
			                		</p>
			                	</td>
			                </tr>
	          	</c:if>
          </c:if> 	

	         
	       <!-- 아래는 이미지 3개일때  -->  
	        <c:if test="${frba.size()==3}">
		    	<c:choose>
                	<c:when test="${!frba.get(0).faChangeName.isEmpty()}">
         	              <tr>
			              	<td class="attitle">
			            		  	<input type="checkbox" name="all" onclick='selectAll(this)'/>전체선택 <br>
			               		<p style="height:150px;">
			               			<input type="checkbox" name="all"><img src="${frba.get(0).faChangeName }">
			               		</p>
			              	</td>
			              </tr>
	              	</c:when>
	          	</c:choose>
	          
         	<c:if test="${!frba.get(1).faChangeName.isEmpty() }">
			               <tr>
			                	<td class="attitle">
			                		<p style="height:150px;">
			                			<input type="checkbox" name="all"><img src="${frba.get(1).faChangeName }">
			                		</p>
			                	</td>
			                </tr>
	          	</c:if>
	          	<c:if test="${!frba.get(2).faChangeName.isEmpty() }">
				               <tr>
				                	<td class="attitle">
				                		<p style="height:150px;">
				                			<input type="checkbox" name="all"><img src="${frba.get(2).faChangeName }">
				                		</p>
				                	</td>
				                </tr>
	          	</c:if>
          </c:if> 	
        	
	       <!-- 아래는 이미지 4개일때  -->  
	    
	        <c:if test="${frba.size()==4}">
		    	<c:choose>
                	<c:when test="${!frba.get(0).faChangeName.isEmpty()}">
         	              <tr>
			              	<td class="attitle">
			            		  	<input type="checkbox" name="all" onclick='selectAll(this)'/>전체선택 <br>
			               		<p style="height:150px;">
			               			<input type="checkbox" name="all"><img src="${frba.get(0).faChangeName }">
			               		</p>
			              	</td>
			              </tr>
	              	</c:when>
	          	</c:choose>
	          
         	<c:if test="${!frba.get(1).faChangeName.isEmpty() }">
			               <tr>
			                	<td class="attitle">
			                		<p style="height:150px;">
			                			<input type="checkbox" name="all"><img src="${frba.get(1).faChangeName }">
			                		</p>
			                	</td>
			                </tr>
	          	</c:if>
	          	<c:if test="${!frba.get(2).faChangeName.isEmpty() }">
				               <tr>
				                	<td class="attitle">
				                		<p style="height:150px;">
				                			<input type="checkbox" name="all"><img src="${frba.get(2).faChangeName }">
				                		</p>
				                	</td>
				                </tr>
	          	</c:if>
	          	
	          	<c:if test="${!frba.get(3).faChangeName.isEmpty() }">
				               <tr>
				                	<td class="attitle">
				                		<p style="height:150px;">
				                			<input type="checkbox" name="all"><img src="${frba.get(3).faChangeName }">
				                		</p>
				                	</td>
				                </tr>
	          	</c:if>
          </c:if> 	 
	         
	      <!--  이미지 5개 일때  -->   
	       <c:if test="${frba.size()==5}">
		    	<c:choose>
                	<c:when test="${!frba.get(0).faChangeName.isEmpty()}">
         	              <tr>
			              	<td class="attitle">
			            		  	<input type="checkbox" name="all" onclick='selectAll(this)'/>전체선택 <br>
			               		<p style="height:150px;">
			               			<input type="checkbox" name="all"><img src="${frba.get(0).faChangeName }">
			               		</p>
			              	</td>
			              </tr>
	              	</c:when>
	          	</c:choose>
	          
       	 	<c:if test="${!frba.get(1).faChangeName.isEmpty() }">
			               <tr>
			                	<td class="attitle">
			                		<p style="height:150px;">
			                			<input type="checkbox" name="all"><img src="${frba.get(1).faChangeName }">
			                		</p>
			                	</td>
			                </tr>
	          	</c:if>
	          	<c:if test="${!frba.get(2).faChangeName.isEmpty() }">
				               <tr>
				                	<td class="attitle">
				                		<p style="height:150px;">
				                			<input type="checkbox" name="all"><img src="${frba.get(2).faChangeName }">
				                		</p>
				                	</td>
				                </tr>
	          	</c:if>
	          	
	          	<c:if test="${!frba.get(3).faChangeName.isEmpty() }">
				               <tr>
				                	<td class="attitle">
				                		<p style="height:150px;">
				                			<input type="checkbox" name="all"><img src="${frba.get(3).faChangeName }">
				                		</p>
				                	</td>
				                </tr>
	          	</c:if>
          	 	<c:if test="${!frba.get(4).faChangeName.isEmpty() }">
			               <tr>
			                	<td class="attitle">
			                		<p style="height:150px;">
			                			<input type="checkbox" name="all"><img src="${frba.get(4).faChangeName }">
			                		</p>
			                	</td>
			                </tr>
          		</c:if>
          </c:if> 	   
	         
                 <tr>
                    <th>첨부파일</th>
              	      <td colspan="3">
	          			<br>
				   			<c:if test="${frba.size()==0}">
				   			 	비어있음
				         	 </c:if>
   			 				<!-- 파일 1개일때  -->
		          			 <c:if test="${frba.size()==1}">
				  			 	<c:choose>
				                	<c:when test="${!frba.get(0).faOrginName.isEmpty()}">
					                        <a href="${frba.get(0).faChangeName }" download="${frba.get(0).faOrginName}">${frba.get(0).faOrginName}</a><br><br>
				               	 	</c:when>
					          	</c:choose>
				          	</c:if>
							<!-- 파일 2개일때  -->
				          	<c:if test="${frba.size()==2}">
				               	<c:if test="${!frba.get(1).faOrginName.isEmpty() }">
				               			<a href="${frba.get(0).faChangeName }" download="${frba.get(0).faOrginName}">${frba.get(0).faOrginName}</a><br><br>
				       
			                 			<a href="${frba.get(1).faChangeName }" download="${frba.get(1).faOrginName}">${frba.get(1).faOrginName}</a>
				               	</c:if>
			               	</c:if>
      						
      						<!-- 파일 3개일때  -->
      						<c:if test="${frba.size()==3}">
				               	<c:if test="${!frba.get(1).faOrginName.isEmpty() }">
				               			<a href="${frba.get(0).faChangeName }" download="${frba.get(0).faOrginName}">${frba.get(0).faOrginName}</a><br><br>
			                 			<a href="${frba.get(1).faChangeName }" download="${frba.get(1).faOrginName}">${frba.get(1).faOrginName}</a>
			                 			<a href="${frba.get(2).faChangeName }" download="${frba.get(2).faOrginName}">${frba.get(2).faOrginName}</a>
				               	</c:if>
			               	</c:if>
			               	
			               	<!-- 파일 4개일때  -->
      						<c:if test="${frba.size()==4}">
				               	<c:if test="${!frba.get(1).faOrginName.isEmpty() }">
				               			<a href="${frba.get(0).faChangeName }" download="${frba.get(0).faOrginName}">${frba.get(0).faOrginName}</a><br><br>
			                 			<a href="${frba.get(1).faChangeName }" download="${frba.get(1).faOrginName}">${frba.get(1).faOrginName}</a>
			                 			<a href="${frba.get(2).faChangeName }" download="${frba.get(2).faOrginName}">${frba.get(2).faOrginName}</a>
				               			<a href="${frba.get(3).faChangeName }" download="${frba.get(3).faOrginName}">${frba.get(3).faOrginName}</a>
				               	
				               	</c:if>
			               	</c:if>
			               	
			               	
			               		<!-- 파일 5개일때  -->
      						<c:if test="${frba.size()==5}">
				               	<c:if test="${!frba.get(1).faOrginName.isEmpty() }">
				               			<a href="${frba.get(0).faChangeName }" download="${frba.get(0).faOrginName}">${frba.get(0).faOrginName}</a><br><br>
			                 			<a href="${frba.get(1).faChangeName }" download="${frba.get(1).faOrginName}">${frba.get(1).faOrginName}</a>
			                 			<a href="${frba.get(2).faChangeName }" download="${frba.get(2).faOrginName}">${frba.get(2).faOrginName}</a>
   			                 			<a href="${frba.get(3).faChangeName }" download="${frba.get(3).faOrginName}">${frba.get(3).faOrginName}</a>
   			                 			<a href="${frba.get(4).faChangeName }" download="${frba.get(4).faOrginName}">${frba.get(4).faOrginName}</a>
				               
				               	</c:if>
			               	</c:if>
			               	
			               	
			               	
			               	
			               	
			               	
	                    </td>
	                </tr>
      
            </table>
            <br>
            <hr>
            <!--아래는 로그인 유저의 아이디가 글작성자와 일치한다면 수정하기 삭제하기 버튼이 보이게 끔 !  -->
	         <div align="center" border="1">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
<%--                 <c:if test="${ loginUser.memberNo eq fb. fWriterNo }"> --%>
	                <a class="btn btn-primary" onclick="postFormSubmit1();">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit2();">삭제하기</a>
<%--                 </c:if> --%>
            </div>
            <br><br>
            
            <form id="postForm" method="post">
            	<input type="hidden" name="fno" value="${fb.get(0).fNo }">
            		<!-- 아래는 만약 첨부파일이 있다면  파일패스 가져가서 글 삭제할때 파일도 동시에 삭제 -->
            		<c:if test="${frba.size()>0}">
             			<input type="hidden" name="filePath" value="${frba.get(0).faChangeName}">
            		</c:if>
            </form>
      </div>
      <!-- 
		<!--아래는 댓글 -->
            <table id="replyArea" class="table" align="center">
                <thead>
		              	<tr>
	                        <th colspan="2">
	                            <textarea class="form-control" name="rcontent" id="rcontent" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
	                        </th>
	                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addFrReply();">등록하기</button></th>
	                	</tr>

		   
  
	          	        <tr>
	                       <td colspan="3" > 댓글(<span id="rcount"></span>)</td>
	                    </tr>
	                    <tr>   
	                     <td  rowspan="1" ><b>댓글번호</b></td>
	                  
	                       <td rowspan="1" ><b>내용</b></td>
	                  
 	                       <td rowspan="1" ><b>아이디</b></td> 
	                       
                   		   <td rowspan="1" ><b>날짜</b></td>
	                    </tr>
	                  
	                  
                </thead>
                
                <tbody>
       						
                </tbody>
                
                
            </table>
            
   <!-- 댓글 수정 모달 -->
		<div class="modal fade" id="updateReply" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">댓글 수정 내용을 입력해주세요!</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<textarea id="frContent" rows="2" cols="49.8"
									style="resize: none;"></textarea>
					<div id="reply_cnt">(0 / 10)</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="UpdateReply();">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
   
   </div>
   

   <!-- 아래는 대댓글 모달 -->

   
     <script >
	//아래부분  위에서  주석처리해놨음 
// 	     function postFormSubmit(num){
// 				console.log(num);
// 			//action에 속성값을 넣고 submit을 진행하면 된다.
// 	 		if(num ==1){ //수정하기 버튼 클릭시 1이 넘어온다
// 	     		$("#postForm").attr("action","update.frbo").submit();
// 	 		}else{ //삭제하기 버튼 클릭시 
// 	 			$("#postForm").attr("action","delete.frbo").submit();
// 	 		}
// 	 	}
	// 아래는 수정하기 
	function postFormSubmit1(){
		console.log("수정버튼 눌렀나..?");
		$("#postForm").attr("action","update.frbo").submit();
	}
	//아래는 삭제하기 
	function postFormSubmit2(){
		console.log("삭제버튼 눌렀나..?");
		$("#postForm").attr("action","delete.frbo").submit();
	}
	    
	     //아래는 댓글
	   let frReUpdateNo;  
	     
	   $(function(){
    		selectReplyList(); //dom 요소 생성 후 맨처음에(페이지 구성될때 댓글리스트 조회해오기) 
    	})
    	
    	$(document).on("click","table #frReUpdateNo",function(){
    		frReUpdateNo = $(this).val();
    	})
    	
    	
		//댓글 조회 함수    	
    	function selectReplyList(){
    		$.ajax({
    			url :"frlist.fbo",
    			data : {fno : ${fb.get(0).fNo}},
    			success : function(result){
    				console.log("댓글조회되나");
					var resultStr = "";
					
					for(var i=0; i<result.length; i++){
						resultStr += 
									"<tr>"
									+"<th>"+result[i].frNo+"</th>"
									+"<td>"+result[i].frContent+"</td>"
  									+"<td>"+result[i].mId+"</td>"
									+"<td>"+result[i].frCreateDate+"</td>"	
									+"<td>"
									+ "<button class='btn btn-outline-primary' data-toggle='modal' data-target='#updateReply'" //data-target을 사용하면 뒤에오는 값을 사용한
      							    + "id='frReUpdateNo' value=+"+result[i].frNo+">수정</button>"
      							 	+ "<button onclick='return deleteReply("+result[i].frNo+")' class='btn btn-outline-danger'>삭제</button></td>"     							   
									+"</tr>";
							}	
					
					$("#replyArea > tbody").html(resultStr);
					$("#rcount").text(result.length);
	    			},
    			error :function(){
   				console.log("통신 실패");
    			}
    		})
    	}
    	
   		//아래는 댓글 등록 
    
    	
    	function addFrReply(){
    		console.log(`${loginUser.memberNo}`);
    		console.log(`${loginUser.memberId}`);
    		
    		var $vali = $("#rcontent");
    		var $mId = (`${loginUser.memberId}`);
    		var $mNo = (`${loginUser.memberNo}`);
    		var $loginUser = (`${loginUser}`);
    		
    		//바로아래는 공백제거 후 댓글이 작성되었는지 확인 (공백작성불가하게 막기 )
    		if($vali.val().trim().length != 0){
    			if($loginUser !=""){
	    	    	$.ajax({
			    		url : "frInsert.fbo",
			    		data : {
			    				fNo : ${fb.get(0).fNo}
			    				,frContent :$vali.val()
			    				,fWriterNo : $mNo

			    			},
		    			success : function(result){
		    				console.log("등록통신 성공");
		    				if(result=="yes"){
		    					selectReplyList();
		    					$vali.val("");
		    				}
		    			},
		    			error : function(){
		    				console.log("통신실패");
		    			},
			    		})
   					}else{
   						alert("로그인좀 하십쇼 ");
   					}
   				 }else{ //공백을 넣었거나 댓글을 작성하지 않은경우 
   	    			alert("댓글을작성하세요 . 공백은 작성불가");
   				 	$vali.val("");
   	    		}
    		}
   		
    	//아래는 댓글 수정
		function UpdateReply(){
			$.ajax({
				url : "updateFrReply.fr",
				data :{
						frContent : $("#frContent").val(), 
					    frNo : frReUpdateNo,  
					    fNo : ${fb.get(0).fNo} 
				},
			    type : "post",
			    success : function(result){
			    	console.log("통신성공");
			    	if(result =="NNNNY"){
			    		$("#frContent").val("");
			    		$("#reply_cnt").html("(0 / 10)");
			    		selectReplyList();
			    	}else{
			    		alert("댓글수정에 실패하였삼");
			    	}
			    },
				error : function(){
					console.log("통신실패");
				}
			})
		} 	
    	
    	//댓글 수정 글자 수 10자 제한 
    	$('#frContent').on('keyup',function(){
			$('#reply_cnt').html("("+$(this).val().length+" / 10)");
			
			if($(this).val().length > 10){
				$(this).val($(this).val().substring(0, 10));
				$('#reply_cnt').html("(10 / 10)");
			}
		});
    	
    	// 댓글 삭제 
    	function deleteReply(frNo){
    		$.ajax({
    			url : "deleteFrReply.fr",
    			data : {
    				frNo : frNo,  
				    fNo : ${fb.get(0).fNo},
				    fWriterNo : ${ loginUser.memberNo }
    			},
    			success : function(result){
    				if(result=="yes"){
	    				alert("댓글을 삭제하였습니다.");
	    				selectReplyList();
    				}
    				return false;
    			},
    		})
    	}
    
    </script>
  
</body>
</html>