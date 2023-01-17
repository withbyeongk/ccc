<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CCC::에러 페이지</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
    <br>
    <div align="center">
        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODAzMDRfNzUg/MDAxNTIwMTY2NzQ4NDUw.-ji-1-EnCNmV0QPgHS4QwPcMy020ZMfOQhGFYxPU_6Eg.YFymidnxROljYZeeZT8V-d_-80aQbs3GFGELVugNUXwg.PNG.vhghkwlqkdtk/0_%ED%86%A0%EB%81%BC_%EC%BA%90%EB%A6%AD%ED%84%B0_%EC%97%B0%EA%B5%AC_%EA%B0%9C%EA%B7%B8%EB%A7%8C%ED%99%94_%EB%B3%B4%EA%B8%B0_%EC%A2%8B%EC%9D%80_%EB%82%A0_%EC%9A%B0%EC%82%AC%EB%AF%B8.png?type=w2">
        <br><br>
        <h1 style="font-weight:bold;">${ errorMsg }</h1>
    </div>
    <br>

</body>
</html>