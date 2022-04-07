<%@ page import="pack_BBS.BoardBBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bDao" class="pack_BBS.BoardBBSDao" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("/member/login.jsp?url=/BBS/freeBBS.jsp");
}

String bno = request.getParameter("bno");
String pageNo = request.getParameter("pageNo") == null || request.getParameter("pageNo") == "" ? "1"
		: request.getParameter("pageNo");
String pageOffset = request.getParameter("pageSize");

String write = request.getParameter("write");

String type = "text";

String readonly = request.getParameter("write");
if ("n".equals(readonly)) {
	readonly = "readonly";
} else if ("y".equals(readonly)) {
	readonly = "placeholder=\"여기에 입력해주세요\"";
	type = "hidden";
}

BoardBBS bbs;

if (bno == null) {
	bbs = bDao.selectOnePage("0");
} else {
	bbs = bDao.selectOnePage(bno);
	bDao.increaseViewCnt(bbs.getView_cnt(), Integer.parseInt(bno));
}

String title = bbs.getTitle();
String writer = bbs.getWriter();
String content = bbs.getContent();

if (title == null) {
	title = "";
}
if (writer == null) {
	writer = id;
}
if (content == null) {
	content = "";
}

String pageNum = bbs.getBno() == 0 ? "" : bbs.getBno()+""; 

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
		<form id="boardFrm" method="post">
			<table>
				<tbody>
					<tr>
						<td id="page_bno"><input type="text" class="subInput"
							value="<%=pageNum %>" readonly></td>
						<td id="page_category" colspan="2"><input type="text" class="subInput"
							value="카테고리 : 자유게시판" readonly></td>
					</tr>

					<tr>
						<td id="page_title" colspan="3"><input type="text"
							id="titleInput" name="title" value="<%=title%>" <%=readonly%>>
						</td>
					</tr>

					<tr id="utilTr">
						<td id="page_writer"><input type="text" class="subInput"
							value="작성자 : <%=writer%>" readonly></td>

						<td id="page_write_date"><input type="<%=type%>"
							class="subInput" value="작성일 : <%=bbs.getWrite_date()%>" readonly>
						</td>
						<td><input type="<%=type%>" class="subInput"
							value="조회 <%=bbs.getView_cnt()%>" readonly></td>
					</tr>

					<tr>
						<td id="contentTd" colspan="3"><textarea id="content"
								name="content" <%=readonly%>><%=content%></textarea></td>
					</tr>

					<tr>
						<td id="btnTd" colspan="3">
							<%
							if ("n".equals(write)) {
								if (id.equals(bbs.getWriter())) {
									// 게시글 작성자가 글을 읽을 때
							%>
							<button id="writeBtn" type="button">글쓰기</button>
							<button id="updateBtn" type="button">수정</button>
							<button id="listBtn" type="button">목록</button>
							<button id="deleteBtn" type="button">삭제</button> <%
 } else {
 // 게시글 작성자 외 글을 읽을 때
 %>
							<button id="writeBtn" type="button">글쓰기</button>
							<button id="listBtn" type="button">목록</button> <%
 }
 } else if ("y".equals(write)) {
 // 글쓰기 버튼을 눌러서 들어왔을 때
 %>
 	<%
 		String updateChk = request.getParameter("update");
 		if ("y".equals(updateChk)) {
 			%>
							<button id="updateFinBtn" type="button">완료</button>
 			<%
 		} else {
 		%>  
							<button id="insertBtn" type="button">등록</button>
 		<%} %>
							<button id="resetBtn" type="reset">다시쓰기</button>
							<button id="listBtn" type="button">목록</button> <%
 }
 %>
						</td>
					</tr>

					<tr>
						<td><input type="hidden" id="hideInput" value="<%=pageNo%>"></td>
					</tr>
				</tbody>
			</table>
		</form>
		</form>
	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_bbs.js"></script>
</body>
</html>