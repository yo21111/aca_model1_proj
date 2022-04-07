<%@page import="pack_BBS.BoardBBS"%>
<%@page import="java.util.List"%>
<%@ page import="pack_BBS.PageHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bbsDao" class="pack_BBS.BoardBBSDao" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("/member/login.jsp?url=/BBS/freeBBS.jsp");
}

int totalPage = bbsDao.freeBBScount();
String pageNo = request.getParameter("pageNo") == null || request.getParameter("pageNo") == "" ? "1" : request.getParameter("pageNo");
String pageSize = request.getParameter("pageOffset") == null || request.getParameter("pageOffset") == "" ? "10" : request.getParameter("pageOffset");

int pNo = Integer.parseInt(pageNo);
int pSize = Integer.parseInt(pageSize);

PageHandler ph = new PageHandler(totalPage, pNo, pSize);

List<BoardBBS> bList = null;
if (request.getParameter("search") == null) {
	bList = bbsDao.selectFreeBBSList(Integer.parseInt(pageNo), Integer.parseInt(pageSize), "");
} else {
	pageSize = request.getParameter("pageSize");
	String sql = request.getParameter("sql");
	bList = bbsDao.selectFreeBBSList(Integer.parseInt(pageNo), Integer.parseInt(pageSize), sql);
}
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

		<form action="/BBS/freeBBSproc.jsp" id="bbsFrm">
			<div id="bbs_header">
				<div id="header_title">
					<h2>자유게시판</h2>
				</div>
				<!-- div#header_title -->

				<div id="header_subtitle" class="dFlex">
					<div id="subtitle_info">
						<p><%=totalPage%> 개의 글</p>
					</div> <!-- div#subtitle_info -->
	
					<div id="subtitle_util">
						<select name="pageOffset" id="pageOffset">
							<option value="5">5개씩</option>
							<option value="10" selected>10개씩</option>
							<option value="15">15개씩</option>
							<option value="20">20개씩</option>
						</select>
						<button type="button" id="writeBtn">글쓰기</button>
					</div>
					<!-- div#subtitle_util -->
				</div>
				<!-- div#header_subtitle -->
				<!-- 전체 글 갯수 -->
			</div>
			<!-- div#bbs_header -->


			<div id="bbs_main">
				<table>
					<thead>
						<tr>
							<th colspan="2">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
						if(bList.size() == 0) {
							%>
							<tr>
								<td colspan="5">검색된 결과가 없습니다.</td>
							</tr>
							<%
						} else {
							for(int i = 0; i < bList.size(); i++) {
								BoardBBS bbs = bList.get(i);
							%>
							<tr>
								<td><%=bbs.getBno() %></td>
								<td>
									<a class="td_title" href="/BBS/board.jsp?bno=<%=bbs.getBno() %>&pageNo=<%=pageNo %>&pageSize=<%=pageSize %>&write=n">
										<%=bbs.getTitle() %>
									</a>
								</td>
								<td><%=bbs.getWriter() %></td>
								<%String writeDate = bbs.getWrite_date().split(" ")[0]; %>
								<td><%=writeDate %></td>
								<td><%=bbs.getView_cnt() %></td>
							</tr>
							<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
			<!-- div#bbs_main -->

			<div id="bbs_nav">
				<div><input type="hidden" id="hideInput" value="<%=pageNo %>"></div>
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
					<a id="pageNo<%=i%>" href="/BBS/freeBBS.jsp?pageNo=<%=i%>&pageSize=<%=pageSize%>"><%=i%></a>
					<%
					}
					if (ph.isShowNext()) {
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

				<div id="nav_search" class="dFlex">
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
	<script src="/script/script_bbs.js"></script>
</body>
</html>