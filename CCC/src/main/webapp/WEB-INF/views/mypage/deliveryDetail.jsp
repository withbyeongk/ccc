<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .orderdetail content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray !important;
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
        
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
    <div class="orderdetail content">
        <br><br>
        <div class="innerOuter">
            <h2 align="center">배송상세</h2>
            <br>
<!--             <a class="btn btn-secondary" style="float:right;" href="">주문상세</a> -->
            <br><br>
            
	            <p>주문자: ${loginUser.memberName}님</p>
	            
	            <!-- 배송상태를 나타내는 영역 -->
	               <c:choose>
		            <c:when test="${deliInfo.orderDeliveryStatus}=='N'">
			            <!-- 배송상태에 따라 다르게 출력한다. -->
		                <!-- if 만약 도착했다면? -->
		                <h3>나오남?</h3>
		                <p>날짜 도착완료</p>
		                <p>고객님이 주문하신 상품이 배송완료 되었습니다.</p>
		            </c:when>
		            <c:otherwise>
		               <!-- if 만약 도착하지 않았다면 -->
		               <p>배송준비중</p>
		            </c:otherwise>
	               </c:choose>
	            <br>
	            <br>
	            
	            <!--한 상품에 대한 테이블영역 -->
	           <h3>받는사람 정보</h3> 
	           <table id="contentArea" algin="center" class="table">
	             <tr>
	              <td>받는 사람</td>
	              <td>${loginUser.memberName}</td>
	              <td></td>
	              <td></td>
	             </tr>
	             <tr>
	              <td>받는 주소</td>
	              <td>우편번호: ${deliInfo.orderZipCode}</td>
	              <td colspan="1">주소: ${deliInfo.orderAddress} ${deliInfo.orderAddressDetail}</td>
	              <td></td>
	             </tr>
	             <tr>
	              <td>배송요청사항</td>
	              <td>${deliInfo.orderComment}</td>
	              <td></td>
	              <td></td>
	             </tr>
	             <tr>
	              <td>핸드폰</td>
	              <td>${deliInfo.orderPhone}</td>
	              <td></td>
	              <td></td>
	             </tr>
	             <tr>
	              <td></td>
	              <td></td>
	              <td></td>
	              <td></td>
	             </tr>
		       </table>
		       
		       <!--배송영역 -->
		        <h3>배송정보영역</h3>
		        <table id="contentArea" algin="center" class="table">
	             <tr>
	              <td>송장번호</td>
	              <td></td>
	              <td>${deliInfo.orderInvoidNo}</td>
	             </tr>
	             <tr>
	              <td>배송비</td>
	              <td></td>
	              <td>2,500원
	              </td>
	             </tr>
	            <tr>
	              <td>택배회사</td>
	              <td></td>
	              <td>우체국</td>
	             </tr>
		       </table>
		       
		       <br><br>
		       <br>
		       <br>
		       
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" href="javascript:history.back();">상품목록으로</a>
            </div>
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
        </div>
       <br><br>
    </div>
    
</body>
</html>