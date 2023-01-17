<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<!-- DAUM 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>CCC::배송지 추가</title>
<style>
	#infoTBL{
		width:90%;
		font-size: 13px;
	}
	#infoTBL tr{
		height:30px;
	}
	#infoTBL th{
		width: 30%;
		background-color: lightpink;
	}
	.shippingTD input{
		height: 100%;
		width: 100%;
		border: none; 
		border-bottom: 1px dashed gray;
	}
	#resetBtn{
		width: 100px;
		height: 30px;
		background-color: lightgray;
		color: white;
		border: none;
		border-radius: 4px;
		vertical-align: middle;
		float: left;
		margin-top: 10px;
		margin-left: 5px;
	}
	#resetBtn:hover{
		font-size: 15px;
		font-weight: bold;
	}
	#submitBtn{
		width: 100px;
		height: 30px;
		background-color: rgb(255, 104, 104);
		color: white;
		border: none;
		border-radius: 4px;
		vertical-align: middle;
		float: left;
		margin-top: 10px;
		margin-left: 30px;
	}
	#submitBtn:hover{
		font-size: 14px;
		font-weight: bold;
	}
	#backBtn{
		width: 100px;
		height: 30px;
		background-color: lightblue;
		color: black;
		border: none;
		border-radius: 4px;
		vertical-align: middle;
		float: right;
		margin-top: 40px;
		margin-right: 30px;
	}
	#backBtn:hover{
		font-size: 14px;
		font-weight: bold;
	}
	#zipCodeBtn{
		width: 120px;
		height: 30px;
		background-color: lightgray;
		color: black;
		border: none;
		border-radius: 4px;
		vertical-align: middle;
	}
	#zipCodeBtn:hover{
		font-size: 14px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="addressInsertOuter">
		<h4 align="center">배송지 추가</h4>
		<hr style="height:3px; background-color:gray;">
		<div class="form-area">
			<form action="infoInsert.sh" align="center" method="post">
				<table id="infoTBL">
					<tr>
						<td colspan="2" style="color: coral">배송지는 최대 5개까지 저장할 수 있습니다.</td>
					</tr>
					<tr>
						<th>받는 사람</th>
						<td class="shippingTD"><input type="text" id="receiverName" placeholder="받는 사람 이름을 입력해 주세요." name="receiverName" required></td>
					</tr>
					<tr>
						<th>받는 곳</th>
						<td class="shippingTD"><input type="text" id="addressName" placeholder="받는 곳 이름을 입력해 주세요." name="addressName" required></td>
					</tr>
					<tr>
						<td class="shippingTD"><input type="text" id="zipCode" name="zipCode" placeholder="우편번호"></td>
						<td><input type="button" id="zipCodeBtn" onclick="getPostcode();" value="우편번호 찾기" style="margin-left:10px;"></td>
					</tr>
					<tr>
						<td colspan="2" class="shippingTD"><input type="text" id="address" name="address" placeholder="받는 곳 주소" required></td>
					</tr>
					<tr>
						<td class="shippingTD"><input type="text" id="extraAddress" placeholder="참고항목"></td>
						<td class="shippingTD"><input type="text" id="addressDetail" name="addressDetail" placeholder="받는 곳 상세 주소" required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td class="shippingTD"><input type="text" id="phone" placeholder="ex)010-0000-0000" name="phone" required></td>
					</tr>
					<tr>
						<th>배송 메세지</th>
						<td class="shippingTD"><input type="text" id="comment" placeholder="배송메세지를 입력해 주세요." name="comment"></td>
					</tr>
					<tr>
						<th>기본 배송지</th>
						<td>
							<input type="checkbox" id="basicChk" name="basicChk" value="Y">
							<span style="font-size:7px;color:coral;">체크하면 기본배송지로 추가됩니다.</span>
						</td>
					</tr>
				</table>
				<button type="submit" id="submitBtn">저장</button>
				<button type="reset" id="resetBtn">초기화</button>
				<button type="button" id="backBtn" onclick="location.href='shipping.go';">뒤로가기</button>
			</form>
		</div>
	</div><br>
	<script>
		// 우편번호 kakao API 사용
		function getPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipCode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addressDetail").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>