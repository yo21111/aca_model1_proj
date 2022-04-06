<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="pack_Member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");

String goUrl = request.getParameter("goUrl");
String url = goUrl==null ? "/member/login.jsp" : goUrl;

String msg = "아이디 또는 비밀번호를 확인해주세요.";

boolean result = dao.loginMember(id, pass);
if(result) {
	session.setAttribute("idKey", id);
	msg = id + "님 환영합니다.";
}
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
