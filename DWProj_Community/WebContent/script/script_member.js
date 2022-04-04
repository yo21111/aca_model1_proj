/**
 * 
 */

$(function() {
	//---------------member.jsp 스크립트 시작---------------
	//id check 함수
	$("button#idChk").click(function() {
		let idInput = $("input#idInput").val()
		if (idInput == "") {
			alert("아이디를 입력해주세요.");
			$("input#idInput").focus();
		} else {
			let idInput = $("input#idInput").val()
			let url = "/member/idCheck.jsp?id=" + idInput;
			window.open(url, "IDCheck", "width=300, height=150");
		}
	});


	//pw check함수
	$("input#pwChk").keyup(function() {
		let pwInput = $("input#pwInput").val();
		let pwChk = $("input#pwChk").val()
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
		if ($("input#emailInput").val() == "") {
			alert("이메일을 입력해주세요.");
			$("input#emailInput").focus();
			return;
		}

		let str = $("input#emailInput").val();
		let atPos = str.indexOf("@");
		let atLastPos = str.lastIndexOf("@");
		let dotPos = str.indexOf(".");
		let spacePos = str.indexOf(" ");
		let commaPos = str.indexOf(",");
		let emailSize = str.length;

		if (atPos > 1 && atPos == atLastPos
			&& dotPos > 3 && spacePos == -1 && commaPos == -1
			&& atPos + 1 < dotPos && dotPos + 1 < emailSize);
		else {
			alert("E-mail 주소형식이 잘못되었습니다.\n\r다시 입력해주세요!");
			$("input#emailInput").focus();
			return;
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