<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>Document</title>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    <!-- 테이블관련 cdn -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
    
    <style>
    .outer {
	    margin-top: 200px; /*위로부터 50px만큼 여백*/	
    }
    
    #table_id {
	    margin: auto; /*가운데 정렬*/
    }
    


    
    
    </style>
    
</head>
<body>
		
		<div class="outer">	
		
	            <h2 align="center">회원 상세조회</h2>  <br>
	
				<table id="table_id" class="table table-striped table-bordered" style="width:50%">
				        <thead>
				            <tr>
				           		<th>관리자번호</th>
				                <th>이름</th>
				                <th>아이디</th>
				                <th>전화번호</th>
				                <th>이메일</th>
				                <th>입사일</th>
				            </tr>
				        </thead>
				       
				        <tbody  id="test">	
							<tr>
								<td>${a.aNo }</td>
								<td>${a.aName }</td>
								<td>${a.aId }</td>
								<td>${a.aPhone }</td>
								<td>${a.aEmail }</td>
								<td>${a.aHireDate }</td>
								
							</tr>
							
			         	</tbody>
				</table>

				
	</div>
	
	
	


	
	
</body>
</html>