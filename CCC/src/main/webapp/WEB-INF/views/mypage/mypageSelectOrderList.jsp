<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
		<div id="">
		  <div> 
	        <table class="table" id="orderListArea" style="margin-left:10px ;width:100%; text-align: center;">
				 <tr style="background-color:#EA4F4D;">
				    <th style="width:100px;">주문번호</th>
				     <th style="width:120px;">주문일자</th>
				    <th>굿즈명</th>
				    <th style="text-align: center;">굿즈이미지</th>
				    <th>굿즈가격</th>
				    <th>주문상태</th>
				    <th>주문취소</th>
				  </tr>
				 <c:forEach var="ro" items="${realoList}" >
				  <tr>
				    <td>${ro.orderNo}</td>
				    <td>${ro.orderDate}</td>
				    <td>${ro.goodsName}</td>
				    <td> <img alt="" src="${ro.goodsChangeName}" width="100" height="100"></td>
				    <td>
					    <fmt:formatNumber value="${ro.goodsPrice}" pattern="#,###원"/>
				    </td>
				    <td>주문 진행중</td>
				    <td><a class="btn btn-primary" onclick="orderCancel('${ro.orderNo}');" id="month6-order" href="#" role="button" style="background-color:black;width:92px;">주문취소</a></td>
				  </tr>
				 </c:forEach >
			 </table>
<!-- 		<table> -->
<!-- 			<tr style="background-color:#EA4F4D; "> -->
<!-- 				<th ></th> -->
<!-- 				<th>주문번호</th> -->
<!-- 				<th>굿즈명</th> -->
<!-- 				<th>굿즈이미지</th> -->
<!-- 				<th>굿즈가격</th> -->
<!-- 			</tr> -->
<%-- 			<c:forEach var="ro" items="${realoList}" > --%>
<!-- 			<tr> -->
<!-- 				<td></td> -->
<%-- 				<td>${ro.orderNo}</td> --%>
<%-- 				<td>${ro.goodsName}</td> --%>
<%-- 				<td>${ro.goodsFilePath}||${ro.goodsChangeName}</td> --%>
<%-- 				<td>${ro.goodsPrice}</td> --%>
<!-- 			</tr> -->
<%-- 			</c:forEach > --%>
<!-- 		</table> -->
		  </div>
		 <br><br>
		</div>