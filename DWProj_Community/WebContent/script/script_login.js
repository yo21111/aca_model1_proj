/**
 * 
 */


$(function() {
	/*--------------- login.jsp 시작 ---------------*/
	// 메인페이지로 이동
	$("button#index").click(function() {
		location.href = "/index.jsp";
	});

	//로그아웃 페이지로 이동
	$("button#logout").click(function() {
		location.href = "/member/logout.jsp";
	});

	// 마이페이지로 이동
	$("button#myPage").click(function() {
		location.href = "/member/myPage.jsp";
	});

	// 로그인 버튼
	$("button#loginBtn").click(function() {
		if ($("input#id").val() == "") {
			$("td#errorMsg").css("color", "red");
			$("td#errorMsg").text("아이디를 입력해주세요.");
			$("input#id").focus();
			return;
		} else if ($("input#pass").val() == "") {
			$("td#errorMsg").css("color", "red");
			$("td#errorMsg").text("비밀번호를 입력해주세요.");
			$("input#pass").focus();
			return;
		}
		$("form").submit();
	});

	// 회원가입 페이지로 이동
	$("button#regPage").click(function() {
		location.href = "/member/member.jsp";
	});
	/*--------------- login.jsp 끝 ---------------*/

});