<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <!-- jQuery 라이브러리 -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <style>
    	#cartOuter{
            margin: auto;
            width:70%;
        }
        #cart-area th{
        	border-top: 2px solid lightgray;
            border-bottom: 2px solid lightgray;
        }
        #cart-area tbody td{
            border-bottom: 1px dashed lightgray;
        }
        #cart-area tfoot td{
        	border-top: 2px solid lightred;
        }
        #cart-area{
            border-bottom: 2px solid lightgray;
        }
        
        #cart-td-center{
            text-align: center;
        }
        #cart-td-left{
            text-align: left;
        }
        /*입력*/
        #cart-area input[type='number']::-webkit-outer-spin-button,
        #cart-area input[type='number']::-webkit-inner-spin-button{
        	-webkit-appearance: none;
    		margin: 0;
        }
        #cart-area input{
        	text-align:center;
        	border: 1px solid lightgray;
        }
        #cart-area input:focus {
        	outline: none !important;
        	border-color: #EA4F4D;
        	box-shadow: 0 0 5px #EA4F4D;
        	border: 1px solid #EA4F4D;
        }
        
        /*버튼*/
        #deleteTrDiv button:hover{
        	font-weight: bold;
        	font-size: 13px;
        }
        
        #bottomBuyBtn button:hover{
        	font-weight: bold;
        	font-size: 13px;
        }
        
		#cart-area tr button{ 
			height: 30px;
        	font-size: 11px;
		}
		#cart-area tr button:hover{ 
			font-weight: bold;
			font-size: 12px;
		}
        .addWishBtn{
        	 border-radius: 3px;
        	 width: 110px;
        	 margin-bottom: 3px;
        	 background-color: coral;
        	 color: white;
        	 border:0px;
        }
        .buyBtn{
        	 border-radius: 3px;
        	 width: 110px;
        	 margin-bottom: 3px;
/*         	 background-color: lightpink; */
        	 background-color: #EA4F4D;
        	 font-weight: bold;
        	 color: white;
        	 border:0px;
        }
        .deleteBtn{
        	 border-radius: 3px;
        	 width: 110px;
        	 margin-bottom: 3px;
        	 background-color: rgb(218, 209, 210);
        	 border:0px;
        }
        .quantityBtn{
        	 width: 50px;
        	 height: 15px;
        	 border-radius: 10px;
        	 border: 1px solid lightgray;
        }
        
        /*리모콘*/
        .remoteCartDiv{
        	position: fixed;
/*         	border: 1px solid lightgray; */
        	width: 150px;
        	height: 300px;
        	right: 10px;
        	bottom: 450px;
/* 			display: none; */
        }
        .categoryTag{
        	color: black;
        	font-size: 12px;
        }
        .categoryTag:hover{
        	text-decoration:none;
        	font-size: 13px;
        	font-weight: bold;
        	color: #EA4F4D;
        }
    </style>
    <title>CCC::장바구니</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container" id="cartOuter">
	<br><br><br><br><br><br>
    <!-- CART START-->
    <div class="cartDiv">
        <form action="">
            <div class="cartHead">
                <span style="font-size: 16pt; font-weight: bold;">장바구니</span>
                <span class="home">
                	<a class="categoryTag" href="goodsMain.go">홈</a>
                	 > 
                	<a class="categoryTag" href="cart.ca">장바구니</a>
                </span>
            </div>
            <div class="cartBody">
            	<br>
                <table id="cart-area">
                    <thead>
                        <tr align="center" style="height:50px;">
                            <th><input type="checkbox" name="checkboxHeader" id="allCheck" style="width:20px; height:20px;"></th>
                            <th colspan="2" style="width: 700px;"><span>상품정보</span></th>
                            <th style="width:110px;">가격</th>
                            <th style="width:50px;">수량</th>
                            <th style="width:110px;">합계</th>
                            <th style="width:110px;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${not empty clist}">
                    			<c:forEach var="c" items="${clist}">
                    				<tr style="height: 90px; background-color: #fff;">
			                            <td class="cart-td-center" style="border-right: none;">
			                                <input type="checkbox" name="checkbox" style="width:20px; height:20px;">
			                            </td>
			                            <td style="width: 100px; border-left: none; border-right: none;">
