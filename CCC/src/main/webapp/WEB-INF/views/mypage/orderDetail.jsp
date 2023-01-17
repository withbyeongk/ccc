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
        .content {
            background-color: rgb(247, 245, 245);
            width: 80%;
            margin: auto;
        }

        .innerOuter {
            border: 1px solid lightgray !important;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }

        table * {
            margin: 5px;
        }

        table {
            width: 100%;
        }
    </style>
</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="center">주문상세</h2>
            <br>
            <div>
                        날짜: ${myOrderDetail.orderDate}일 <br>
                        주문번호: ${myOrderDetail.orderNo}
            </div>
			
            <hr style="color:lightgray">
           <!--상품개수만큼 돌려주는 테이블영역-->
           <c:forEach var="o" items="${orderDetail}">
            <table>
                <tr>
                    <td>
                        <div class="deliverystatus">
                            <img src="${o.goodsChangeName}" width="100" height="100" style="margin-top: 20px;">
                            <span style="font-size: 20px; color:green;">배송완료</span>
                        </div>
                        <br>
                        <div>
                        	<span>제품명:${o.goodsName}</span><br>
                            <span>가격:<fmt:formatNumber  value="${o.goodsPrice}" pattern="#,###원"/> </span><span>개수: ${o.quantity}개</span>
                        </div>
                    </td>
                    <td style="width:100px;" align="right;">
                        <div class="orderDetailbutton">
                            <button onclick="deliveryDetail('${o.orderNo}',${o.orderDetailNo})"   style="width:117px;margin-left: 100px;margin-bottom:8px; ">배송조회</button>
                            <button onclick="orderrefund('${o.orderNo}',${o.orderDetailNo})"  style="width:117px;margin-left: 100px;margin-bottom:8px; ">교환.반품신청</button>
                            <button align="right;" style="width:117px;margin-left: 100px;margin-bottom:8px; ">리뷰 작성하기</button>
                        </div>
                    </td>
                </tr>
                <hr style="color:lightgray">
            </table>
           <!--돌려주는 영역끝 --> 
           </c:forEach> 

            <br><br><br>
            <!--받는 사람 정보영역-->
            <span style="font-size: 16px; color:black;">받는 사람 정보</span>
            <hr style="width:100%; height:1px; background-color:black; ">
            <table>
                <tr>
                    <td>받는 사람</td>
                    <td>${loginUser.memberName}</td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>${loginUser.memberPhone}</td>
                </tr>
                <tr>
                    <td>받는 주소</td>
                    <td>${myOrderDetail.orderAddress}</td>
                </tr>
                <tr>
                    <td></td>
<!--                     <td>배송요청사항</td> -->
                    <td>${myOrderDetail.orderComment}</td>
                </tr>
            </table>

            <br><br><br><br><br>
            <!--결제정보 영역-->
            <span style="font-size: 16px; color:black;">결제 정보</span>
             <hr style="width:100%; height:1px; background-color:black; ">
            <table>
                <tr>
                    <td>
                        <div>총 상품가격 :<fmt:formatNumber  value="${myOrderDetail.orderFinalAmount}" pattern="#,###원"/></div> 
                        <div> 배송비 : <fmt:formatNumber  value="${myOrderDetail.deliveryFee}" pattern="#,###원"/> </div>
                    </td>
                </tr>

            </table>

            <br><br><br><br><br>
            <!--결제영수증 정보-->
            <span style="font-size: 16px; color:black;">결제영수증 정보</span>
            <hr style="width:100%; height:1px; background-color:black; ">
            <table>
                <tr>
                    <td>해당 주문건에 대해 구매 현금영수증 확인이 가능합니다.</td>
                    <td><button>현금영수증</button></td>
                </tr>
                <tr>
                    <td>해당 주문건에 대해 거래명세서 확인이 가능합니다.</td>
                    <td><button>거래명세서</button></td>
                </tr>
            </table>


            <br><br> <br><br>

            <div class="buttonarea" align="center">
                <button onclick="location.href='mypage.me'">주문목록 돌아가기</button>
                <button onclick="orderdelete('${o.orderNo}')">주문내역 삭제</button>
            </div>

            <br><br><br>
            <div class="infoarea">
                <h5>배송상품 주문상태 안내</h5>
            </div>

            <br>
            <div class="cancelinfoarea" style="background-color: lightgray; width: 100%; height: 400px;">
                <br>
                &nbsp; &nbsp;&nbsp;<h5>취소</h5>

                <span style="color:red;">취소/반품/교환 신청전 확인해주세요!</span>
                <br><br>

                <div>
                  <span style="position:relative;left: 5px;" >
                                      취소
                    - 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,
                                      취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 
                                      처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)
                    - 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.
                  </span>  
                </div>
                <br>

                <div >
                  <span style="position:relative;left: 5px;">
                                     반품
                    - 상품 수령 후 7일 이내 신청하여 주세요.
                    - 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.
                    - 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다.
                    <a href="">1:1 문의하기 > </a>
                  </span>   
                </div>

                <br>
                <div >
                  <span style="position:relative;left: 5px;">
                                      교환
                    - 상품의 교환 신청은 고객센터로 문의하여 주세요.
                    <a href="">1:1 문의하기 > </a>
                  </span>   
                </div>
            </div>
          </div>
        <br><br>
    </div>
    
       <script>
            //배송조회 버튼클릭시 사이트로 상세주문번호와 주문번호 보내는 스크립트
            function deliveryDetail(orderNo, orderDetailNo) {
              location.href = "delivery.my?orderNo=" + orderNo + "&orderDetailNo=" + orderDetailNo;
            }
       </script>

</body>

</html>