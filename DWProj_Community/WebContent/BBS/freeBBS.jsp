<%@ page import="pack_BBS.PageHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bbsDao" class="pack_BBS.bbsBoardDao" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("/member/login.jsp?url=/BBS/freeBBS.jsp");
}

int totalPage = bbsDao.freeBBScount();
String pageNo = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");
String pageSize = request.getParameter("pageOffset") == null ? "10" : request.getParameter("pageOffset");

PageHandler ph = new PageHandler(totalPage, Integer.parseInt(pageNo), Integer.parseInt(pageSize));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<link rel="stylesheet" href="/style/style_BBS.css">
</head>
<body>
	<jsp:include page="/templates/header.jsp" />
	<div id="wrap">

		<form action="">
			<div id="bbs_header">
				<div id="header_title">
					<h2>자유게시판</h2>
				</div>
				<!-- div#header_title -->

				<div id="header_subtitle" class="dFlex">
					<p><%=totalPage%>개의 글
					</p>
					<select name="pageOffset" id="pageOffset">
						<option value="5">5개씩</option>
						<option value="10" selected>10개씩</option>
						<option value="15">15개씩</option>
						<option value="20">20개씩</option>
					</select>
				</div>
				<!-- div#header_subtitle -->
				<!-- 전체 글 갯수 -->
			</div>
			<!-- div#bbs_header -->


			<div id="bbs_main">
				<table>
					<thead>
						<tr>
							<th></th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%

						%>
					</tbody>
				</table>
			</div>
			<!-- div#bbs_main -->

			<div id="bbs_nav">
				<div id="nav_navbar">
					<%
					if (ph.isShowPrev()) {
					%>
					<a
						href="/BBS/freeBBS.jsp?pageNo=<%=ph.getBeginPage() - 1%>
					&pageSize=<%=pageSize%>">
						&lt;이전</a>
					<%
					}
					for (int i = ph.getBeginPage(); i <= ph.getEndPage(); i++) {
					%>
					<a href="/BBS/freeBBS.jsp?pageNo=<%=i%>&pageSize=<%=pageSize%>"><%=i%></a>
					<%
					}
					if (ph.isShowPrev()) {
					%>
					<a
						href="/BBS/freeBBS.jsp?pageNo=<%=ph.getEndPage() + 1%>
					&pageSize=<%=pageSize%>">
						다음&gt;</a>
					<%
					}
					%>
				</div>
				<!-- div#nav_navbar -->

				<div id="nav_search">
					<select name="searchOpt" id="searchOpt">
						<option value="C">게시글</option>
						<option value="T">제목</option>
						<option value="W">글작성자</option>
					</select> <input type="text" id="searchInput" name="searchWord"
						placeholder="검색어를 입력해주세요.">
					<button type="button" id="searchBtn">검색</button>
				</div>
				<!-- div#nav_search -->
			</div>
		</form>
		<!-- div#bbs_nav -->

	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>