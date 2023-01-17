<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     jQuery 라이브러리 -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--     부트스트랩에서 제공하고 있는 스타일 -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<!--     부트스트랩에서 제공하고 있는 스크립트 -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	<!-- iamport 라이브러리 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <title>CCC::구매페이지</title>
    <style>
    	.purchaseOuter{
            width:70%;
            margin: auto;
        }
        .purchaseHeaderSpan{
            font-size: 30px;
            font-weight: bold;
        }
        .purchaseHeaderHr{
            height: 2px;
            background-color: gray;
        }
        .purchaseNormalTb{
            /* border: 1px solid red; */
            width:100%;
        }
        .purchaseNormalTb tr{
            width:100%;
            height: 40px;
        }
        .purchaseNormalTb th{
            width:20%;
            background-color: rgb(255, 209, 209);
            font-size: 13px;
            color: black;
        }
        .purchaseNormalTb td{
            border-bottom: 2px dashed lightpink;
            font-size: 13px;
        }
        .payType{
            margin: 10px 30px 10px 30px;
            border-radius: 10px;
            background-color: lightgray;
        }
        
        /*배송관련버튼*/
        .changePackageBtn{
        	border: 0px;
        	height: 40px;
        	border-radius: 4px;
			width: 110px;
        	font-size: 11px;
        	color: white;
        	vertical-align: middle;
        }
        .changePackageBtn:hover{
        	font-weight: bold;
			font-size: 13px;
        }
        /*기본배송지버튼*/
        #defaultPackageInfo{
        	margin-left: 5%;
            background-color: rgb(78, 154, 255);
        }
        
        /*배송지 불러오기버튼*/
        #changePackageInfo{
			margin-left: 1%;
            background-color: rgb(255, 104, 104);
        }
        /*배송 메세지 입력 버튼*/
        #insertComment{
        	border: 0px;
        	vertical-align: middle;
        	border-radius: 10px;
        	margin-left: 5%;
        	background-color: lightgreen;
        }
        #purchaseBtn{
        	border: 0px;
        	height: 40px;
        	border-radius: 4px;
			width: 110px;
        	font-size: 11px;
        	color: white;
        	vertical-align: middle;
        	color: white;
            background-color: rgb(255, 104, 104);
            margin-left: 45%;
        }
        #goBackBtn{
        	border: 0px;
        	height: 40px;
        	border-radius: 4px;
			width: 110px;
        	font-size: 11px;
        	color: white;
        	vertical-align: middle;
        	color: white;
            background-color: rgb(78, 154, 255);
            float: right;
        }
        .passData{
        	width: 80px;
        	text-align:center;
        	outline:none;
        	border: none;
        }
        .passData2{
        	width: 40px;
        	text-align:center;
        	outline:none;
        	border: none;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div class="purchaseOuter container" id="headerRaiseUp">
        <span class="purchaseHeaderSpan">주문 / 결제</span>
        <hr class="purchaseHeaderHr">
        <div class="purchaseForm">
        	<form action="insert.or" method="post" commandName="order">
	            <div class="buyerInfo">
	            	<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo}">
	                <table id="buyerInfoBTL" class="purchaseNormalTb">
	                    <tr align="center">
	                        <th>이 름</th>
	                        <td>${loginUser.memberName }</td>
	                    </tr>
	                    <tr align="center">
	                        <th>이 메 일</th>
	                        <td>${loginUser.memberEmail }</td>
	                    </tr>
	                    <tr align="center">
	                        <th>휴 대 폰 번 호</th>
	                        <td>${loginUser.memberPhone }</td>
	                    </tr>
	                </table>
	            </div>
				<br>
				<span class="purchaseHeaderSpan">받는 사람 정보</span>
				<button type="button" class="changePackageBtn" id="defaultPackageInfo">기본 배송지</button>
				<button type="button" class="changePackageBtn" id="changePackageInfo">배송지 불러오기</button>
