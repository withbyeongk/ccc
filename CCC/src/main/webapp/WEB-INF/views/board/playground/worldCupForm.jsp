<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCC::WorldCup</title>
<style>
	#goBtn{
		font-size: 12px;
		height: 30px;
		border-radius: 3px;
		width: 150px;
		margin-bottom: 3px;
		background-color: #EA4F4D;
		color: white;
		border:0px;
		margin-right:30px;
	}
	#goBtn:hover{
		font-size: 13px;
		color: white;
		font-weight: bold;
		background-color: rgb(243, 131, 131);
	}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div id="cupOuter" align="center">
    	<h1 align="center">캐릭터 월드컵</h1><br>
        <h4 align="center">최고의 캐릭터를 꼽아 보세요!!</h4>
        <br><br>
        <select id="selectbox" name="selectbox">
			<option value="16" selected>16강</option>              
			<option value="8">8강</option>
			<option value="4">4강</option>
		</select>
		<button type="button" id="goBtn" style="margin-left:20px;">캐릭터 월드컵 시작</button>
    </div>
    
    <script type="text/javascript">
    	$("#goBtn").click(function(){
    		const selectboxValue = $("#selectbox").val();
//     		console.log(selectboxValue);
			location.href="worldCup.ut?no="+selectboxValue;
    	});
		
    </script>
</body>
</html>