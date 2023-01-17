<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
.layerPopup img{
margin-bottom : 20px;}
.layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,.5); z-index:9000}
.layerPopup .layerBox {    z-index:10000;   
position:fixed; left:85%; top:48%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
.layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
.layerPopup .layerBox .btnTodayHide {
font-size:14px; font-weight:600; color:black; 
float: left;text-decoration:none;width: 150px; 
height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
}
.layerPopup div{
	display : inline;
}
.layerPopup form{
	margin-top : 5px;
	font-size:16px; font-weight:600;
	weight: 100%;
	height : 30px;
	line-height:30px
}
.layerPopup #close {
font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
}
.layerPopup a{
	text-decoration : none;
	color : black;width: 50px;height : 40px;
}
</style>
</head>
<body>
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    <div class="layerBox">
        <h1 class="title">★☆★☆★☆★☆여기는 상희 누나의 거묵목을 위한 광고 Time~ ★☆★☆★☆★</h1>
        <div class="cont">
            <p>
           <a href="https://siape.veta.naver.com/fxclick?eu=EU10041893&amp;calp=1&amp;oj=ZagUyei1lSi1sz%2FmQHaEPGQnwj3rKsbt%2F0NVVeCeJY73NSIJBlfTKYRCvKvkZTDeU4aI6X226aRegwtn7vjn6pDa%2BNUuE6p%2B5aQl4tLKFQ5WJZA2pPA1%2FfW1YEqVwubmAQMCMuhPEN1eKWECU5F7ncXB9pACWL46G%2Bp0aDnjKnP6Q03gbIO7AU9SANRnAatvwry52r%2Fy5bW%2Fm%2FXR9pmVJcUx5CllgxRZl2sG4o3tArfV7uTRyOLzvk3UTytQsTyLR9%2FpxBXquhg&amp;ac=8702301&amp;src=6264566&amp;br=4110257&amp;evtcd=P901&amp;x_ti=1350&amp;tb=&amp;oid=&amp;sid1=&amp;sid2=&amp;rk=a5f2d659b25e5139e8c326ed2d82cbb8&amp;eltts=ELqDgh8gEBizpBYd7ow6ew%3D%3D&amp;lu=&amp;brs=Y&amp;" class="rbp_player_wrap_link" target="_blank" aria-label="[광고]말도 안되는 사상최초 1&amp;1 OPEN"><video class="rbp_video" data-role="innerVideo" width="350" height="200" poster="https://ssl.pstatic.net/melona/libs/1429/1429481/96f7f01a5cacc8f6600d_20221229185423389.jpg"><source class="rbp_video_source" src="https://tvetamovie.pstatic.net/libs/1429/1429481/efca293161c7b1df3a0f_20221205165107363.mp4-pHIGH-v0-f190559-20221229185433977.mp4" type="video/mp4"></video></a>
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
      	<div class="ns-ttora-e-13 cropped-image-intermedia-box cropped-image-no-overflow-box " x-ns-ttora-e="13" x-remove="false"></div>

		 <label for="chkbox">오늘 하루동안 보지 않기</label></div>
		<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
		</form>
	</div>
</div>

<script language="JavaScript">
//head 태그 안에 스크립트 선언
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
</script>
 <script language="Javascript">
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>

</body>
</html>