<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/templates/header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/style/style_Login.css">
</head>
<body>
	<div id="wrap">
		<%
		if (id != null) {
		%>
		<div id="content">
			<b><%=id%></b>님 환영합니다.
		</div>
		<div id="btns">
			<button type="button" id="index">메인페이지로</button>
			<button type="button" id="logout">로그아웃</button>
			<button type="button" id="myPage">마이 페이지</button>
		</div>
		<%
		} else {
		%>

		<form action="/member/loginProc.jsp" name="loginFrm" method="post">
			<table>
				<tr>
					<td id="title" colspan="2">로그인</td>
				</tr>
				<tr>
					<td id="errorMsg" colspan="2"></td>
				</tr>
				<tr>
					<td class="subtitle">아 이 디</td>
					<td><input id="id" type="text" name="id"></td>
				</tr>
				<tr>
					<td class="subtitle">비밀번호</td>
					<td><input id="pass" type="password" name="pass"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="loginBtn">로그인</button>
						<button type="button" id="regPage">회원가입</button>
					</td>
				</tr>
			</table>

			<div id="utill">
				<div id="loginOpt" class="dFlex">
					<div id="loginKeep">
						<label> <input type="checkbox"> <span>로그인
								상태 유지</span>
						</label>
					</div>

					<div id="loginSecurity">
						<span>IP보안</span> <span>ON</span>
					</div>
				</div>
				<!------------ div#loginOpt ------------>

				<div id="findArea">
					<ul id="findUL" class="dFlex">
						<li class="findLi"><a href="#">아이디 찾기</a></li>
						<li class="findLi">|</li>
						<li class="findLi"><a href="#">비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
		</form>

		<%
		}
		%>
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_login.js"></script>
</body>
</html>
<jsp:include page="/templates/footer.jsp" />