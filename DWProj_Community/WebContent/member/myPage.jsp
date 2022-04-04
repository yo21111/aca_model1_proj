<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String pageInfo = request.getParameter("pageInfo");
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
<link rel="stylesheet" href="/style/style_Member.css">
</head>
<body>
	<jsp:include page="/templates/header.jsp" />
	<div id="wrap">
		<div id="myPage_Container" class="dFlex">
			<div id="myPage_LNB">
				<ul id="myPageLNB">
					<li class="myPageLi">
						<a href="/member/myPage.jsp?pageInfo=userInfo">회원 상세정보</a>
					</li>
					<li class="myPageLi">
						<a href="/member/myPage.jsp?pageInfo=updateInfo">회원 정보 변경</a>
					</li>
					<li class="myPageLi">
						<a href="/member/myPage.jsp?pageInfo=userWithdraw">회원 탈퇴</a>
					</li>
				</ul>
			</div>
			<!-- div#myPage_LNB -->
			
			<div id="myPage_content">
			<%if(pageInfo==null || pageInfo.equals("userInfo")) {%>
				<div id="userInfo">
					userInfo 입니다.
				</div>
				<!-- div#userInfo -->
				
			<%} else if (pageInfo.equals("updateInfo")) {%>
				<div id="updateInfo">
					updateInfo 입니다.
				</div>
				<!-- div#updateInfo -->
				
			<%} else if(pageInfo.equals("userWithdraw")) {%>
				<div id="userWithdraw">
					userWithdraw 입니다.
				</div>
				<!-- div#userWithdraw -->
			<%} %>
			</div>
			<!-- div#myPage_content -->
		</div>
		<!-- div#myPage_Container -->
	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>