<%-- 			                            	<img style="width: 80%;" src="${c.goodsAttachChangeName}" alt="${c.goodsAttachFilePath } "> --%>
			                            	<a href="detail.go?gno=${c.goodsNo}"><img style="margin-left:20px; width: 80%;" src="${c.goodsAttachChangeName}" alt=""></a>
			                            </td>
			                            <td style="width: 600px; text-align:left; padding-left: 10px; border-left: none; font-weight: bold;">${c.goodsName }</td>
			                            <td class="" style="width: 100px; text-align:center;">
			                            	<span>&#8361;</span>
			                            	<span class="priceOne" style="padding-left: 10px;">
			                            		<fmt:formatNumber value="${c.goodsPrice }" pattern="#,###,###" />
			                            	</span>
			                            </td>
			                            <td class="" style="width: 70px;">
			                        		<input type="hidden" name="" value="${c.cartNo }">
			                                <input type="number" style="text-align: middle; width: 50px; margin-bottom: 5px;" min="1" max="99" step="1" value="${c.quantity }">
			                                <button type="button" class="quantityBtn">변경</button>
			                            </td>
			                            <td class="cart-td-center trTdPrice" style="width: 100px; text-align:center;">
			                            	<span>&#8361;</span>
			                            	<span class="trPrice">
			                            		<fmt:formatNumber value="${c.goodsPrice*c.quantity}" pattern="#,###,###" />
			                            	</span>
			                            </td>
			                            <td class="cart-td-center" style="width: 110px;">
			                                <button type="button"  class="buyBtn">구매</button>
			                                <button type="button"  class="addWishBtn">관심상품</button>
			                                <button type="button"  class="deleteBtn">삭제</button>
			                            </td>
			                        </tr>
                    			</c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			<tr>
                            		<th colspan="7" style="text-align: left; padding-left: 10px;">
                            			<h2 align="center">장바구니가 비어 있습니다.</h2>
                            		</th>
                        		</tr>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                    <tfoot>
                        <tr style="height: 60px;">
                            <td colspan="7" style="border-right: none; text-align: left; padding-left: 10px;">
                            	<span>상품 금액</span><span style="margin-left:30px;">&#8361;</span>
                                <span id="totalGoodsPrice" style="font-size:15pt; margin-right: 20px;"></span>
                                <span style="margin:0 30px 0 30px;">+</span>
                                <span>배송비</span><span style="margin-left:30px;">&#8361;</span>
                                <span id="deliveryFee" style="font-size:15pt;"></span>
                                <span style="margin:0 30px 0 30px;"> = </span>
                                <span class="totalPrice" style="margin-right:30px;">합계</span>&nbsp;
                                <span>&#8361;</span>
                                <span id="totalFinalPrice" style="font-weight: bold; font-size:15pt;"></span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <br>
                <div id="deleteTrDiv">
                    <button type="button"  class="btn default deleteCheckBtn" style="border-radius: 3px; width: 150px; margin-bottom: 3px; font-size: 11px; background-color: rgb(230, 171, 171); border:0px;">선택상품 삭제하기</button>
                    <button type="button"  class="btn default clearCartBtn" style="border-radius: 3px; width: 150px; margin-bottom: 3px; font-size: 11px; background-color: rgb(214, 240, 189); border:0px;">장바구니 비우기</button>
                    <span class="clearboth"></span>
                </div>
                <br><br>
                <div align="center" id="bottomBuyBtn">
                    <button type="button" class="btn default buyAllGoodsBtn" style="border-radius: 3px; width: 100px; height: 50px; margin: 0 10px 0 0; font-size: 11px; background-color: rgb(238, 161, 206); border:0px;">전체 상품주문</button>
                    <button type="button" class="btn default buyCheckGoodsBtn" style="border-radius: 3px; width: 100px; height: 50px; margin: 0 10px 0 10; 3px; font-size: 11px; background-color: rgb(236, 181, 236); border:0px;">선택 상품주문</button>
                    <button type="button" class="btn default goShopBtn" style="border-radius: 3px; width: 100px; height: 30px; margin: 0 10px 0 10; 3px; font-size: 11px; background-color: lightpink; border:0px; float: right;">쇼핑 계속하기</button>
                </div>
                <br><br><br>
                <div style="border: solid 1px lightgray; padding: 10px 0; font-size: 11pt; background-color: rgb(245, 147, 147);; padding-left: 10px;">이용안내</div>
                <div style="border: solid 1px rgb(191, 196, 191); height: 300px; font-size: 9pt; padding-left: 10px;">
                    <br>장바구니 이용 안내
                    <ol>
                        <li class="lifont">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
                        <li class="lifont">장바구니와 관심상품을 이용하여 원하시는 상품을 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
                        <li class="lifont"></li>
                    </ol>
                   	 무이자할부 이용안내
                    <ol>
                        <li class="lifont">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기]버튼을 눌러 주문/결제하시면 됩니다.</li>
                        <li class="lifont">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
                        <li class="lifont">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
                        <li class="lifont">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.</li>
                        <li class="lifont">실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고하시기 바랍니다.</li>
                    </ol>

                </div>
            </div>
        </form>
    </div>
    <br><br><br><br><br>
    
    <div class="remoteCartDiv">
