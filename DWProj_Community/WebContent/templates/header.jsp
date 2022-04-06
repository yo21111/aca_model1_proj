<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/style/style_Template.css">
</head>
<body>
	<div id="wrap">
		<header id="header">

			<div id="header_member_container">
				<ul id="header_GNB_member" class="dFlex">
			<%
				if(id != null) {
					%>
					<li class="header_mainLi"><span id="userId"><%=id %> 님</span></li>
					<li class="header_mainLi"><a href="/member/logout.jsp">로그아웃</a></li>
					<li class="header_mainLi"><a href="/member/myPage.jsp">마이페이지</a></li>
					<%
				} else {
			%>	
					<li class="header_mainLi"><a href="/member/login.jsp">로그인</a></li>
					<li class="header_mainLi"><a href="/member/joinAgreement.jsp">회원가입</a></li>
			<%} %>
				</ul>
			</div>
			<!-- div#header_member_container -->

			<div id="header_title">
				<h1><a href="/index.jsp">header title</a></h1>
			</div>
			<!-- div#header_title -->

			<nav id="header_GNB">
				<ul id="header_GNB_mainMenu" class="dFlex">
					<li class="header_GNB_mainLi"><a href="/index.jsp">메인페이지로</a></li>
					<li class="header_GNB_mainLi"><a href="#">공지 게시판</a></li>
					<li class="header_GNB_mainLi"><a href="/BBS/freeBBS.jsp">자유 게시판</a></li>
					<li class="header_GNB_mainLi"><a href="#">이미지 게시판</a></li>
					<li class="header_GNB_mainLi"><a href="#">FAQ</a></li>
					<li class="header_GNB_mainLi"><a href="#">Q&A</a></li>
				</ul>
			</nav>
			<!-- nav#header_GNB -->

		</header>
	</div>
	<!--div#wrap-->
</body>
</html>