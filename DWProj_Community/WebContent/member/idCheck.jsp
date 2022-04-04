<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style/style_Idcheck.css">
	<title>ID 중복체크</title>
</head>

<jsp:useBean id="idCheck" class="pack_Member.MemberDAO" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = idCheck.checkId(id);
%>

<body>
    <div id="wrap">
        <%
        	if (!result) {
        		out.print("<p>"+id+"는 사용가능합니다.</p>");
        	} else {
        		out.print("<p>"+id+"는 이미 존재하는 ID입니다.</p>");
        	}
        %>
        <button type="button" onClick="self.close()">닫기</button>
    </div>
    <!--div#wrap-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>