<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="pack_Member.MemberDAO"/>
<jsp:useBean id="bean" class="pack_Member.Member"/>
<jsp:setProperty name="bean" property="*"/>
<%
	 boolean result = dao.insertMember(bean);
	 if(result) {
%>
	<script>
		alert("회원가입을 하였습니다.");
		location.href="/member/login.jsp";
	</script>
<%
	 } else {
%>
	<script>
		alert("회원가입에 실패하였습니다.");
		history.back();
	</script>
<%} %>

