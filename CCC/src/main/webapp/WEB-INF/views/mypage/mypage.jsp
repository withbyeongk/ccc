<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="resources/paper-dashboard-master/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/paper-dashboard-master/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/paper-dashboard-master/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/paper-dashboard-master/assets/demo/demo.css" rel="stylesheet" />
</head>

<!--제이쿼리 라이브러리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="resources/paper-dashboard-master/assets/img/logo-small.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          ${loginUser.memberName}님 마이페이지
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="./dashboard.html">
              <i class="nc-icon nc-bank"></i>
              <p>대회참가내역>참가상세</p>
            </a>
          </li>
          <li>
            <a href="selectoListbyDate2.my">
              <i class="nc-icon nc-diamond"></i>
              <p>기간별주문목록</p>
            </a>
          </li>
          <li>
            <a href = "orderDetail.my?oNo=1">
              <i class="nc-icon nc-pin-3"></i>
              <p>상세주문목록</p>
            </a>
          </li>
          <li>
            <a href="cartList2.my">
              <i class="nc-icon nc-bell-55"></i>
               <p>장바2</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="nc-icon nc-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
            <a href="./tables.html">
              <i class="nc-icon nc-tile-56"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="./typography.html">
              <i class="nc-icon nc-caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./upgrade.html">
              <i class="nc-icon nc-spaceship"></i>
              <p></p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;" style="color:#EA4F4D; font-weight: bold"> my page </a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
            aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link btn-magnify" href="javascript:;">
                  <i class="nc-icon nc-layout-11"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link btn-rotate" href="javascript:;">
                  <i class="nc-icon nc-settings-gear-65"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
<!--                   <div class="col-5 col-md-4"> -->
<!--                     <div class="icon-big text-center icon-warning"> -->
<!--                       <i class="nc-icon nc-globe text-warning"></i> -->
<!--                     </div> -->
<!--                   </div> -->
                  <div class="col-7 col-md-8" onclick="location.href='profileEnroll.me'">
                    <div class="numbers">
                      <p class="card-category">회원정보</p>
                      <p class="card-title">
                      <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-money-coins text-success"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8" onclick="location.href='cartList2.my'">
                    <div class="numbers">
                         <p class="card-category">장바구니</p>
                      <p class="card-title">
                      <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-vector text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8" onclick="location.href='list.mychar2'">
                    <div class="numbers">
                      <p class="card-category">내 캐릭터</p>
                      <p class="card-title">
                      <p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body" onclick="location.href='wishList.my'">>
                <div class="row">
                  <div class="col-5 col-md-4">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-favourite-28 text-primary"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">관심내역</p>
                      <p class="card-title">
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
             <div class="card ">
	             <h3 style="font-size:25px;font-weight:bold;black;margin-left: 40px;margin-top:30px;">최근 주문 내역</h3>
	              <div><span><a href="selectoListbyDate2.my" style="float:right; margin-right: 200px;font-size: 20px;">더보기</a></span></div>
                  <br>
				 
				 <table class="table" id="orderListArea" style="margin-left:60px ;width:90%; text-align: center;">
					 <tr  style="background-color:#EA4F4D;">
					    <th></th>
					    <th style="width:80px;">주문번호</th>
					    <th style="width:200px;">주문일자</th>
					    <th style="width:280px;">굿즈명</th>
					    <th style="text-align: center;">굿즈이미지</th>
					    <th>굿즈가격</th>
					    <th>주문취소</th>
					  </tr>
					 <c:forEach var="ro" items="${realoList}" >
					  <tr onclick="orderdetail('${ro.orderNo}')">
					    <td></td>
					    <td>${ro.orderNo}</td>
					    <td>${ro.orderDate}</td>
					    <td>${ro.goodsName}</td>
					    <td><img src="${ro.goodsChangeName}" width="100" height="100" ></td>
					    <td>
					        <fmt:formatNumber value="${ro.goodsPrice}" pattern="#,###원"/>
					    </td>
					    <td><a class="btn btn-primary" onclick="orderCancel('${ro.orderNo}');" id="month6-order" href="#" role="button" style="background-color:black;width:92px;">주문취소</a></td>
					  </tr>
					 </c:forEach >
				 </table>
				 <br><br><br>
             </div>
            <div class="card">
              <br>
              <h3 style="color:black; margin-left:3%; margin-top:2%;">캐릭터별 좋아요 순위</h3>
              <div class="card-header" style="width:80%;">
                 <!--차트가 그려질 부분-->
				 <canvas id="myChart" style="margin-left:15%; margin-bottom:15%; width=400vh height=100vw" ></canvas>
              </div>
              <div class="card-body">
