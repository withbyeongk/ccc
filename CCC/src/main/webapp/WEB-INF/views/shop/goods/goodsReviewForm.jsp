<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            background-color:rgb(247, 245, 245);
            width:100%;
            height : 800px;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:70%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        #enrollForm>table {
        	width:100%;
        }
        #enrollForm>table * {
        	margin:5px;
        }
        #myform fieldset{
			display: inline-block;
			direction: rtl;
			border:0;
      	}
      	#myform fieldset legend{
			text-align: right;
		}
      	#myform input[type=radio]{
			display: none;
		}
      	#myform label{
          	font-size: 3em;
          	color: transparent;
          	text-shadow: 0 0 0 #cfcfcf;
      	}
      	#myform label:hover{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }
      	#myform label:hover ~ label{
          	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
      	}
      	#myform input[type=radio]:checked ~ label{
			text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }
      	#reviewContents {
          	width: 100%;
          	height: 150px;
          	padding: 10px;
          	box-sizing: border-box;
         	border: solid 1.5px #b9b9b9;
          	border-radius: 5px;
          	font-size: 16px;
          	resize: none;
          	position : relative;
          	top : -20px;
      	}

      	#starc{
	      	float : right;
	      	position : relative;
	      	top : -50px;
      	}
      	.text-bold{
			font-size: 20px;
			color:#b1b1b1;
      	}

    </style>
</head>
<body>

    <!-- 네비바 -->
 	<jsp:include page="/WEB-INF/views/shop/goods/goodsNavi.jsp"/>
 	
    
	<br><div class="content" style="background-color: #e6e6e6;" ><br><br><br>

        <div class="innerOuter">
        	<form action="review.go" method="post" enctype="multipart/form-data">
				<div class="container" class="mb-3" name="myform" id="myform">
					<span id="cbadge" class="badge badge-pill badge-secondary" style="background-color:#b1b1b1;">리뷰</span>
					<h1 id="title1" style="color:#F07D9C;">Review Page &nbsp;</h1>
					<input type="hidden" id="gno" name="goodsNo" value="${gno}">
						<fieldset id="starc">
							<span class="text-bold"> 별점을 선택해주세요 </span>
							<input type="radio" class="reviewStar" name="grScore" value=5 id="rate1"><label for="rate1">★</label>
							<input type="radio" class="reviewStar" name="grScore" value=4 id="rate2"><label for="rate2">★</label>
							<input type="radio" class="reviewStar" name="grScore" value=3 id="rate3"><label for="rate3">★</label>
							<input type="radio" class="reviewStar" name="grScore" value=2 id="rate4"><label for="rate4">★</label>
							<input type="radio" class="reviewStar" name="grScore" value=1 id="rate5"><label for="rate5">★</label>
						</fieldset>
					<div><textarea type="text" class="col-auto form-control" name="grContent" id="reviewContents" placeholder="캐캐캐 ('CHAx3')를 애용해 주시는 고객님들이 남겨주신 평점과 감상을 바탕으로, 다양한 정보를 전달하는 리뷰 서비스입니다. (글자 수 200자 제한)" required></textarea></div>
					
					<table>
						<td width="680px">
							<input type="file" id="upfile" class="form-control-file border" name="upfile">
						</td>
						<td>
							<div align="center">&nbsp;&nbsp;
				                <button type="submit" class="btn btn-dark" style="background-color:#F07D9C; border:none;">리뷰 작성</button>
				                <button type="reset" class="btn btn-outline-dark" style="border-color:#7a7a7a;; color:##7a7a7a;">취소하기</button>
				            </div>
						</td>
					</table>
				</div>
            </form>
        </div><br><br>
    </div>
    
    
    
    
    
</body>
</html>