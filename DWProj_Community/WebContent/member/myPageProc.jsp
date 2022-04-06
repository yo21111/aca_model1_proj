<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey");
%>
<jsp:useBean id="dao" class="pack_Member.MemberDAO"/>
<jsp:useBean id="bean" class="pack_Member.Member"/>
<jsp:setProperty name="bean" property="*"/>
<%
	 boolean result = dao.updateMember(bean, id);
	 if(result) {
%>
	<script>
		alert("정보 변경이 완료되었습니다.");
		location.href="/index.jsp";
	</script>
<%
	 } else {
%>
	<script>
		alert("정보 변경에 실패하였습니다.");
		history.back();
	</script>
<%} %>