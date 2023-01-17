<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>CCC::배송지관리</title>
<style>
	.addressManageHr{
		height: 2px;
		background-color: gray;
	}
	.packageInfoSection{
		margin : auto;
		width: 100%;
		height: 200px;
		border: 1px solid lightgray;
	}
	.addBackgroundColor{
		border: 2px solid blue;
	}
	.positionControl{
		margin-top: 20px;
		margin-left:20px;
	}
	.receiverName{
		font-weight: bold;
		font-size: 20px;
	}
	.basicAddrSpan{
		
	}
	.receiverName{line-height: 30px;}
	.receiverAddr{line-height: 30px;}
	.receiverPhone{line-height: 30px;}
	.receiverComment{line-height: 30px;}
	.receiverModify{line-height: 30px;}
	.receiverChoice{line-height: 30px;}
	.receiverModify{
		color: blue;
		background-color: lightblue;
		font-size: 20px;
		border: none;
		border-radius: 5px;
	}
	.receiverChoice{
		float: right;
		margin-right: 30px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		background-color: blue;
		border: none;
		border-radius: 10px;
	}
	.AddAddressInfo{
		width: 100%;
		height: 40px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		border: none;
		background-color: blue;
		border-radius: 10px;
	}
	
</style>
</head>
<body>
	<div class="addressManageOuter container-fluid">
		<br>
		<h4 align="center">배송지 선택</h4>
		<hr class="addressManageHr">
		<br>
		<div class="form-area">
			<form>
				<c:choose>
					<c:when test="${not empty aiList }">
						<c:forEach var="ai" items="${aiList}" varStatus="status">
							<c:choose>
								<c:when test="${status.index eq 0}">
									<div class="packageInfoSection addBackgroundColor">
								</c:when>
								<c:otherwise>
									<div class="packageInfoSection">
								</c:otherwise>
							</c:choose>
								<div class="positionControl">
									<input type="hidden" name="" value="${ai.addressNo }">
									<span class="receiverName">${ai.receiverName}</span>
									<c:if test="${status.index eq 0}">
										<span class="basicAddrSpan">기본배송지</span>
									</c:if><br>
									<span class="receiverAddr">${ai.address } ${ai.addressDetail }</span><br>
									<span class="receiverPhone">${ai.phone }</span><br>
									<span class="receiverComment">${ai.comment }</span><br>
									<button type="button" class="receiverModify" onclick="updateAddressInfo(${ ai.addressNo });">수정</button>
<!-- 									<button type="button" class="receiverChoice">선택</button> -->
									<button type="button" class="receiverChoice" onclick="changeAddr(${status.index});">선택</button>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</form>
		</div>
		<br>
		<button type="button" class="AddAddressInfo"><span class="AddAddressInfoTitle"> + 배송지 추가</span></button>
		<br><br>
		
	</div>
	<script>
		// 배송지 선택 시 정보 변경
		/*
		$(".receiverChoice").click(function(){
			console.log("receiverChoice is clicked");
			const rtbl = window.opener.document.getElementById("receiverInfoTBL");
			const td = rtbl.getElementsByTagName("td");
			
// 			const name = td[0].innerText;
// 			const address = td[1].innerText;
// 			const phone = td[2].innerText;
			
			console.log('${aiList[0].receiverName}');
			td[0].innerText = '${aiList[i].receiverName}';
			td[1].innerText = '${aiList[i].address} ${aiList[i].addressDetail}';
			td[2].innerText = '${aiList[i].comment}';
			
			window.close();
		});*/
		
		function changeAddr(i){
			console.log("changeAddr is clicked"+i);
			const rtbl = window.opener.document.getElementById("receiverInfoTBL");
			const td = rtbl.getElementsByTagName("td");
			
// 			const name = td[0].innerText;
// 			const address = td[1].innerText;
// 			const phone = td[2].innerText;
			
			// 코드 개더럽다. 이것때문에 배송지 수 제한 걸어야 함.
			
			// addressInfo 번호 전달
			const aiNo = window.opener.document.getElementById("aiNo");
				
			if(i==0){
				td[0].innerText = '${aiList[0].receiverName}';
				td[1].innerText = '${aiList[0].address} ${aiList[0].addressDetail}';
				td[2].innerText = '${aiList[0].phone}';
				td[3].innerText = '${aiList[0].comment}';
				
				$(aiNo).val( ${aiList[0].addressNo} );
				console.log(aiNo);
			}
			else if(i==1){
				td[0].innerText = '${aiList[1].receiverName}';
				td[1].innerText = '${aiList[1].address} ${aiList[1].addressDetail}';
				td[2].innerText = '${aiList[1].phone}';
				td[3].innerText = '${aiList[1].comment}';
				
				$(aiNo).val( ${aiList[1].addressNo} );
				console.log(aiNo);
			}
			else if(i==2){
				td[0].innerText = '${aiList[2].receiverName}';
				td[1].innerText = '${aiList[2].address} ${aiList[2].addressDetail}';
				td[2].innerText = '${aiList[2].phone}';
				td[3].innerText = '${aiList[2].comment}';
				
				$(aiNo).val( ${aiList[2].addressNo} );
				console.log(aiNo);
			}
			else if(i==3){
				td[0].innerText = '${aiList[3].receiverName}';
				td[1].innerText = '${aiList[3].address} ${aiList[3].addressDetail}';
				td[2].innerText = '${aiList[3].phone}';
				td[3].innerText = '${aiList[3].comment}';
				
				$(aiNo).val( ${aiList[3].addressNo} );
				console.log(aiNo);
			}
			else if(i==4){
				td[0].innerText = '${aiList[4].receiverName}';
				td[1].innerText = '${aiList[4].address} ${aiList[4].addressDetail}';
				td[2].innerText = '${aiList[4].phone}';
				td[3].innerText = '${aiList[4].comment}';
				
				$(aiNo).val( ${aiList[4].addressNo} );
				console.log(aiNo);
			}
			
			window.close();
		};
		
		
		function updateAddressInfo(addressInfoNo){
			console.log("updateAddressInfo " + addressInfoNo);
			location.href="infoUpdateForm.sh?addressInfoNo="+addressInfoNo;
		};
		
		
		$(".AddAddressInfo").click(function(){
			console.log("AddAddressInfo is clicked");
			location.href="infoInsertForm.sh";
		});
	</script>
	
</body>
</html>