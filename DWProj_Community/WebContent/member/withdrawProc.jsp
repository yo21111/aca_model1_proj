<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey");
%>
<jsp:useBean id="dao" class="pack_Member.MemberDAO"/>
<%
	 boolean result = dao.deleteMember(id);
	 if(result) {
		 session.invalidate();
%>
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href="/index.jsp";
	</script>
<%
	 } else {
%>
	<script>
		alert("회원탈퇴에 실패하였습니다.");
		history.back();
	</script>
<%} %>