<%@page import="java.util.List"%>
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

String work = request.getParameter("work");

boolean result = false;

if ("insertPage".equals(work)) {
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	result = bDao.insertPage(id, title, content);
	if (result) {
%>
<script>
	alert("게시물 등록에 성공하였습니다.");
	location.href = "/BBS/freeBBS.jsp";
</script>
<%
} else {
%>
<script>
	alert("게시물 등록에 실패하였습니다.");
	history.back();
</script>
<%
}
	
} else if ("deletePage".equals(work)) {
int bno = Integer.parseInt(request.getParameter("bno"));

result = bDao.deletePage(bno);
if (result) {
%>
<script>
	alert("게시물이 삭제되었습니다.");
	location.href = "/BBS/freeBBS.jsp";
</script>
<%
} else {
%>
<script>
	alert("게시물 삭제에 실패하였습니다.");
	history.back();
</script>
<%
}
} else if ("updatePage".equals(work)) { 
	int bno = Integer.parseInt(request.getParameter("bno"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String pageNo = request.getParameter("pageNo");
	
	result = bDao.updatePage(bno, title, content);
	if (result) {
		%>
		<script>
			alert("게시물 재등록에 성공하였습니다.");
			location.href = "/BBS/freeBBS.jsp?pageNo=<%=pageNo %>";
		</script>
		<%
	} else {
		%>
		<script>
			alert("게시물 재등록에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
}
%>
