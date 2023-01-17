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
            border: 1px solid lightgray !important;
            width:100%;
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
            <h2 align="center">주문내역</h2>
            <br>
            <br><br>
            
             <div class="orderList button" align="center">
	                <a class="btn btn-primary" id="today-order" href="#" role="button" style="margin-left: 20px; background-color:black;">오늘</a>
	                <a class="btn btn-primary" id="week-order" href="#" role="button" style="margin-left: 20px;background-color:black;">일주일</a>
	                <a class="btn btn-primary" id="month-order" href="#" role="button" style="margin-left: 20px;background-color:black;">한달</a>
	                <a class="btn btn-primary" id="month3-order" href="#" role="button" style="margin-left: 20px;background-color:black;">세달</a>
	                <a class="btn btn-primary" id="month6-order" href="#" role="button" style="margin-left: 20px;background-color:black;">여섯달</a>
             <!-- <hr style="width:100%; padding:-40%; height:2px; background-color:black; "> -->
	         </div>
	         
             <br><br>
             <!-- 기존 테이블 영역 -->
             <table class="table" id="orderListArea" style="margin-left:10px ;width:100%; text-align: center;">
				 <tr style="background-color:#EA4F4D; vertical-align:middle;">
				    <th style="width:100px;">주문번호</th>
				    <th style="width:120px;">주문일자</th>
				    <th>굿즈명</th>
				    <th style="text-align: center;">굿즈이미지</th>
				    <th>굿즈가격</th>
				    <th>주문상태</th>
				    <th>주문취소</th>
				  </tr>
				 <c:forEach var="ro" items="${realoList}" >
				  <tr onclick="orderdetail('${ro.orderNo}')">
				    <td>${ro.orderNo}</td>
				    <td>${ro.orderDate}</td>
				    <td>${ro.goodsName}</td>
				    <td> <img alt="" src="${ro.goodsChangeName}" width="100" height="100"></td>
				    <td>
					   <fmt:formatNumber value="${ro.goodsPrice}" pattern="#,###원"/>
<%-- 				         ${ro.goodsPrice}원 --%>
				    </td>
				    <td>주문 진행중</td>
				    <td><a class="btn btn-primary" onclick="orderCancel('${ro.orderNo}');" id="month6-order" href="#" role="button" style="background-color:black;width:92px;">주문취소</a></td>
				  </tr>
				 </c:forEach >
			 </table>
             
             <!-- ajax로 새롭게 뿌려지는 영역 -->
             <table class="table" id="orderListArea" style="margin-left:80px ;width:90%; text-align: center;">
             </table>
            
           <script>
           
                function orderdetail(orderNo) {
                	console.log(orderNo);
					location.href="orderDetail.my?orderNo="+orderNo;
				}
           
               //페이지가 띄워지면 실행
                 $(function () {
                     // startDate는 시작일자를 언제로 설정할지를 결정하는 변수로
                     // startDate값에 따라 컨트롤러에서 시작일을 변경하도록 되어 있음
                     var startDay = 0;
                     $("#today-order").click(function () {
                         startDay = 1; // 오늘 날짜
                         console.log(startDay);
                         selectOrderList(startDay);
                     });
                     $("#week-order").click(function () {
                         startDay = 2;  // 일주일 전
                         selectOrderList(startDay);
                     });
                     $("#month-order").click(function () {
                         startDay = 3;  // 한 달 전
                         selectOrderList(startDay);
                     });
                     $("#month3-order").click(function () {
                         startDay = 4;  // 세 달 전
                         selectOrderList(startDay);
                     });
                     $("#month6-order").click(function () {
                         startDay = 5;  // 여섯 달 전
                         selectOrderList(startDay);
                     });
                 })

                 var selectOrderList = function (startDay) {
                     console.log("startDay : " + startDay);

                     $.ajax({
                         url: "selectoListbyDate.my",
                         data: {
                             startDay: startDay
                         },
                         type: "post",
                         success: function (realoList) {
                             console.log("통신성공");
                             console.log("realoList : " + realoList);

                             $("#orderListArea").html(realoList);

                             /* str += "<tr><td colspan='3' align='center'><h3>조회된 결과가 없습니다.</h3></td></tr>";
                             $("#orderListArea").html(str);*/
                         },
                         error: function () {
                             console.log("통신실패");
                         }
                     })
                 }
             </script>
            
			<br>
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="location.href='mypage.me';" >마이페이지로</a>
            </div>
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
        </div>
       <br><br>
    </div>
    
</body>
</html>