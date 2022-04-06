<%@ page import="pack_BBS.BoardBBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bDao" class=pack_BBS.BoardBBSDao />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("/member/login.jsp?url=/BBS/freeBBS.jsp");
}

String bno = request.getParameter("bno");
String pageNo = request.getParameter("pageNo");
String pageOffset = request.getParameter("pageSize");

String readonly = request.getParameter("write");
if (readonly.equals("n")) {
	readonly = "readonly";
} else if (readonly.equals("y")) {
	readonly = "";
}

BoardBBS bbs = bDao.selectOnePage(bno);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글</title>
<link rel="stylesheet" href="/style/style_BBS.css">
</head>
<body>
	<jsp:include page="/templates/header.jsp" />
	<div id="wrap">
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td id="page_category"><%=bbs.getCategory()%></td>
					</tr>

					<tr>
						<td id="page_title"><%=bbs.getTitle()%></td>
					</tr>

					<tr>
						<td id="page_writer"><%=bbs.getWriter()%></td>
						<td id="page_write_date">
							<%=bbs.getWrite_date() %>
							<span id="view_cnt">조회 <%=bbs.getView_cnt() %></span>
						</td>
					</tr>
					
					<tr>
						<td id="content"><%=bbs.getContent() %></td>
					</tr>
					
				</tbody>
			</table>
		</form>
	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_bbs.js"></script>
</body>
</html>