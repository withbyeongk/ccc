<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
  

<!DOCTYPE html>
<html lang="en">
    <head>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
       <!-- Custom fonts for this template-->
  	  <link href="resources/memberAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
      <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

   	  <!-- Custom styles for this template-->
      <link href="resources/memberAdmin/css/sb-admin-2.min.css" rel="stylesheet">
    
    
    
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HOME</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/memberAdmin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    
    
    	<!-- 알람 메세지 영역 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">${loginAdmin.getaName()} 님, 환영합니다!</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.ad">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            
                 
                 
                 
             <!-- profile-->
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                &ensp;&ensp;<img src="resources/memberAdmin/assets/img/song2.jpg" alt="..." class="img-circle profile_img">

              </div>
            </div>
                            
                            
                            
                            
                            
                            <a class="nav-link" href="mainAdmin.ad">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                               	MAIN ADMIN
                            </a>
                            <div class="sb-sidenav-menu-heading">Menu</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	Admin List
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminList.ad">관리자조회</a>
                                    <a class="nav-link" href="insert.ad">관리자등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Detail</div>
                            <a class="nav-link" href="resources/memberAdmin/charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="resources/memberAdmin/tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        	관리자: ${loginAdmin.getaName()}
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">TODAY</h1>
                        <ol class="breadcrumb mb-4">
                          <li class="breadcrumb-item active">&emsp;회원관리</li>
                        </ol>
                       

 				<!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-danger text-uppercase mb-1">
                                               	 &ensp;GOODS 누적 판매량</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&ensp;${countOrder} 개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                                 &ensp;전체 회원수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&ensp;${listCount}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-success text-uppercase mb-1">목표 회원 달성률
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">

                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">&ensp;<fmt:formatNumber value="${listCount/60}" type="percent"/><br/></div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-success" role="progressbar"
                                                            style="width: ${listCount/60*100}%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-s font-weight-bold text-info text-uppercase mb-1">
                                                 &ensp;미답변 게시글 </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&ensp;${qCount }건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        	연도별 가입자수   		
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    	   월별 캐릭터수
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                               	<!-- 삭제버튼 구현 --> 
                               	<div id="deleteKey" style="float:right">
                 				<a class="btn btn-outline-dark"  id="checkAll">전체선택</a>
                 				<a class="btn btn-outline-dark"  id="unCheckAll">전체해제</a>
                 				<a class="btn btn-secondary"  onclick="deleteClick()">선택회원 차단</a>
                 				</div>
                               
                                <form action="excelDownload.ad" method="post">
                                	<input type="submit" class="btn btn-success" value="EXCEL 다운로드">	
								</form>
                              </div>
	                            <div class="card-body">
	                                <table id="datatablesSimple">
	                                
	                                    <thead>
	                                        <tr>
	                                            <th><input type="checkbox"></th>
	                                            <th>회원번호</th>
	                                            <th>회원아이디</th>
	                                            <th>회원이름</th>
	                                            <th>성별</th>
	                                            <th>나이</th>
	                                            <th>이메일</th>
	                                            <th>회원등급</th>
	                                            <th>회원점수</th>
	                                            <th>가입일</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </thead>
	          			   
			          			   
			          			<tbody>	
				                   <c:forEach var="m" items="${mList}">
										<tr>
											<td><input type="checkbox" name="check" id="multiCheck" value="${m.memberName }"></td> 
											<td>${m.memberNo }</td>
											<td>${m.memberId }</td>
											<td>${m.memberName }</td>
											<td>${m.memberGender }</td>
											<td>${m.memberAge }</td>	
											<td>${m.memberEmail }</td>
											
											<c:choose>
												<c:when test="${m.memberGradeNo eq 1}">
													<td>${m.memberGradeNo }&emsp;&ensp;<span class='badge badge-pill badge-danger'>V.I.P</span></td>
												</c:when>
												
												<c:when test="${m.memberGradeNo eq 2}">
													<td>${m.memberGradeNo }&emsp;&ensp;<span class='badge badge-pill badge-warning'>Gold</span></td>
												</c:when>
												
												<c:when test="${m.memberGradeNo eq 3}">
													<td>${m.memberGradeNo }&emsp;&ensp;<span class='badge badge-pill badge-info'>Silver</span></td>
												</c:when>
												
												<c:when test="${m.memberGradeNo eq 4}">
													<td>${m.memberGradeNo }&emsp;&ensp;<span class='badge badge-pill badge-secondary'>Bronze</span></td>
												</c:when>
												
					                			<c:otherwise>
					                   				<td>${m.memberGradeNo }&emsp;&ensp;<span class='badge badge-pill badge-secondary'>Stone</span></td>
					                			</c:otherwise>
											</c:choose>
											
											<td>${m.memberPoint }</td>
											<td>${m.memberCreateDate }</td>
											<td align="center"><button type="button" id="detailMemberBtn" class="btn btn-outline-success btn-sm">상세보기</button></td> 
										</tr>
									</c:forEach>
			         			</tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>

            </div>
        </div>

        

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/memberAdmin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/memberAdmin/assets/demo/chart-area-demo.js"></script>
        <script src="resources/memberAdmin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/memberAdmin/js/datatables-simple-demo.js"></script>
        
        
        <script>
        
     	//회원삭제
        function deleteClick(){
    	 
			var checkBoxArr = []; 
			$("input:checkbox[name='check']:checked").each(function() {
				checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
          		console.log(checkBoxArr);
			});
			
			//ajax 이용
			var delConfirm=confirm("선택한 회원을 차단 하시겠습니까?");

					if(delConfirm==true){
			
			
	          $.ajax({
		              url: "deleteClickMember.ad",
		              data: {checkBoxArr : checkBoxArr},   // check seq 값을 가지고 있음.
		              success: function(result){
		              	console.log(result);
		          
		              	if(result == "yes"){
	    					alert("회원이 차단되었습니다");
	    					$("#multiCheck").val("");
		    				location.href="member.ad";
	    					
	    				}else{
	    					alert("회원 차단 실패하였습니다");
	    				}
		              	
		              },
		              error: function() {
		            	  console.log("통신실패");
		              }  
	           });
        
			}
     }
     
      //체크박스 전체선택,전체해제
        $(document).ready(function(){
        
            $("#checkAll").click(function() {
                $("input[name=check]:checkbox").prop("checked",true); // name이 chkbox인 input 타입들의 checked값을 "true"로 바꿈
            });
            
            $("#unCheckAll").click(function() {
                $("input[name=check]:checkbox").prop("checked",false); // name이 chkbox인 input 타입들의 checked값을 "false"로 바꿈
            });
        });
     
      
      	
      	
      	//회원상세보기
		$(function(){
			$("#datatablesSimple>tbody>tr>td>button").click(function(){
			console.log($(this).parents().eq(1).children().eq(1).text());
			location.href="memberDetail.ad?mno="+$(this).parents().eq(1).children().eq(1).text();
			})
		})
      
        </script>
        
        

	<script type="text/javascript">
		
            var context = document.getElementById('myAreaChart').getContext('2d');
            var pie = document.getElementById('myBarChart').getContext('2d');


            let today=new Date();
    		var year=today.getFullYear();
    		
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	
                    labels: [
                        //x 축
                        year-5,year-4,year-3,year-2,year-1,year
                    ],
                    datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
                            data: [
                               // ${iList[0]}  x축 label에 대응되는 데이터 값
                               //13,25,39,58,43,20
                               ${countList[0]},${countList[1]},${countList[2]},${countList[3]},${countList[4]},${countList[5]}

                            ], 
                            backgroundColor: [
                                //색상
                                'rgb(59, 174, 218)', //파
                                'rgb(255, 99, 132)', //빨
                                'rgb(255, 212, 0)', //노
                                'rgb(255, 127, 0)', //주
                                'rgb(153, 102, 255)',//보
                                'rgb(0, 239, 145)' //초
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(59, 174, 218, 1)', //파
                                'rgba(255, 99, 132, 1)', //빨              
                                'rgba(255, 212, 0, 1)', //노
                                'rgba(255, 127, 0, 1)', //주
                                'rgba(153, 102, 255, 1)',//보
                                'rgba(0, 239, 145, 1)' //초
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                	   legend: {display: false},
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
            
            
            
            let now=new Date();
    		var month=now.getMonth()+1;
    		
    		//월
    		var arr = ${monthList};
			console.log(arr.join(','));
			
			//값
			var arr2 = ${countMonthList};
			console.log(arr2.join(','));
			
			
            var myChart = new Chart(pie, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	
                     //labels: [
                         //x 축
                        //'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'
                        //1,2,3,4,5,6,7,8,9,10,11,12
                   // ],
						
					labels:arr,
                    datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
                            data: [
                               //x축 label에 대응되는 데이터 값
                               //13,25,39,58,43,20,36,47,50,60,62,70
                               ${countMonthList[0]},${countMonthList[1]},${countMonthList[2]},${countMonthList[3]},${countMonthList[4]}
                               ,${countMonthList[5]},${countMonthList[6]},${countMonthList[7]},${countMonthList[8]},${countMonthList[9]}
                               ,${countMonthList[10]},${countMonthList[11]}
				
                            	

                            ], 
                            backgroundColor: [
                              //색상
              			 	 'rgba(255, 0, 0, 0.3)' //빨
              			 	 //'rgba(0, 255, 0, 0.3)' //초
              			 	 //'rgba(0, 0, 255, 0.3)'//파
              			  

                            ],
                            borderColor: [
                            	//경계선 색상
							'rgba(255, 0, 0, 0.3)' //빨
                          

                            ],
                          pointRadius:0,
                            fill:true,
                            borderWidth: 5 //경계선 굵기
       
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
                	   legend: {display: false},
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
 
            

        </script>

        
    </body>
</html>
