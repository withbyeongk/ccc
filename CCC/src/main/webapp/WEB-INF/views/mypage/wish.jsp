<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/cart.css" rel="stylesheet" />
    <!--아이콘-->
    <script src="https://kit.fontawesome.com/bf7086b10a.js" crossorigin="anonymous"></script>
    <!--제이쿼리 라이브러리-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

<style type="text/css">
	table {
	    width: 750px;
	    text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	    margin: auto;
	}
	
	.wishcaption {
	    font-weight: bold;
	}
	
	table td {
	    padding: 10px;
	    background-color: #eee;
	}
	
	table th {
	    background-color: #333;
	    color: #fff;
	    padding: 10px;
	    height: 30px;
	}
	
	.wishimg {
	    width: 90px;
	    height: 90px;
	}
	
	.wishtocart,
	.wishdelete {
	    border: none;
	    padding: 5px 10px;
	    color: #fff;
	    font-weight: bold;
	}
	
	.wishview {
	    background-color: #03A9F4;
	}
	
	.wishdelete {
	    background-color: #E91E63;
	}
	
	.wishtablefoot {
	    padding: 0;
	    border-bottom: 3px solid #009688;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 
    <div class="wish outer">
     	<span align="center;">
     	<h3 align="center" style="font-weight: bold;">찜리스트 &nbsp</h3>  
     	</span>
		<!--<i class="fa-solid fa-heart" style="color:#EA4F4D; zoom:1.6; margin-bottom: 20px;"> -->
        
        <table class=".wishtable">
            <hr style="width:800px; height:2px; background-color:black; ">
            <br>
            <br>
            <thead>
                <!-- 상단 전체체크박스 영역 -->
                <tr>
                    <th style="background-color:#fff;">
                        <div><input type="checkbox" style="zoom:1.3;" name="allCheck" id="allCheck"></div>
                    </th>
                    <th colspan="3" style="background-color:#fff;">
                    	<!-- 상단 선택삭제버튼 -->
                        <button class="view" onclick="deleteValue();" style="border:white;margin-bottom: 10px;background-color:#EA4F4D; margin-left:-40px; height: 35px;color:white;font-weight:bold;">선택삭제</button>
                    </th>
                </tr>
                <tr>
                    <th style="width: 60px; background-color:#EA4F4D;">선택</th>
                    <th style="background-color:#EA4F4D;">이미지</th>
                    <th style="background-color:#EA4F4D;">배송/상품명/가격</th>
                    <th style="width:120px;background-color:#EA4F4D;">버튼</th>
                </tr>
            </thead>
            <tbody>
               <!-- 반복문 돌려주는 영역 -->
               <c:forEach var="w" items="${wList}">
                <tr>
                	<!-- 선택체크박스 --> 
                    <td><input type="checkbox" name="RowCheck" value="${w.goodsNo}" style="zoom:1.3;"></td>
                    <td><img src="${w.goodsChangeName1}" alt="${w.goodsChangeName1}" class="wishimg"></td>
                    <td>
                        <div>
                        <c:choose>
                        	<c:when test="${w.goodsPrice < 50000 }">
                                           배송비 : 2500원  	
                        	</c:when>
                        	<c:otherwise>
                                            배송비 : 무료
                        	</c:otherwise>
                        </c:choose>
                        </div>
                        <div>
                                            상품명: ${w.goodsName}
                        </div>
                        <div>
                                            가격: <fmt:formatNumber  value="${w.goodsPrice}" pattern="#,###원"/>
                        </div>
                    </td>
                    <td>
                        <div>
                            <button class="wishtocart" onclick="wishtocart('${w.goodsNo}');"  style="margin-bottom: 10px;background-color:#EA4F4D;">장바구니</button>
                        </div>
                        <div>
                            <button class="wishdelete" onclick="deleteOk('${w.goodsNo}');"; id="dBtn"  style="background-color:#EA4F4D;width:80px;" onclick="deleteOk();">삭제</button>
                        </div>
                    </td>
                </tr>
              </c:forEach> 
            </tbody>
        </table>
        
        <script>
        
           function wishtocart(goodsNo) {
        	  //console.log(goodsNo); 
			  
        	  $.ajax({
        		url:"findCartGoods.my",
        		data:{goodsNo:goodsNo},
        		success:function(result){
        			console.log("통신성공");
        			if (result=='already') {
        				
        				alert("이미 장바구니에 존재하는 상품입니다.");
        				
					} else if(result=='add') {
						
						alert("장바구니에 담았습니다.");
					}
        			
        		},
        		error:function(){
        			console.log("통신실패");
        		}
        	  })
		   }
        
           $(function() {
        	   
			 var chkObj=document.getElementsByName("RowCheck"); //개별선택 체크박스   
			 var rowCnt=chkObj.length; //개별선택 체크박스 개수
			
			 $("input[name='allCheck']").click(function() {//전체선택 체크박스를 선택했을때
				var chk_listArr=$("input[name='RowCheck']"); //개별체크박스 배열 []
				for(var i=0; i< chk_listArr.length; i++){ //개별체크박스 배열의 길이만큼, 선택된 개별체크박스를 체크상태로 만들어준다. 
					chk_listArr[i].checked=this.checked;
				}
			  });
			 
			 $("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length==rowCnt){
					$("input[name='allCheck']")[0].checked=true;
				}else {
					$("input[name='allCheck']")[0].checked=false;
				}
			 });
		   });
           
           //체크박스 선택삭제
		   function deleteValue(){
        	   
        	   var valueArr=new Array();
        	   var list=$("input[name='RowCheck']"); //개별체크박스들
        	   for(var i=0;i<list.length;i++){
        		   if(list[i].checked){ //개별체크박스가 체크되면 배열에 값을 저장
        			   valueArr.push(list[i].value); 
        		   }
        	   }
        	   
        	   console.log(valueArr);
        	   
        	   $.ajax({
        		  url:"deleteWishList.my",
        		  traditional:true,
        		  data:{valueArr:valueArr}, 
        		  success:function(result){
        			  console.log(result);
        			   if(result==1){
        				console.log("통신성공");
						alert("삭제성공");
						location.replace("wishList.my"); //기존의 페이지를 새로운 페이지로 변경시킨다.	
					   } else {
						alert("삭제할 상품을 선택해주세요");
					   }
        		  },
        		  error:function(){
        			  console.log("통신실패");
        		  }
        	   })
		      }
           
		   //3. 삭제버튼클릭시 한 상품 삭제  확인받음     
		   function deleteOk(goodsNo) {
        	   if(confirm("해당 상품을 삭제하시겠습니까?")){
       		   		location.href="deleteOk.my?goodsNo="+goodsNo;
       		   	    location.replace("wishList.my");
       		   }else{
       		   		console.log('아니오');
       		   }
		   }
        </script>
        
        <br><br><br><br><br>
    </div>
</body>
</html>