<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<style type="text/css">

table {
    width: 800px;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
    margin: auto;
}

.cartcaption {
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

.cartview,
.cartdelete {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
}

.cartview {
    background-color: #03A9F4;
}

.cartdelete {
    background-color: #E91E63;
}

.carttablefoot {
    padding: 0;
    border-bottom: 3px solid #009688;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 
    <div class="cart outer">
        <span align="center;">
     	<h3 align="center">장바구니 &nbsp;</h3>  
     	</span>
     	
        <div id="tablearea"> 
	        <table class=".carttable">
	            <hr style="width:800px; height:2px; background-color:black; ">
	            <br>
	            <br>
	            
	            <thead>
	                <tr>
	                    <th style="background-color:#fff;">
	                    	<!--전체상단 체크박스 -->
	                        <div><input type="checkbox" class="all_check_input" name='allCheck' style="zoom:1.3;" ></div>
	                    </th>
	                    <th colspan="3" style="background-color:#fff;">
	                        <button class="view" style="border:white;margin-bottom: 10px;background-color:#EA4F4D; margin-left:-40px; width:90px; height: 35px;color:white;">전체선택</button>
	                    </th>
	                </tr>
	                <tr>
	                    <th style="width: 60px; background-color:#EA4F4D;">선택</th>
	                    <th style="background-color:#EA4F4D;">이미지</th>
	                    <th style="background-color:#EA4F4D;">상품명</th>
	                    <th style="background-color:#EA4F4D;">가격</th>
	                    <th style="background-color:#EA4F4D;">수량</th>
	                    <th style="background-color:#EA4F4D;">합계</th>
	                    <th style="width:120px;background-color:#EA4F4D;"></th>
	                </tr>
	            </thead>
	            <tbody>
	               <!--c:forEach로 반복시켜줄 영역 -->
	               <c:forEach items="${cList}" var="c">
		                <tr> 
		                    <!--반복시켜줄 첫번째 td안에 hidden으로 상품관련 정보를 저장할것-->
		                    <td class="cart_info_td">
		                        <input type="checkbox" class="individual_cart_checkbox" name="RowCheck" value="${c.goodsNo}" style="zoom:1.3;" checked="checked">
		                        <input type="hidden" class="individual_price_input" value="${c.goodsPrice}">
		                        <input type="hidden" class="individual_count_input" value="${c.quantity}">
		                        <input type="hidden" class="individual_totalPrice_input" value="${c.goodsPrice*c.quantity}">
		                    </td>
		                    <td><img src="${c.goodsAttachFilePath}||${c.goodsAttachChangeName}" alt="img" class="wishimg"></td>
		                    <td>
			                    <div>
			                                          상품명:${c.goodsName}
			                    </div>
		                    </td>
		                    <td>
			                    <div>
			                      <del>정가: <fmt:formatNumber  value="${c.goodsPrice}" pattern="#,###원"/></del> 
			                    </div>
			                    <div>
			                                            판매가: 미정 <span><fmt:formatNumber value="${c.goodsPrice}" pattern="#,###원"/></span>                   
			                    </div>
		                    </td>
		                    <td>
		                                               몇개:${c.quantity}개
		                                               
		                    </td>
		                    <td>
		                                               합계: <span><fmt:formatNumber value="${c.goodsPrice*c.quantity}" pattern="#,###원" /></span>  
		                    </td>
		                    <td>
		                        <div>
		                            <button class="cartview" style="margin-bottom: 10px; background-color:#EA4F4D;color:#eee; width:70px;">주문</button>
		                        </div>
		                        <div>
		                            <button class="cartdelete" onclick="deleteOk('${c.goodsNo}');" style="background-color:#EA4F4D;color:#eee; width:70px;">삭제</button>
		                        </div>
		                   </td>
		                </tr>
	               </c:forEach>
	               <!--c:forEach 반복 끝 --> 
	            </tbody>
	        </table>
        </div>
        
        <br><br><br><br>
        <div id="totalpricearea" align="center">
            <table class=".carttable">
	            <hr style="width:800px; height:2px; background-color:black;">
	            <br><br>
	            <thead>
	                <tr>
	                    <th style="background-color:#EA4F4D;width:150px;">총상품개수</th>
	                    <th style="background-color:#EA4F4D;">총상품가격</th>
	                    <th style="background-color:#EA4F4D;"></th>
	                    <th style="background-color:#EA4F4D;">총배송비</th>
	                    <th style="background-color:#EA4F4D;"></th>
	                    <th style="background-color:#EA4F4D;">총 결제 예상 금액</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr> 
	                    <td class="totalCount_td">?개</td>
	                    <td class="totalPrice_td">?원</td>
	                    <td>+</td>
	                    <td class="deliveryPrice_td">?원</td>
	                    <td>=</td>
	                    <td class="finalTotalPrice_td">?원</td>
	               </tr>
	            </tbody>
	        </table>
        </div>
        
        <br><br>
        <div id="buttonarea" align="center">
           <button class="wishview" style="margin-bottom: 10px;background-color:#EA4F4D;width:120px;">주문하기</button>
           <button class="wishview" style="margin-bottom: 10px;background-color:#EA4F4D;width:120px;">쇼핑계속하기</button>
        </div>
        
        <script type="text/javascript">
        
	         $(document).ready(function(){
	        	
	           //장바구니 총계산영역 
			   setTotalInfo();
			  
	         };
	         
	         /*체크여부 변화에 따른 종합정보 변화*/
	         $(".individual_cart_checkbox").on("change", function(){
	        	 
	        	/*총 주문정보 세팅*/
	        	//가격,개수,최종가격
	        	setTotalInfo($(".cart_info_td")); 
	        	 
	         });
        	  
	         /*체크여부에 따른 정보 변화 */
        	 function setTotalInfo() {
        		 
	        	  //만들어내야할 데이터를 담아낼 변수선언 후 0으로 초기화
	           	  let totalPrice=0;  //총가격
	           	  let totalCount=0;  //총개수
	           	  let deliveryPrice=0; //배송비
	           	  let finalTotalPrice=0; //최종가격(총가격+배송비)
	           	  
	           	  //cart_info_td식별자를 통해 td태그에 접근하여 find메소드로 정보가 저장된 input hidden태그에 접근한다.
	           	  //상품수만큼 여러개의 td태그가 상품수만큼 존재하고 있기때문에 제이쿼리의 each(index,element)메소드를 통해서 객체의 수만큼 순회할 수 있다. 
	           	  //hidden으로 상품정보가 담긴 <td>태그를 순회
	           	  //총가격 총개수 구함
	           	  //td태그를 순회하는 코드
	           	  $(".cart_info_td").each(function(index,element) {
	           		  
	           		  if ($(element).find(".individual_cart_checkbox").is(":checked")===true) {//체크여부
	           			  
	           			 //td태그를 순회해서 얻은 총개수
		           		 totalCount+=parseInt($(element).find(".individual_count_input").val());
		           		  
		           		 //td태그를 순회해서 얻은 총가격(input태그의 값을 얻어오면 string타입으로 인식되기 때문에 parseInt로 int타입으로 변경해줌)
		           		 totalPrice+=parseInt($(element).find(".individual_totalPrice_input").val());
						 
					  }
	           		  
	   			  });
	   			  
	   			  //배송비결정 총가격이 50000이상일때만 0원,그 이하는 3000(지역에 따라서도 다르게 부여해줄지 고민해보기)
	   			  if (totalPrice>=50000) {
	   				deliveryPrice=0;
	   				  
	   			  }else if(totalPrice == 0){
	   				deliveryPrice=0;
	   			
	   			  }else{
	   				deliveryPrice=3000;
	   			  }
	           	  
	   			  //최종가격=총가격+배송비
	   			  finalTotalPrice=totalPrice+deliveryPrice;
	   			  
	   			  //구한값 화면에 뿌리기
	   			  //통화형식으로 출력될수 있도록 대상변수에 toLocaleString()메서드를 호출한다.
	   			  
	   			  //총가격
	   			  $(".totalPrice_td").text(totalPrice.toLocaleString());
	   			  
	   			  //총개수
	   			  $(".totalCount_td").text(totalCount);
	   			  
	   			  //배송비
	   			  $(".deliveryPrice_td").text(deliveryPrice);
	   			  
	   			  //최종가격(총가격+배송비)
	   			  $(".finalTotalPrice_td").text(finalTotalPrice.toLocaleString());	 
        		 
			  }
	         
	         
	       $(".all_check_input").on("click",function(){
	    	  
	    	   /* 체크박스 체크/해제 */
	    		if($(".all_check_input").prop("checked")){
	    			$(".individual_cart_checkbox").attr("checked", true);
	    		} else{
	    			$(".individual_cart_checkbox").attr("checked", false);
	    		}
	    	   
	    	    //총 주문정보 세팅
	    		setTotalInfo($(".cart_info_td"));	
	    	   
	       });  
			  
		
          
          //체크박스 설정
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
        
        </script>
        
        <br><br><br><br>
    </div>
</body>
</html>