<!--                  <table border="1" align="center"> -->
<!--                   <tr> -->
<!-- 					<td>d</td>				                   -->
<!-- 					<td>d</td>				                   -->
<!-- 					<td>d</td>				                   -->
<!-- 					<td>d</td>				                   -->
<!-- 					<td>d</td>				                   -->
<!--                   </tr> -->
<!--                  </table> -->
               
              </div>
              <div class="card-footer">
                <hr>
                <div class="stats">
                </div>
              </div>
            </div>
            
			<script type="text/javascript">
			
				//주문내역 tr누르면 주문상세내역으로 가는 함수
			    function orderdetail(orderNo) {
                	console.log(orderNo);
					location.href="orderDetail.my?orderNo="+orderNo;
				}
			
			
				//페이지 로드되면 그래프가져오는 함수실행	
				$(document).ready(function(){ 
			 		  getGraph();
			 	});
					
				//ajax로 json방식의 데이터를 받습니다 
				function getGraph() {
					//캐릭터명 charName x축 데이터값 담을 곳 
					let charName = [];
					//캐릭터좋아요 charLike y축 데이터값 담을 곳 
					let charLike = [];
			
			    	 $.ajax({
			    		url: "dataSelect.my",
			    		type:"get",
			    		success: function(data) {
				   			
			    			 for (let i = 0; i<Object.keys(data).length;i++){
		    				      //console.log(data[i]); //객체하나씩 출력
		    				      //console.log((data)[i].charName); //x축에 넣음
		    				      //console.log((data)[i].charLike); //y축에 넣을 값
		 	    				  charName.push((data)[i].charName);  //x축 데이터 담을 곳에 넣어줌   				  
			    				  charLike.push(data[i].charLike); //y축 데이터 담을 곳에 넣어줌
			    			  }
			    			  //createGraph(); //그래프 생성함수 호출
			    			  createGraph(charName,charLike);
			    		 },
			    		 error: function() {
							console.log("통신실패");
						}
			    	 })
				}
					
			//그래프 생성함수
			function createGraph(charName,charLike) {
			   //변수명
			   var context = document.getElementById('myChart').getContext('2d');
			   var myChart = new Chart(context, {
			       type: 'bar', // 차트의 형태
			       data: { // 차트에 들어갈 데이터
					   labels:charName,
			           datasets: [
			               {   //데이터
			                   label: '캐릭터별 좋아요 순위', //차트 제목
			                   fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
			                   //x축 label에 대응되는 데이터 값
			                   data:charLike,
			                   backgroundColor: [
			                       //색상
			                       'rgba(255, 99, 132, 0.2)',
			                       'rgba(54, 162, 235, 0.2)',
			                       'rgba(255, 206, 86, 0.2)',
			                       'rgba(75, 192, 192, 0.2)',
			                       'rgba(153, 102, 255, 0.2)',
			                       'rgba(255, 159, 64, 0.2)',
			                       'rgba(255, 99, 132, 0.2)',
			                       'rgba(54, 162, 235, 0.2)',
			                       'rgba(255, 206, 86, 0.2)',
			                       'rgba(75, 192, 192, 0.2)',
			                       'rgba(153, 102, 255, 0.2)',
			                       'rgba(255, 159, 64, 0.2)'
			                   ],
			                   borderColor: [
			                       //경계선 색상
			                       'rgba(255, 99, 132, 1)',
			                       'rgba(54, 162, 235, 1)',
			                       'rgba(255, 206, 86, 1)',
			                       'rgba(75, 192, 192, 1)',
			                       'rgba(153, 102, 255, 1)',
			                       'rgba(255, 159, 64, 1)'
			                   ],
			                   borderWidth: 1 //경계선 굵기
			               }/* ,
			               {
			                   label: 'test2',
			                   fill: false,
			                   data: [
			                       8, 34, 12, 24
			                   ],
			                   backgroundColor: 'rgb(157, 109, 12)',
			                   borderColor: 'rgb(157, 109, 12)'
			               } */
			           ]
			       },
			       options: {
			           scales: {
			               yAxes: [
			                   {
			                       ticks: {
			                           beginAtZero: true
			                       }
			                   }
			               ]
			           }
			       }
			   });
			   console.log(myChart);
			  }
		    </script>
          </div>
        </div>
        
        <div class="row">
<!--           <div class="col-md-4"> -->
<!--             <div class="card "> -->
<!--               <div class="card-header "> -->
<!--                 <h5 class="card-title" style="color:blue"></h5> -->
<!--               </div> -->
<!--               <div class="card-body "> -->
<%--                 <canvas id="chartEmail"></canvas> --%>
<!--               </div> -->
<!--               <div class="card-footer "> -->
<!--                 <div class="legend"> -->
<!--                 </div> -->
<!--                 <hr> -->
<!--                 <div class="stats"> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-8"> -->
<!--             <div class="card card-chart"> -->
<!--               <div class="card-header"> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--               </div> -->
<!--               <div class="card-footer"> -->
<!--                 <div class="chart-legend"> -->
<!--                 </div> -->
<!--                 <hr /> -->
<!--                 <div class="card-stats"> -->
<!--                   <h3 style="color:red">영역3</h3> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
        </div>
      </div>
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">${loginUser.memberName}</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  
  <!--   Core JS Files   -->
  <script src="resources/paper-dashboard-master/assets/js/core/jquery.min.js"></script>
  <script src="resources/paper-dashboard-master/assets/js/core/popper.min.js"></script>
  <script src="resources/paper-dashboard-master/assets/js/core/bootstrap.min.js"></script>
  <script src="resources/paper-dashboard-master/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="resources/paper-dashboard-master/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="resources/paper-dashboard-master/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="resources/paper-dashboard-master/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
  <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="resources/paper-dashboard-master/assets/demo/demo.js"></script>
  <script>
    $(document).ready(function () {
      // Javascript method's body can be found in assets/assets-for-demo/js/demo.js
      demo.initChartsPages();
    });
  </script>
</body>
</html>