<%@ page import="pack_Member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:useBean id="mDao" class="pack_Member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String pageInfo = request.getParameter("pageInfo");

Member member = mDao.selectMember(id);
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
<link rel="stylesheet" href="/style/style_Member.css">
</head>
<body>
	<jsp:include page="/templates/header.jsp" />
	<div id="wrap">
		<div id="myPage_Container" class="dFlex">
			<div id="myPage_LNB">
				<ul id="myPageLNB">
					<li class="myPageLi"><a
						href="/member/myPage.jsp?pageInfo=userInfo">회원 상세정보</a></li>
					<li class="myPageLi"><a
						href="/member/myPage.jsp?pageInfo=updateInfo">회원 정보 변경</a></li>
					<li class="myPageLi"><a
						href="/member/myPage.jsp?pageInfo=userWithdraw">회원 탈퇴</a></li>
				</ul>
			</div>
			<!-- div#myPage_LNB -->

			<div id="myPage_content">
				<%
				if (pageInfo == null || pageInfo.equals("userInfo")) {
				%>
				<div class="myPage_tbl">
					<table>
						<tr>
							<td id="title" colspan="3">회원 상세정보</td>
						</tr>
						<tr>
							<td class="td1">아이디</td>
							<td><%=member.getuId()%></td>
						</tr>
						<tr>
							<td class="td1">이름</td>
							<td><%=member.getuName()%></td>
						</tr>
						<tr>
							<td class="td1">성별</td>
							<td><%=member.getGender().equals("1") ? "남" : "여"%></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td><%=member.getuEmail()%></td>
						</tr>
						<tr>
							<td class="td1">생년월일</td>
							<%
							String birth = member.getuBirthday();
							String year = birth.substring(0, 2);
							if (Integer.parseInt(year) > 22) {
								year = "19" + year;
							} else {
								year = "20" + year;
							}
							String month = birth.substring(2, 4);
							String day = birth.substring(4);
							%>
							<td><%=year + "년 " + month + "월 " + day + "일"%></td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td><%=member.getuAddr()%></td>
						</tr>
						<tr>
							<td class="td1">취미</td>
							<%
							String[] lists = { "인터넷", "여행", "게임", "영화", "운동" };
							String[] hobby = member.getuHobby();
							String uhobby = "";
							for (int i = 0; i < lists.length; i++) {
								if (hobby[i].equals("1")) {
									uhobby += (lists[i] + " ");
								}
							}
							%>
							<td><%=uhobby%></td>
						</tr>
						<tr>
							<td class="td1">직업</td>
							<td><%=member.getuJob()%></td>
						</tr>
					</table>
				</div>
				<!-- div#userInfo -->

				<%
				} else if (pageInfo.equals("updateInfo")) {
				%>
				<form name="regFrm" id="regFrm" action="/member/myPageProc.jsp" method="post">
					<div class="myPage_tbl">
						<table>
							<tbody>
								<tr>
									<td id="title" colspan="3">회원 정보 변경</td>
								</tr>
								<tr>
									<td class="td1">패스워드</td>
									<td class="td2"><input id="pwInput" type="password"
										name="uPw" size="15"><span id="pwError1"></span></td>
								</tr>

								<tr>
									<td class="td1">패스워드 확인</td>
									<td class="td2"><input id="pwChk" type="password"
										name="uPwChk" size="15"><span id="pwError"></span></td>
								</tr>

								<tr>
									<td class="td1">Email</td>
									<td class="td2"><input id="emailInput" type="text"
										name="uEmail" size="30" value="<%=member.getuEmail()%>"></td>
								</tr>

								<tr>
									<td class="td1">우편번호</td>
									<td class="td2"><input id="zCodeInput" type="text"
										name="uZipcode" size="7" value="<%=member.getuZipcode()%>">
										<button id="zCodeChk" type="button">우편번호찾기</button></td>
								</tr>

								<tr>
									<td class="td1">주소</td>
									<td class="td2"><input id="addrInput" type="text"
										name="uAddr" size="45" value="<%=member.getuAddr()%>"></td>
								</tr>

								<tr>
									<td class="td1">직업</td>
									<td class="td2"><select id="jobSelect" name="uJob">
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
									</select></td>
								</tr>

								<tr>
									<td id="btnTd" colspan="3">
										<button id="updateBtn" type="button">수정하기</button>
										<button id="resetBtn" type="reset">다시쓰기</button>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<!-- div#updateInfo -->
				</form>
				<%
				} else if (pageInfo.equals("userWithdraw")) {
				%>
				<div class="myPage_tbl">

					<table id="withdrawTbl">
						<tbody>
							<tr>
								<td id="title" colspan="3">회원 탈퇴 안내</td>
							</tr>
							<tr>
								<td>회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</td>
							</tr>

							<tr>
								<td class="td_bold">* 사용하고 계신 아이디(<%=id%>)는 탈퇴할 경우 재사용 및
									복구가 불가능 합니다.
								</td>
							</tr>
							<tr>
								<td>탈퇴한 아이디는 본인과 타인 모두 재사용 및 불가하오니 신중하게 선택하시기 바랍니다.</td>
							</tr>

							<tr>
								<td class="td_bold">* 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</td>
							</tr>
							<tr>
								<td>회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, <br>삭제된 데이터는
									복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</td>
							</tr>

							<tr>
								<td id="td_red">탈퇴 후에는 아이디 <%=id %> 로 다시 가입할 수 없으며<br> 
									아이디와 데이터는 복구할 수 없습니다. 게시판형 서비스에 남아 있는 게시글은 <br>
									탈퇴 후 삭제할 수 없습니다.</td>
							</tr>
							
							<tr>
								<td class="td_bold">
									<input id="withdrawChk" type="checkbox">
									안내 사항을 모두 확인하였으며, 이에 동의합니다.
								</td>
							</tr>

							<tr>
								<td id="withdrawBtnTd">
										<button id="deleteBtn" type="button">확인</button>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- div#userWithdraw -->
				<%
				}
				%>
			</div>
			<!-- div#myPage_content -->
		</div>
		<!-- div#myPage_Container -->
	</div>
	<!--div#wrap-->
	<jsp:include page="/templates/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>