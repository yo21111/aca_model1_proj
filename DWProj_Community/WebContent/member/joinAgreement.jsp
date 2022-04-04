<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입 동의</title>
<link rel="stylesheet" href="/style/style_Templates.css">
</head>
<body>
	<jsp:include page="/templates/header.jsp" />
	<div id="wrap">
		<div id="chkAllArea">
			<label for="chkAll">
			 	<input type="checkbox" id="chkAll">
				이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.
			</label>
		</div>

		<div id="contents" class="joinAgree">

			<div class="termArea">
				<h3>[필수] 이용약관 동의</h3>
				<iframe src="/templates/usingAgree.jsp" class="usingAgree"></iframe>
				<label> 이용약관에 동의하십니까? <input type="checkbox"
					class="agreeChk"> 동의함
				</label>
			</div>

			<div class="termArea">
				<h3>[필수] 개인정보 수집 및 이용 동의</h3>
				<iframe src="/templates/personalInfoAgree.jsp"
					class="personalInfoAgree"></iframe>
				<label> 이용약관에 동의하십니까? <input type="checkbox"
					class="agreeChk"> 동의함
				</label>
			</div>

			<div class="termArea">
				<h3>[선택] 개인정보 수집 및 이용 동의</h3>
				<iframe src="/templates/shopInfoAgree.jsp" class="shopInfoAgree"></iframe>
				<label> 이용약관에 동의하십니까? <input type="checkbox"
					class="agreeChk"> 동의함
				</label>
			</div>

		</div>
	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>