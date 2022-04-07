<%@page import="java.util.List"%>
<%@ page import="pack_BBS.BoardBBS" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDao" class="pack_BBS.BoardBBSDao"/>
<%
String sql = "";

// 한페이지에 보여줄 게시글 갯수
String pageSize = request.getParameter("pageOffset");

// C:게시글, T:제목, W:작성자
String searchOpt = request.getParameter("searchOpt");
switch(searchOpt) {
case "C" :
	sql = "and content like '%";
	break;
case "T" :
	sql = "and title like '%";
	break;
case "W" :
	sql = "and writer like '%";
}
// 검색어
String searchWord = request.getParameter("searchWord");

sql += searchWord + "%'";

%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>freeBBS proc</title>
  </head>
  <body>
    <form action="/BBS/freeBBS.jsp" method="post">
      <input type="hidden" name="sql" value="<%=sql%>">
      <input type="hidden" name="search" value="y">
      <input type="hidden" name="pageSize" value="<%=pageSize%>">
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
		$(function(){
			$("form").submit();
		});
    </script>
  </body>
</html>
