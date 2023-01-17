<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    
    
    <title>관리자 등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:100%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}

    </style>
    
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/profileList/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/profileList/css/styles.css" rel="stylesheet" />
        
        
        
        <meta name="description" content="Ceres admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />
		<meta name="keywords" content="Ceres theme, bootstrap, bootstrap 5, admin themes, free admin themes, bootstrap admin, bootstrap dashboard" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="utf-8" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="Ceres HTML Free - Bootstrap 5 HTML Multipurpose Admin Dashboard Theme" />
		<meta property="og:url" content="https://keenthemes.com/products/ceres-html-pro" />
		<meta property="og:site_name" content="Keenthemes | Ceres HTML Free" />
		<link rel="canonical" href="Https://preview.keenthemes.com/ceres-html-free" />
		<link rel="shortcut icon" href="resources/listDetail/theme/dist/assets/media/logos/favicon.ico" />
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Global Stylesheets Bundle(used by all pages)-->
		<link href="resources/listDetail/theme/dist/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="resources/listDetail/theme/dist/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		<!--end::Global Stylesheets Bundle-->
        
    
</head>
<body>

        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Enroll Admin</div>
                <div class="masthead-heading text-uppercase"></div>
            </div>
        </header>
     
        <!-- progress bar -->
         <div class="col">
           	<div class="progress progress-sm mr-2">
               <div class="progress-bar bg-warning" role="progressbar"
                   style="width: 100%" aria-valuenow="50" aria-valuemin="0"
                   aria-valuemax="100"></div>
           	</div>
      	</div>
      
      
      							<!--begin::Content-->
								<div class="flex-lg-row-fluid ms-lg-10">
									<!--begin::details View-->
									<div class="card mb-5 mb-xl-10" id="kt_profile_details_view">
										<!--begin::Card header-->
										<div class="card-header cursor-pointer">
											<!--begin::Card title-->
											<div class="card-title m-0">
												<h3 class="fw-bolder m-0">Enroll Admin Details</h3>
											</div>
											<!--end::Card title-->
											<!--begin::Action-->
											<a href="member.ad" class="btn btn-danger align-self-center">MAIN</a>
											<!--end::Action-->
										</div>
										<!--begin::Card header-->
										<!--begin::Card body-->
										<div class="card-body p-9">
											<!--begin::Row-->
		



        

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>관리자 등록</h2>
            <br>

            <form id="enrollForm" method="post" action="" enctype="multipart/form-data">
                <table algin="center">
                
                	<input type="hidden" id="" name="aGno" value="2">
                	
                	<tr>
                        <th><label for="aName">관리자명</label></th>
                        <td><input type="text" id="" class="form-control" name="aName" required></td>
                    </tr>
                	
                	<tr>
                        <th><label for="aId">아이디</label></th>
                        <td><input type="text" id="" class="form-control" name="aId"></td>
                    </tr>
                    
                    <tr>
                        <th><label for="aPwd">비밀번호</label></th>
                        <td><input type="password" id="" class="form-control" name="aPwd"></td>
                    </tr>
                    
                    <tr>
                        <th><label for="aEmail">이메일</label></th>
                        <td><input type="email" id="" class="form-control" value="" name="aEmail"></td>
                    </tr>
                    
                    <tr>
                        <th><label for="aHireDate">입사일</label></th>
                        <td><input type="date" id="" class="form-control" value="" name="aHireDate"></td>
                    </tr>
                    
                  	<tr>
						<th>첨부파일</th>
						<td><input type="button" id="addAttachBtn" value="첨부파일 추가">최대 4장까지 가능합니다. (사진/계약서 첨부 필수)</td>
					</tr>
                </table>
                
                <table align="center" id="addAttach-table">
					<tr>
						<th><label for="upfile"></label></th>
						<td><input type="file" id="upfile" class='form-control-file border' name='multifile' required></td>
					</tr>
				</table>
                
                
                
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    
    
    
    <script>
    	//첨부파일 영역 만들기
	    var idx = 1; //첨부파일추가 삭제 버튼의 고유 아이디값 지정을 위한 변수
		
		//파일추가 버튼이 클릭되면 실행되는 함수
		$("#addAttachBtn").click(function(){
			if( $("#addAttach-table tr").length < 4 ){ //테이블 tr의 수가 4보다 작으면 
				var addAttach = "<tr>"
							  + "<th><label for='upfile'></label></th>"
							  + "<td><input type='file' id='upfile' class='form-control-file border' name='multifile'></td>"
							  + "<td><a href='#this' name='delete' id='delete"+idx+"' class='btn'>삭제</a></td>";
				$("#addAttach-table").append(addAttach);
			}
			//삭제버튼을 클릭되면 실행되는 함수
			$( ("#delete"+idx) ).on("click",function(e){
				e.preventDefault(); //이벤트를 취소해주는 메소드
				fn_fileDelete($(this));
			});
			//삭제버튼 생성 후 1씩 증가하여 고유 아이디값을 가지도록 한다
			idx++;
		});
		
	    //첨부파일 추가 영역을 삭제해주는 메소드 (삭제버튼 클릭시)
		function fn_fileDelete(obj){
// 			console.log("삭제 file idx : "+obj.parent().prev().children().attr("id")); //id확인
			obj.parent().parent().remove();
		}
    
		 </script>

    
</body>
</html>