<!-- 				<button type="button" class="insertCommentBtn" id="insertComment">배송지 불러오기</button> -->
				<hr class="purchaseHeaderHr">
				<div class="receiverInfo">
	                <table id="receiverInfoTBL" class="purchaseNormalTb">
	                    <tr align="center">
	                        <th>이 름</th>
	                        <td>${loginUser.memberName }</td>
	                    </tr>
	                    <tr align="center">
	                        <th>배 송 주 소</th>
	                        <td>${loginUser.memberAddress }</td>
	                    </tr>
	                    <tr align="center">
	                        <th>연 락 처</th>
	                        <td>${loginUser.memberPhone }</td>
	                    </tr>
	                    <tr align="center">
	                        <th>배 송 요 청 사 항</th>
	                        <td></td>
	                    </tr>
	                </table>
	                <input type="hidden" id="aiNo" name="aiNo" value="0">
				</div>
				<br>
				<span class="purchaseHeaderSpan">구매 목록</span>
				<hr class="purchaseHeaderHr">
				<div class="goodsInfo">
	                <table id="goodsInfoTBL" class="purchaseNormalTb">
	                    <tr align="center">
	                        <th style="width:40%;">주문 상품명</th>
	                        <th style="width:15%;">가격</th>
	                        <th style="width:10%;">수량</th>
	                        <th style="width:15%;">상품 합계</th>
	                        <th style="width:10%;">옵션1</th>
	                        <th style="width:10%;">옵션2</th>
	                    </tr>
	                    <!-- 그룹구매했을 경우에 표시 -->
	                    <c:choose>
	                    	<c:when test="${not empty clist}">
		                    	<c:forEach var="c" items="${clist}" varStatus="status">
			                    	<input type="hidden" id="goodsNo" name="goodsNo" value="${c.goodsNo}" readonly>
				                    <tr align="center">
				                        <td>
											<input class="passData" type="text" id="goodsName" name="order[${status.index}].goodsName" value="${c.goodsName}" readonly>
										</td>
				                        <td>
				                        	<span>&#8361;</span>
				                        	<input class="passData" type="text" id="goodsPrice" name="order[${status.index}].goodsPrice" value="<fmt:formatNumber value="${c.goodsPrice }" pattern="#,###,###" />" readonly>
				                        </td>
				                        <td>
					                        <input class="passData2" type="text" id="quantity" name="order[${status.index}].quantity" value="${c.quantity}" readonly>
					                        <span>개</span>
				                        </td>
				                        <td>
				                        	<span>&#8361;</span>
				                        	<fmt:formatNumber value="${c.goodsPrice * c.quantity}" pattern="#,###,###" />
				                        </td>
				                        <td>없음</td>
				                        <td>없음</td>
				                    </tr>
			                    </c:forEach>
			            	</c:when>
	                    </c:choose>
	                </table>
				</div>
				<br>
				<span class="purchaseHeaderSpan">결제 정보</span>
				<hr class="purchaseHeaderHr">
				<div class="purchaseInfo">
	                <table id="purchaseInfoTBL" class="purchaseNormalTb">
	                    <tr align="center">
	                        <th>총 상품 가격</th>
	                        <td>
	                        	<span>&#8361;</span>
	                        	<fmt:formatNumber value="${totalPrice}" pattern="#,###,###" />
	                        	
	                        </td>
	                    </tr>
	                    <tr align="center">
	                        <th>배송비</th>
	                        <c:choose>
	                        	<c:when test="${totalPrice > 50000 }">
			                        <td>
			                        	<span>&#8361;</span>
			                        	<span>0</span>
			                        </td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>
	                        			<span>&#8361;</span>
			                        	<span>2,500</span>
			                        </td>
	                        	</c:otherwise>
	                        </c:choose>
	                    </tr>
	                    <tr align="center">
	                        <th>총 결제 금액</th>
	                        <c:choose>
	                        	<c:when test="${totalPrice > 50000 }">
			                        <td>
			                        	<span>&#8361;</span>
			                        	<span>
			                        		<fmt:formatNumber value="${totalPrice}" pattern="#,###,###" />
			                        	</span>
		                        		<input type="hidden" id="orderFinalAmount" name="orderFinalAmount" value="${totalPrice}" readonly>
			                        </td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>
	                        			<span>&#8361;</span>
			                        	<span>
			                        		<fmt:formatNumber value="${totalPrice+2500}" pattern="#,###,###" />
			                        	</span>
		                        		<input type="hidden" id="orderFinalAmount" name="orderFinalAmount" value="${totalPrice+2500}" readonly>
			                        </td>
	                        	</c:otherwise>
	                        </c:choose>
	                    </tr>
	                    <!-- 
	                    <tr align="center">
	                        <th>결제 방법</th>
	                        <td align="left">
	                            <input type="radio" name="payType" value="1" checked>신용카드
	                            <input type="radio" name="payType" value="2">계좌이체
	                            <input type="radio" name="payType" value="3">가상계좌
	                            <input type="radio" name="payType" value="4">휴대폰결제
	                            <div class="payType">
	                                <table class="cardTab">
	                                    <tr>
	                                        <th>카드 선택</th>
	                                        <td>드롭다운
	                                        	
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>할부기간</th>
	                                        <td>일시불</td>
	                                              </tr>
	                                </table>
	                                <table class="accountTab">
	                                    <tr>
	                                        <th>은행선택</th>
	                                        <td>은행종류드롭다운</td>
	                                    </tr>
	                                </table>
	                                <table class="virtualTab">
	                                    <tr>
	                                        <th>입금은행</th>
	                                        <td>은행종류드롭다운</td>
	                                    </tr>
	                                    <tr>
	                                        <th>입금기한</th>
	                                        <td>2022년 12월 29일까지</td>
	                                    </tr>
	                                </table>
	                                <table class="phoneTab">
	                                    <tr>
	                                        <th>통신사</th>
	                                        <td>통신사 종류</td>
	                                    </tr>
	                                </table>
	                            </div>
	                        </td>
	                    </tr>
	                     -->
	                </table>
				</div>
				<br><br>
				
				<button type="button" id="purchaseBtn">주문</button>
				<button type="button" id="goBackBtn" onclick="location.href='cart.ca'">뒤로 가기</button>
			</form>
			<!-- 구매 동의 내용 -->
			<br><br><br>
        </div>
    </div>
    
    <script>
    	$("#purchaseBtn").click(function(){
    		// 주문 시 cartNo목록과 aiNo를 전달
			const aiNo = $("#aiNo").val();
//     		console.log("aiNo = " + aiNo);

    		let cnoArr = new Array();
    		<c:choose>
    			<c:when test="${not empty clist}">
    				<c:forEach var="c" items="${clist}" varStatus="status">
    					cnoArr.push(${c.cartNo});
    				</c:forEach>
    			</c:when>
    			<c:otherwise>
    			</c:otherwise>
    		</c:choose>
//     		console.log(cnoArr);

    		var cnoArrStr = cnoArr.join(",");
//     		console.log(cnoArrStr);

    		location.href="insert.or?cnoArr="+cnoArrStr+"&aiNo="+aiNo;
    	});
    
    
    	// 첫 화면은 신용카드 탭 표시
	    $(".cardTab").css("display","block");
		$(".accountTab").css("display","none");
		$(".virtualTab").css("display","none");
		$(".phoneTab").css("display","none");
		
		// 탭 변경 시 출력 변경
    	$("input[name='payType']:radio").change(function(){
			var temp = this.value;    		
// 			console.log(temp);
			if(temp==1){
		    	$(".cardTab").css("display","block");
				$(".accountTab").css("display","none");
				$(".virtualTab").css("display","none");
				$(".phoneTab").css("display","none");
			}
			else if(temp==2){
				$(".cardTab").css("display","none");
				$(".accountTab").css("display","block");
				$(".virtualTab").css("display","none");
				$(".phoneTab").css("display","none");
			}
			else if(temp==3){
				$(".cardTab").css("display","none");
				$(".accountTab").css("display","none");
				$(".virtualTab").css("display","block");
				$(".phoneTab").css("display","none");
			}
			else if(temp==4){
				$(".cardTab").css("display","none");
				$(".accountTab").css("display","none");
				$(".virtualTab").css("display","none");
				$(".phoneTab").css("display","block");
			}
    	});
		
		// 배송지 변경
		$("#changePackageInfo").click(function(){
			console.log("changePakageInfo");
			
			const popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
			window.open("shipping.go", '_blank', popupOptions);
		});
		
		// 기본배송지 버튼 클릭
		$("#defaultPackageInfo").click(function(){
// 			var name = $("#receiverInfoTBL").find('td').eq(0).html();
// 			var address = $("#receiverInfoTBL").find('td').eq(1).html();
// 			var phone = $("#receiverInfoTBL").find('td').eq(2).html();
// 			var comment = $("#receiverInfoTBL").find('td').eq(3).html();
// 			console.log("name : "+name);
// 			console.log("address : "+address);
// 			console.log("phone : "+phone);
// 			console.log("comment : "+comment);
			$("#receiverInfoTBL").find('td').eq(0).html('${loginUser.memberName }');
			$("#receiverInfoTBL").find('td').eq(1).html('${loginUser.memberAddress }');
			$("#receiverInfoTBL").find('td').eq(2).html('${loginUser.memberPhone }');
		});
		
		// 배송메세지 모달창으로 입력하기
		$("#insertComment").click(function(){
			console.log("insertComment is clicked");
		});
		
		
    </script>
    
</body>
</html>