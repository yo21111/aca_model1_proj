<!-- 
	자유형식 GNB메뉴가 포함된 템플릿(header와 footer 등)이 있어야함
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/templates/header.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
    <link rel="stylesheet" href="/style/style_Common.css">
</head>
<body>
    <div id="wrap">
        
        <main id="main" class="dFlex">
        	<div id="lnb">
				<%@ include file="/templates/mainLNB.jsp"%>
			</div>
        	<div id="contents"></div>
        </main>
        
    </div>
    <!--div#wrap-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
<jsp:include page="/templates/footer.jsp"/>