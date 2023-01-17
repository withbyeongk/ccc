<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>CCC::WorldCup</title>
    <style>
        #cupOuter{
/*             border: 1px solid red; */
            margin:auto;
            padding:auto;
            width: 70%;
        }
        .imgDiv{
            text-align: center; 
        }
        .cupImg{
            border: 1px solid black;
            width:48%;
            height: 550px;
        }
        .winDiv{
        	text-align: center;
        	display: none;
        }
        .winImg{
        	border: 1px solid black;
            width: 100%;
            height: 700px;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<br><br><br><br><br><br>
    <div id="cupOuter">
        <h1 align="center">캐릭터 월드컵</h1>
        <h4 align="center">최고의 캐릭터를 꼽아 보세요!!</h4>
        <br>
        <h1 align="center" id="stage"></h1>
        <div class="imgDiv">
            <img class="cupImg" id="leftImg" src="" alt="">
            <img class="cupImg" id="rightImg" src="" alt="">
        </div>
	    <div class="winDiv">
	    	<img class="winImg" id="winImg" src="" alt="">
	    </div>
    </div>

    <script>
    	let battleNo = ${clist.size()};		// 몇강인지?
    	let temp = battleNo;				// stage 수 계산하기 위한 변수.
		let stage = 0;						// 16강이면 4, 8강이면 3, 4강이면 2.
    	let cursor = 0; 					// LEFT, RIGHT 이미지 띄울 차례(index)를 가리키는 변수 
    	let nowRoundArr = new Array();		// 현재 라운드의 번호를 담을 배열
		let nextRoundArr = new Array();		// 다음 라운드로 넘어갈 번호를 담을 배열
		let winnerNo = 0;					// 우승작 번호
		
		while(temp>1){
			stage++;
			temp /= 2;
		}
    	
    	const imgPathArr = new Array();
    	const imgNoArr = new Array();
    	const imgNameArr = new Array();
    	
    	<c:forEach var="c" items="${clist}" varStatus="status">
    		nowRoundArr.push(${status.index});
    		imgPathArr.push("${c.changeName}");
    		imgNoArr.push(${c.charNo});
    		imgNameArr.push("${c.charName}");
    	</c:forEach>
    	
    	$(function(){
    		changeImage();					// 시작하자마자 이미지 띄울 수 있도록 함수 실행
    		$("#stage").html(battleNo+'강');	// 처음 몇 강인지 텍스트 변경
    	});
    	
        $("#leftImg").click(function(){
//         	console.log("LEFT CLICK : "+nowRoundArr[cursor]);
			nextRoundArr.push(nowRoundArr[cursor]);	// 다음 라운드로 넘어갈 캐릭터의 번호를 저장.
			cursor += 2;						// 이미지가 두개씩 표시되므로 두칸씩 넘어가도록 함.
			changeStage();						// stage 변경해야 하는지 판단하는 함수 실행(ex : 16강 -> 8강)
			changeImage();						// 이미지를 변경하는 함수
			
			winnerNo = nowRoundArr[cursor];		// 우승작 번호를 계속 갱신하도록 함. 가장 마지막에 클릭되는 것이 우승작이니까.
			
        });
        
        $("#rightImg").click(function(){
//             console.log("RIGHT CLICK : "+nowRoundArr[cursor+1]);
        	nextRoundArr.push(nowRoundArr[cursor+1]);
        	cursor += 2;
        	changeStage();
        	changeImage();

        	winnerNo = nowRoundArr[cursor+1];
        });
        
        function changeStage(){
        	if( cursor>(battleNo-2) ){				// 이미지를 띄워주는 커서가 현재 라운드의 (이미지 수 -2)를 넘어가면 다음 라운드로
        		battleNo /= 2;						// 8강-> 4강, 16강-> 8강. 이므로 나누기 2
        		cursor=0;							// 다시 0부터 이미지를 띄워야 하므로 초기화
        		$("#stage").html(battleNo+'강');
//         		console.log("changeStage : "+battleNo);
        		changeArr();						// 현재 라운드와 다음 라운드의 배열 정리
        		if(battleNo ==1){					// 결승이 끝나면 battleNo가 1이 됨.
        			$(".imgDiv").css("display","none");				// 기존의 이미지 두개 띄워진 화면 숨기기
    				$(".winDiv").css("display","block");			// 결승에 띄울 이미지  영역 노출
            		$("#stage").html("당신의 최고의 캐릭터!");
            		$("#winImg").attr("src", imgPathArr[winnerNo]);	// 우승 캐릭터 띄우기
    				return;
        		}
        	}
        };

    	function changeImage(){
//     		console.log("CHANGE IMAGE");
    		$("#leftImg").attr("src", imgPathArr[nowRoundArr[cursor]]);
//     		console.log("LEFT CURSOR : " + nowRoundArr[cursor]);
    		$("#rightImg").attr("src", imgPathArr[nowRoundArr[cursor+1]]);
//     		console.log("RIGHT CURSOR : " + nowRoundArr[cursor+1]);
    	};
    	
    	function changeArr(){
    		nowRoundArr = [];
//     		console.log("CHANGE ARRAY");
//     		console.log("배열변경 nextRoundArr : "+ nextRoundArr);
    		for(var i=0; i<nextRoundArr.length; i++){
	    		nowRoundArr.push(nextRoundArr[i]);
    		}
    		nextRoundArr = [];
//     		console.log("배열변경 nowRoundArr : "+ nowRoundArr);
    	};
    	
    </script>
    <br><br><br><br><br><br>
</body>
</html>