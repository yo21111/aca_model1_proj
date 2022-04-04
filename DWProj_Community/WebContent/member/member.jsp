<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String chkVCode = request.getParameter("vCode");
	
	if(!(chkVCode != null && chkVCode.equals("chkOK1234"))) {
		response.sendRedirect("/member/joinAgreement.jsp");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="/style/style_Member.css">
</head>
<body>
<jsp:include page="/templates/header.jsp" />
	<div id="wrap">
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table>
				<tr>
					<td id="title">회원가입</td>
					<td id="info" colspan="2">* : 필수입력입니다.</td>
				</tr>
				<tr>
					<td class="td1 important">아이디</td>
					<td class="td2"><input id="idInput" type="text" name="uId"
						size="15">
						<button id="idChk" type="button">ID 중복확인</button></td>
					<td>아이디를 적어 주세요.</td>
				</tr>
				<tr>
					<td class="td1 important">패스워드</td>
					<td class="td2"><input id="pwInput" type="password" name="uPw"
						size="15"></td>
					<td>패스워드를 적어주세요.</td>
				</tr>
				<tr>
					<td class="td1 important">패스워드 확인</td>
					<td class="td2"><input id="pwChk" type="password"
						name="uPwChk" size="15"><span id="pwError"></span></td>
					<td>패스워드를 확인합니다.</td>
				</tr>
				<tr>
					<td class="td1 important">이름</td>
					<td class="td2"><input id="nameInput" type="text" name="uName"
						size="15"></td>
					<td>이름을 적어주세요.</td>
				</tr>
				<tr>
					<td class="td1">성별</td>
					<td class="td2">
					<label for="radio1"> 남 
						<input id="radio1" type="radio" name="gender" value="1" checked="checked">
					</label> 
					<label for="radio2"> 여 
						<input id="radio2" type="radio" name="gender" value="2">
					</label></td>
					<td>성별을 선택하세요.</td>
				</tr>
				<tr>
					<td class="td1 important">생년월일</td>
					<td class="td2"><input id="birthInput" type="text"
						name="uBirthday" size="6" placeholder="220101"></td>
					<td>생년월일을 적어주세요.</td>
				</tr>
				<tr>
					<td class="td1 important">Email</td>
					<td class="td2"><input id="emailInput" type="text"
						name="uEmail" size="30" placeholder="test@model1.com"></td>
					<td>이메일을 적어주세요.</td>
				</tr>
				<tr>
					<td class="td1 important">우편번호</td>
					<td class="td2"><input id="zCodeInput" type="text"
						name="uZipcode" size="7" readonly>
						<button id="zCodeChk" type="button">우편번호찾기</button></td>
					<td>우편번호를 검색하세요</td>
				</tr>
				<tr>
					<td class="td1">주소</td>
					<td class="td2"><input id="addrInput" type="text" name="uAddr"
						size="45"></td>
					<td>주소를 적어주세요.</td>
				</tr>
				<tr>
					<td class="td1">취미</td>
					<td class="td2">
						<label for="uHobby1">인터넷 
							<input id="uHobby1" type="checkbox" name="uHobby" value="인터넷"></label>
						<label for="uHobby2">여행 
							<input id="uHobby2" type="checkbox" name="uHobby" value="여행"></label> 
						<label for="uHobby3">게임 
							<input id="uHobby3" type="checkbox" name="uHobby" value="게임"></label> 
						<label for="uHobby4">영화 
							<input id="uHobby4" type="checkbox" name="uHobby" value="영화"></label> 
						<label for="uHobby5">운동 
							<input id="uHobby5" type="checkbox" name="uHobby" value="운동"></label>
					</td>
					<td>취미를 선택 하세요.</td>
				</tr>
				<tr>
					<td class="td1">직업</td>
					<td class="td2">
						<select id="jobSelect" name="uJob">
							<option value="0" selected>선택하세요.</option>
							<option value="회사원">회사원</option>
							<option value="연구전문직">연구전문직</option>
							<option value="교수학생">교수학생</option>
							<option value="일반자영업">일반자영업</option>
							<option value="공무원">공무원</option>
							<option value="의료인">의료인</option>
							<option value="법조인">법조인</option>
							<option value="종교,언론,예술인">종교/언론/예술인</option>
							<option value="농,축,수산,광업인">농/축/수산/광업인</option>
							<option value="주부">주부</option>
							<option value="무직">무직</option>
							<option value="기타">기타</option>
						</select>
					</td>
					<td>직업을 선택하세요</td>
				</tr>
				<tr>
					<td id="btnTd" colspan="3">
						<button id="regBtn" type="button">회원가입</button>
						<button id="resetBtn" type="reset">다시쓰기</button>
						<button id="loginBtn" type="button">로그인</button>
					</td>
				</tr>
			</table>

		</form>
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>
<jsp:include page="/templates/footer.jsp" />