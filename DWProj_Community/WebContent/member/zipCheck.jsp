<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<%@page import="pack_Member.ZipcodeBean"%>
<jsp:useBean id="zipCheck" class="pack_Member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");
String check = request.getParameter("check");
String area3 = null;

List<ZipcodeBean> vlist = null;
if (check.equals("n")) {
	area3 = request.getParameter("area3");
	vlist = zipCheck.zipcodeRead(area3);
}
%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>우편번호 검색</title>
<link rel="stylesheet" href="/style/style_Zipcheck.css">
</head>
<body>
	<div id="wrap">
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td id="zipcodeInput">동 이름 입력 : <input id="area3Input"
						type="text" name="area3">
						<button id="zChkBtn" type="button">검색</button>
						<button type="button" onClick="self.close()">닫기</button></td>
				</tr>
				<tr>
					<td class="zipcodeTitleTd">※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.<br></td>
				</tr>
				<%
				if (check.equals("n")) {
					if (vlist.isEmpty()) {
				%>
				<tr>
					<td class="zipcodeTitleTd"><br>검색된 결과가 없습니다.</td>
				</tr>
				<%
				} else {
				for (int i = 0; i < vlist.size(); i++) {
					ZipcodeBean bean = vlist.get(i);
					String rZipcode = bean.getZipcode();
					String rArea1 = bean.getArea1();
					String rArea2 = bean.getArea2();
					String rArea3 = bean.getArea3();
					String rArea4 = bean.getArea4();
				%>
				<tr>
					<td class="zipcodeTd"><a href="#"
						onClick="javascript:sendAdd('<%=rZipcode%>'
        									, '<%=rArea1%>', '<%=rArea2%>', '<%=rArea3%>', '<%=rArea4%>')">
							<%=rZipcode%>&nbsp; <%=rArea1%>&nbsp; <%=rArea2%>&nbsp; <%=rArea3%>&nbsp;
							<%=rArea4%>
					</a></td>
				</tr>
				<%
				} //for
				} //if
				} //if
				%>
			</table>
			<input type="hidden" name="check" value="n">
		</form>
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>