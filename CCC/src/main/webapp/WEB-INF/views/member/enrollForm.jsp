<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="apple-touch-icon" sizes="76x76" href="resources/paper-dashboard-master/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="resources/paper-dashboard-master/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Paper Dashboard 2 by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/paper-dashboard-master/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/paper-dashboard-master/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/paper-dashboard-master/assets/demo/demo.css" rel="stylesheet" />
  <!--제이쿼리 라이브러리-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
  
</head>
<body class="">
  <div class="wrapper ">

    <div class="main-panel"  style="background-color: #EA4F4D;">
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
            <a class="navbar-brand" href="javascript:;" style="font-weight: bold; color: white;">CCC 회원가입</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <div class="input-group-append">
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
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
          <div class="col-md-8">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">필수입력사항</h5>
              </div>
              <div class="card-body">
                <form  action="insert.me" method="post" onsubmit="return checked()">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control"  id="Id" name="memberId"  onkeyup="inputIdChk();" required>
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>비밀번호</label>
                        <input type="text" class="form-control" id="Pwd" name="memberPwd" placeholder="비밀번호는 4자리 ~ 12자리 이내로 입력해주세요." required>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>비밀번호 확인</label>
                        <input type="text" class="form-control" id="pwdChk" name="checkmPwd" required>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" name="memberName" >
                      </div>
                    </div>
                    </div>
                   <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>성별</label>
                        <input type="text" class="form-control" name="memberGender" >
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>나이</label>
                        <input type="text" class="form-control" name="memberAge" >
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>핸드폰</label>
                        <input type="text" class="form-control" name="memberPhone" >
                      </div>
                    </div>
                   </div>
                   
<!--                    <div class="row"> -->
<!--                     <div class="col-md-4 pr-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <label>휴대폰</label> -->
<!--                         <input type="text" class="form-control" id=""> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4 px-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <label></label> -->
<!--                         <input type="text" class="form-control" id=""> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4 pl-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <label></label> -->
<!--                         <input type="text" class="form-control" > -->
<!--                       </div> -->
<!--                     </div> -->
<!--                    </div> -->
                   
                   <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" name="memberEmail" >
                      </div>
                    </div>
                   </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" name="memberAddress">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round">회원가입</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <script>
      
      
         <!--아이디중복확인-->
	     function inputIdChk() {
	      	
		    	 //아이디요소
		    	 var userId = $("#Id").val();
		    	
		    	 //아이디 공백 막기
		   		 if(userId==""){
		   			alert("아이디를 입력해주세요.")
		   			$("#Id").focus();
		   			return false;
		   		 }
		    	 
		      $.ajax({
		    	  url: "IdCheck.do",
		    	  data:{userId,userId},
		    	  success: function(result) {
		    		  if (result=="NNNNN") {
							alert("이미 존재하거나 탈퇴한 회원아이디입니다.");
							$("#Id").val(""); //아이디입력 공백
							$("#Id").focus();
						
						} else {
	                        alert("사용가능한 아이디입니다.");
							
						}
				    },
				    error: function() {
						console.log("통신실패");
					}
		    	  
		        });	 
		   }
      
      
	     <!--회원가입 유효성 검사-->
		  function checked(){
		      	
	     		var p1 = document.getElementById('Pwd'); //비번
	     		var p2 = document.getElementById('pwdChk'); //비번중복체크
		      	var pw = $("#Pwd").val(); //비번값
		      	
		    	
		      	//비밀번호 정규식
		      	if(pw.length < 4 || pw.length > 12){
		      	  alert("비밀번호는 4자리 ~ 12자리 이내로 입력해주세요.");
		      	  p1.value="";
		      	  p2.value="";
		   		  p1.focus();
		      	  return false;
		      	 }else if(pw.search(/\s/) != -1){
		      	  alert("비밀번호는 공백 없이 입력해주세요.");
		      	  p1.value="";
		      	  p2.value="";
		   		  p1.focus();
		      	  return false;
		      	 }
		      
		  		//비밀번호 일치 확인
		  		   if(p1.value != p2.value){
		     			alert("비밀번호가 일치하지 않습니다.");
		     			p2.value="";
		     			p2.focus();
		     			return false;
		     		}
		     		else{
		     			return true;
		     		}
		  		
		   }   
      </script>
      
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
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
  <script src="resources/paper-dashboard-master/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="resources/paper-dashboard-master/assets/demo/demo.js"></script>
</body>

</html>