<!--     	<span id="remoteController">할인 상품!</span><br> -->
    	<div class="remoteItem">
<!-- 			<span class="remoteSpan">1번 항목</span><br> -->
			<a href="detail.go?gno=33"><img src="resources/goodsImg/2023010518180147435.jpg" class="img-fluid" alt="Colorlib Template"></a>
    	</div>
    	<br>
    	<div class="remoteItem">
<!-- 			<span class="remoteSpan">2번 항목</span><br> -->
			<a href="detail.go?gno=41"><img src="resources/goodsImg/2023010518192452093.jpg" class="img-fluid" alt="Colorlib Template"></a>
    	</div>
    	<br>
    	<div class="remoteItem">
<!-- 			<span class="remoteSpan">3번 항목</span><br> -->
			<a href="detail.go?gno=39"><img src="resources/goodsImg/2023010518192437047.jpg" class="img-fluid" alt="Colorlib Template"></a>
    	</div>
    </div>

    <script>
    
        // 체크박스 전체 체크 or 체크해제
        $("#allCheck").change(function(){
        	var isChecked = $("#allCheck").is(":checked");
//         	console.log("isChecked : " + isChecked);
       		var trArr = $("#cart-area>tbody tr");
       		
        	if(isChecked){
//         		console.log("체크됨");
				$(trArr).find(":checkbox").prop("checked", true);
        	}
        	else{
//         		console.log("체크안됨");
        		$(trArr).find(":checkbox").prop("checked", false);
        	}
        });
        
        // 수량변경 버튼 클릭 --------------------------------- Start
		$(".quantityBtn").click(function(){
// 			console.log("quantityBtn clicked");
			var quantity = $(this).prev().val();
			var cartNo = $(this).prev().prev().val();
// 			console.log("카트 번호 : " + cartNo);
// 			console.log("상품 변경 수량 : " + quantity);
			
			// DB에 장바구니 수량 변경
			changeQuantity(cartNo, quantity);
			
			// 화면에 행 합계 표시 변경
			var priceText = $(this).parent().prev().children(".priceOne").text();
// 			console.log("priceText is " + priceText);
			var price = priceText.replace(/,/g,"");	// 콤마 제거 (ex: 4,000 -> 4000)
// 			console.log("price is " + price);
			var result = price*quantity;
// 			console.log("result is " + result);
			
			var trTotalText = $(this).parent().next().find('.trPrice');	// 합계 입력할 곳 선택
			var trTotal = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 위에서 계산한 result에 콤마 넣기 (ex: 4000 -> 4,000)
			trTotalText.html(trTotal);
			
			//changeTotalPrice();	// 전체 합계 금액 변경
			changeCheckTotalPrice();	// 체크한 합계 금액 변경
		});
		
        // db 수량 변경 ajax
		function changeQuantity(cartNo, quantity){
// 			console.log("changeQuantity() 실행");
			$.ajax({
				url : "changeQuantity.ca",
				data : {
					cartNo : cartNo,
					quantity : quantity
				},
				success : function(result){
// 					console.log("결과는 : " + result);
				},
				error : function(){
					console.alert("changeQuantity 실패");
				}
			});
		};
		
		// 수량변경 버튼 클릭 --------------------------------- End
		$(function(){
			// 시작하면서 계산
// 			changeTotalPrice();	// 전체 합계 금액 변경
			changeCheckTotalPrice();	// 체크한 합계 금액 변경
			
			// 체크할 때마다 계산
			$(":checkbox").change(function(){
				changeCheckTotalPrice();	// 체크한 합계 금액 변경
			});
		});
		
		// 최종 금액 변경
		// 콤마 적용 안된 상태
		function changeTotalPrice(){
			var totalPrice = 0;
			var trPriceArr = $(".trPrice");
// 			console.log(trPriceArr);
			for(var i=0; i<trPriceArr.length; i++){
				totalPrice += Number(trPriceArr.eq(i).text());
			}
			
			console.log(totalPrice);
			
			// 값 구했으니 변경하는 코드만 넣으면 됨
			
		}
		
		
		// 체크한 상품 합계 금액 변경
		function changeCheckTotalPrice(){
			var checkTotalPrice = 0;
			var checkTotalPriceText = "0"; // 최종 금액에 콤마 표시하여 입력할 때 사용할 변수
			var checkTotalFinalPrice = 0;
			var checkTotalFinalPriceText = "0"; // 최종 합계 금액에 콤마 표시하여 입력할 때 사용할 변수
			var deliveryFee = 2500;
			$("input:checkbox[name=checkbox]:checked").each(function(){
				var trPriceText = $(this).parent().parent().children().eq(5).find('.trPrice').text();
// 				console.log("trPriceText" + trPriceText);
				var priceOne = trPriceText.replace(/,/g,"");	// 콤마 제거 (ex: 4,000 -> 4000)
// 				console.log("priceOne" + priceOne);
				checkTotalPrice += Number(priceOne);
			});
			console.log("checkTotalPrice = "+checkTotalPrice);

			checkTotalPriceText = checkTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 위에서 계산한 result에 콤마 넣기 (ex: 4000 -> 4,000)
			$("#totalGoodsPrice").html(checkTotalPriceText);
			
			if(checkTotalPrice >= 50000){
				checkTotalFinalPrice = Number(checkTotalPrice);
				checkTotalFinalPriceText = checkTotalFinalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 위에서 계산한 result에 콤마 넣기 (ex: 4000 -> 4,000)
				$("#deliveryFee").html(0);
			}
			else if(checkTotalPrice == 0){
				$("#deliveryFee").html(0);
			}
			else{
				checkTotalFinalPrice = Number(deliveryFee)+Number(checkTotalPrice);
				checkTotalFinalPriceText = checkTotalFinalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 위에서 계산한 result에 콤마 넣기 (ex: 4000 -> 4,000)
				$("#deliveryFee").html('2,500');
			}
			$("#totalFinalPrice").html(checkTotalFinalPriceText);
		}
		
		
		// 개별 구매
		$(".buyBtn").click(function(){
			// 개별 구매 페이지로 이동
			// 장바구니에서 해당 굿즈 삭제
// 			console.log("buyBtn clicked");
			
			var cartNo = $(this).parent().prev().prev().find('input').eq(0).val();	// 카트 번호
			var quantity = $(this).parent().prev().prev().find('input').eq(1).val();	// 굿즈 수량
// 			console.log(cartNo+"를 "+quantity+"개 구매");
			
			var response = window.confirm("선택한 굿즈를 구매하시겠습니까?");
// 			console.log("response : " + response);
			if(response){
				location.href="buyGoods.ca?cartNo="+cartNo;				
			}
		});
		
		// 관심상품 추가 --------------------------------- Start
		$(".addWishBtn").click(function(){
			// 해당 굿즈를 관심상품으로 등록
			// prompt창으로 성공 실패여부 반환
			// +@ : 관심상품 여부를 표시 등록/삭제로 토글 
// 			console.log("addWishBtn clicked");
		
			var cartNo = $(this).parent().prev().prev().find('input').eq(0).val();	// 카트 번호
// 			console.log("상품 번호 : " + cartNo);
			
			checkWish(cartNo);
		});
		
		function checkWish(cartNo){
// 			console.log("checkWish() 실행");
			$.ajax({
				url : "checkWish.ca",
				data : {
					cartNo : cartNo
				},
				success : function(result){
					console.log("결과는 : " + result);
					if(result > 0){
						removeWish(cartNo);
						window.alert("관심상품 삭제!");
					}
					else{
						addWish(cartNo);
						window.alert("관심상품 등록!");
					}
				},
				error : function(){
					console.alert("checkWish 실패");
				}
			});
		}
		
		function addWish(cartNo){
// 			console.log("addWish() 실행");
			$.ajax({
				url : "addWish.ca",
				data : {
					cartNo : cartNo
				},
				success : function(result){
					console.log("addWish : " + result);
				},
				error : function(){
					console.alert("addWish 실패");
				}
			});
		};
		
		function removeWish(cartNo){
// 			console.log("removeWish() 실행");
			$.ajax({
				url : "removeWish.ca",
				data : {
					cartNo : cartNo
				},
				success : function(result){
					console.log("removeWish : " + result);
				},
				error : function(){
					console.alert("removeWish 실패");
				}
			});
		};
		// 관심상품 추가 --------------------------------- End
		
		// 장바구니에서 개별 삭제
		$(".deleteBtn").click(function(){
// 			console.log("deleteBtn clicked");
			var cartNo = $(this).parent().prev().prev().find('input').eq(0).val();	// 카트 번호
// 			console.log("삭제할 상품 번호 : " + cartNo);
			
			var response = window.confirm("선택한 굿즈를 장바구니에서 삭제하겠습니까?");
// 			console.log("response : " + response);
			if(response){
				$(this).parent().parent().remove();	// 해당 굿즈 tr 삭제

				// 장바구니 테이블에서 해당 굿즈 삭제
				deleteGoodsInCart(cartNo);
			}
			changeTotalPrice();	// 전체 합계 금액 변경
			changeCheckTotalPrice();	// 체크한 합계 금액 변경
		});
		
		function deleteGoodsInCart(cartNo){
			console.log("deleteGoodsInCart() 실행");
			$.ajax({
				url : "deleteGoodsInCart.ca",
				data : {
					cartNo : cartNo
				},
				success : function(result){
					console.log("deleteGoodsInCart :"+result);
				},
				error : function(){
					console.alert("deleteGoodsInCart 실패");
				}
			});
		}

		// 장바구니에서 체크한 굿즈 삭제
		$(".deleteCheckBtn").click(function(){
			// 체크가 되어있으면 해당 굿즈 tr 삭제
// 			console.log("deleteCheckBtn clicked");
			
			var response = window.confirm("선택한 굿즈들을 장바구니에서 삭제하시겠습니까?");
// 			console.log("response : " + response);
			if(response){
	        	var trArr = $("#cart-area>tbody tr");
// 				console.log(trArr);

				// 체크된 번호를 담아서 전달할 배열
				let chkArr = new Array();
				
				trArr.each(function (index, item){
					// index는 0부터 시작함
					var chkbox = $(item).find(":checkbox");
					var isChecked = chkbox.is(":checked");
					
					var cartNo = $(item).find(":hidden").val();
					console.log("cartNo : " + cartNo);
					
					if(isChecked){
						console.log("체크O : " + index);
						chkArr.push(cartNo);
						$(item).remove();
					}
				});
				console.log("주문리스트 : " + chkArr);
				if(chkArr.length==0){
					console.log("길이 : " + chkArr.length);
					window.alert("선택된 상품이 없습니다.");
				}
				else{
					// chkArr로 ajax처리
					deleteCheckGoodsInCart(chkArr);
				}
			}
			//changeTotalPrice();	// 전체 합계 금액 변경
			changeCheckTotalPrice();	// 체크한 합계 금액 변경
		});
		
		function deleteCheckGoodsInCart(chkArr){
			console.log("deleteCheckGoodsInCart() 실행");
			$.ajax({
				url : "deleteCheckGoodsInCart.ca",
				data : {
					chkArr : chkArr
				},
				success : function(result){
					console.log("deleteCheckGoodsInCart :"+result);
				},
				error : function(){
					console.alert("deleteCheckGoodsInCart 실패");
				}
			});
		}
		
		// 장바구니 전체 삭제
		$(".clearCartBtn").click(function(){
			// 해당 회원의 장바구니에 있는 굿즈들을 전부 삭제
			console.log("clearCartBtn clicked");
			
			var response = window.confirm("장바구니를 비우시겠습니까?");
// 			console.log("response : " + response);
			if(response){
	        	var trArr = $("#cart-area>tbody tr");
// 				console.log(trArr);

				// 체크된 번호를 담아서 전달할 배열
				let chkArr = new Array();
				
				trArr.each(function (index, item){
					var cartNo = $(item).find(":hidden").val();
					console.log("cartNo : " + cartNo);
					
					chkArr.push(cartNo);
					$(item).remove();
				});
				
				console.log("주문리스트 : " + chkArr);
				if(chkArr.length==0){
					console.log("길이 : " + chkArr.length);
					window.alert("선택된 상품이 없습니다.");
				}
				else{
					// chkArr로 ajax처리
					deleteCheckGoodsInCart(chkArr);
				}
			}
			//changeTotalPrice();	// 전체 합계 금액 변경
			changeCheckTotalPrice();	// 체크한 합계 금액 변경
		});
		
		
		// 전체 상품 주문
		$(".buyAllGoodsBtn").click(function(){
// 			console.log("buyAllGoodsBtn clicked");
			
			var response = window.confirm("모든 굿즈를 구매하시겠습니까?");
// 			console.log("response : " + response);
			if(response){
				// 체크된 번호를 담아서 전달할 배열
				let chkArr = new Array();
				
				var trArr = $("#cart-area>tbody tr");
// 				console.log(trArr);
// 				console.log("길이 : " + trArr.length);
				if(trArr.length == 0){
					window.alert("장바구니가 비어있습니다.");
				}
				else{
					// 해당 회원의 장바구니에서 해당 품목과 상품 수를 조회
					trArr.each(function (index, item){
						var chkbox = $(item).find(":checkbox");
						var goodsNo = $(item).find(":hidden").val();
// 						console.log("goodsNo : " + goodsNo);
						chkArr.push(goodsNo);
					});   
					console.log("주문리스트 : " + chkArr);
					if(chkArr.length==0){
						console.log("길이 : " + chkArr.length);
						window.alert("선택된 상품이 없습니다.");
					}
					else{
						var cartNoArr = chkArr.join(",");
						console.log("cartNoJsonArr : " + cartNoArr);
						location.href="buyManyGoods.ca?cartNoArr="+cartNoArr;	
					}
				}
			}
		});
		
		
		// 선택 상품 주문
		$(".buyCheckGoodsBtn").click(function(){
// 			console.log("buyCheckGoodsBtn clicked");
			
			var response = window.confirm("선택한 굿즈들을 구매하시겠습니까?");
// 			console.log("response : " + response);
			if(response){
				// 해당 회원의 장바구니에서 체크된 항목의 상품과 수를 조회

				// 체크된 번호를 담아서 전달할 배열
				let chkArr = new Array();
				
	        	var trArr = $("#cart-area>tbody tr");
// 				console.log(trArr);
				
				trArr.each(function (index, item){
					var chkbox = $(item).find(":checkbox");
					var cartNo = $(item).find(":hidden").val();
// 					console.log("cartNo : " + cartNo);
					var isChecked = chkbox.is(":checked");
					if(isChecked){
// 						console.log("체크O : " + index);
						chkArr.push(cartNo);
					}
// 					else{
// 						console.log("체크X : " + index);
// 					}
				});   
// 				console.log("주문리스트 : " + chkArr);
				if(chkArr.length==0){
					console.log("길이 : " + chkArr.length);
					window.alert("선택된 상품이 없습니다.");
				}
				else{
					var cartNoArr = chkArr.join(",");
					console.log("cartNoJsonArr : " + cartNoArr);
					location.href="buyManyGoods.ca?cartNoArr="+cartNoArr;	
				}
			}
		});
		
		$(".goShopBtn").click(function(){
			// 상품리스트 페이지로 이동
// 			console.log("goShopBtn clicked");
			
			var response = window.confirm("상품 페이지로 이동하시겠습니까?");
// 			console.log("response : " + response);
			if(response){
				location.href="shop.go";
			}
		});
        
		
		//  리모콘
		
// 		$(function(){
// 			var con = $(".remoteDiv");
// 			con.fadeIn();
// 		});
// 		$(document).scroll(function(){
// 			var con = $(".remoteDiv");
// 			var position = $(window).scrollTop();
// 			con.fadeIn();
// 			if(position > 250){
// 				con.fadeIn(500);
// 			}
// 			else if(position < 250){
// 				con.fadeOut(500);
// 			}
// 		});
		
// 		$(".remoteDiv").click(function(){
			// 클릭 시 position 500으로 이동
// 			$("html, body").animate( {scrollTop: 500}, 1000);
// 		});
		$(".remoteDiv>table tr td").click(function(){
			console.log("remote > table > tr클릭");
		});
    </script>

    <!-- CART END-->
</div>
</body>
</html>