/**
 * 
 */

$(function() {
	//---------------myPage.jsp 스크립트 시작---------------
	$("input#pwChk").keyup(function() {
		let pwInput = $("input#pwInput").val();
		let pwChk = $("input#pwChk").val();

		if (pwInput == pwChk) {
			$("span#pwError").css("color", "green");
			$("span#pwError").text("    * 올바른 입력입니다.");
		} else {
			$("span#pwError").css("color", "red");
			$("span#pwError").text("    * 잘못된 입력입니다. 다시 입력해주세요.");
		}
	});

	//회원 정보변경 버튼
	$("button#updateBtn").click(function() {
		if ($("input#pwInput").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("input#pwInput").focus();
			return;
		}
		if ($("input#pwChk").val() == "") {
			alert("비밀번호를 다시 확인해주세요.");
			$("input#pwChk").focus();
			return;
		}
		if ($("input#emailInput").val() == "") {
			alert("이메일을 입력해주세요.");
			$("input#emailInput").focus();
			return;
		}

		if ($("input#zCodeInput").val() == "") {
			alert("우편번호를 입력해주세요.");
			return;
		}

		if ($("select#jobSelect").val() == "0") {
			alert("직업을 선택해주세요.");
			$("select#jobSelect").focus();
			return;
		}

		$("form#regFrm").submit();

	});

	// 회원 탈퇴 버튼

	$("button#deleteBtn").click(function() {
		if ($("input#withdrawChk").is(":checked") == true) {
			location.href = "/member/withdrawProc.jsp";
		} else {
			alert("동의 여부를 확인해주세요.");
		}
	});

	//---------------myPage.jsp 스크립트 끝---------------


	//---------------member.jsp 스크립트 시작---------------

	//id check 함수
	$("button#idChk").click(function() {
		let idInput = $("input#idInput").val();
		$("input#idInput").val(idInput);

		let regExp = /[^a-z|A-Z|0-9]/g;
		let rExpRes = regExp.test(idInput);

		if (rExpRes) {
			alert("아이디는 영어 대/소문자와 숫자만 가능합니다.");
			return;
		}

		if (idInput == "") {
			alert("아이디를 입력해주세요.");
			$("input#idInput").focus();
		} else {
			let idInput = $("input#idInput").val().trim();
			let url = "/member/idCheck.jsp?id=" + idInput;
			let nickName = "IDCheck";


			let w = screen.width;
			let popWidth = 300;
			let leftPos = (w - popWidth) / 2;

			let h = screen.height;
			let popHeight = 150;
			let topPos = (h - popHeight) /  2;

			let prop = "width=" +  popWidth + ", height="  + popHeight + ", left=" + leftPos + ", top="  + topPos;
			window.open(url, nickName, prop);

		}
	});


	//pw Input 함수
	$("input#pwInput").keyup(function() {
		let pwInput = $("input#pwInput").val()
		let regExp = /[^a-z|A-Z|0-9]/g;
		let rExpRes = regExp.test(pwInput);

		if (rExpRes) {
			alert("비밀번호는 영어 대/소문자와 숫자만 가능합니다.");
			return;
		}
	});

	//pw check함수
	$("input#pwChk").keyup(function() {
		let pwInput = $("input#pwInput").val();
		$("input#pwInput").val(pwInput);
		let pwChk = $("input#pwChk").val();
		$("input#pwChk").val(pwChk);

		if (pwInput == pwChk) {
			$("span#pwError").css("color", "green");
			$("span#pwError").text("    * 올바른 입력입니다.");
		} else {
			$("span#pwError").css("color", "red");
			$("span#pwError").text("    * 잘못된 입력입니다. 다시 입력해주세요.");
		}
	});

	//zipcode check 함수
	$("button#zCodeChk").click(function() {
		url = "/member/zipCheck.jsp?check=y";
		window.open(url, "ZipCodeSearch", "width=600, height=350, scrollbars=yes");
	});

	//email 관련 함수
	$("select#emailSelect").change(function() {
		let select = $("select#emailSelect").val().trim();
		if (select != 0) {
			$("input#emailInput2").val(select);
		} else if (select == 0) {
			$("input#emailInput2").val("");
		}
	});


	//회원가입 버튼
	$("button#regBtn").click(function() {
		if ($("input#idInput").val() == "") {
			alert("아이디를 입력해주세요.");
			$("input#idInput").focus();
			return;
		}
		if ($("input#pwInput").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("input#pwInput").focus();
			return;
		}
		if ($("input#pwChk").val() == "") {
			alert("비밀번호를 다시 확인해주세요.");
			$("input#pwChk").focus();
			return;
		}
		if ($("input#nameInput").val() == "") {
			alert("이름을 입력해주세요.");
			$("input#nameInput").focus();
			return;
		}
		if ($("input#birthInput").val() == "") {
			alert("생년월일을 입력해주세요.");
			$("input#birthInput").focus();
			return;
		}

		if ($("input#emailInput1").val() == "") {
			alert("E-mail 주소형식이 잘못되었습니다.\n\r다시 입력해주세요!");
			$("input#emailInput1").focus();
			return;
		} else if ($("input#emailInput2").val() == "") {
			alert("E-mail 주소형식이 잘못되었습니다.\n\r다시 입력해주세요!");
			$("input#emailInput2").focus();
			return;
		} else {
			let email1 = $("input#emailInput1").val().trim();
			let email2 = $("input#emailInput2").val().trim();
			$("input#emailHidden").val(email1 + "@" + email2);
		}

		if ($("input#zCodeInput").val() == "") {
			alert("우편번호를 검색해주세요.");
			return;
		}

		if (document.regFrm.uJob.value == "0") {
			alert("직업을 선택해주세요.");
			$("select#jobSelect").focus();
			return;
		}

		$("form").submit();

	});

	//로그인 버튼
	$("button#loginBtn").click(function() {
		location.href = "/member/login.jsp";
	});

	//리셋 버튼
	$("button#resetBtn").click(function() {
		$("input#idInput").focus();
	});



	//---------------member.jsp 스크립트 끝---------------



	//---------------zipCheck.jsp 스크립트 시작---------------
	$("button#zChkBtn").click(function() {
		let frm = document.zipFrm;
		if ($("input#area3Input").val() == "") {
			alert("동 이름을 입력하세요.");
			$("input#area3Input").focus();
		} else {
			frm.action = "/member/zipCheck.jsp";
			frm.submit();
		}

	});
});

function sendAdd(zipcode, area1, area2, area3, area4) {
	add = area1 + " " + area2 + " " + area3 + " " + area4 + " ";
	opener.document.regFrm.uZipcode.value = zipcode;
	opener.document.regFrm.uAddr.value = add;
	self.close();
}
	//---------------zipCheck.jsp 스크립트 끝---------------